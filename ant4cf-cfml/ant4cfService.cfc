<cfcomponent output="false">

	<cfparam name="application.sessions" default="#ArrayNew(1)#" />
    <!--- if a thread hangs for 45 seconds we'll kill it --->
    <cfset variables.defaultThreadKillTimeout = 45000 />
	
	<cffunction name="startRemoteRun" access="remote" hint="I start the process of running a build file remotely." output="false" returntype="string" returnformat="plain">
		<cfargument name="buildXml" hint="I am the xml of the build file being run remotely." required="true" type="xml" />
		<cfargument name="adminPassword" hint="The cfide password" required="true" type="string" />
		<cfargument name="adminUserId" hint="The cfide userId" required="false" type="string" />
		<cfset var session = CreateObject("component", "session") />
		<cfset var loggedIn = 0 />
		
		<!--- try to log the user in --->
		<cfinvoke component="cfide.adminapi.administrator" method="login" returnvariable="loggedIn">
			<cfinvokeargument name="adminPassword" value="#arguments.adminPassword#" />
			<cfif StructKeyExists(arguments, "adminUserId")>
				<cfinvokeargument name="adminUserId" value="#arguments.adminUserId#" />
			</cfif>
		</cfinvoke>
		
		<cfif NOT loggedIn>
			<cfreturn "Failed" />
		<cfelse>
			<cfset session.setBuildXml(arguments.buildXml) />
		
			<cfset ArrayAppend(application.sessions, session) /> 
		
			<!--- create the directory in which the ant file will be run --->
			<cfdirectory action="create" directory="#expandPath(session.getSessionId() & "/antlib")#" />
			<!--- write the build xml into that directory --->
			<cffile action="write" file="#expandPath(session.getSessionId() & "/build.xml" )#" output="#session.getBuildXml()#" />
			
			<cfreturn session.getSessionId() />
		</cfif>
	</cffunction>

	<cffunction name="useLib" access="remote" hint="I attempt to associate a lib file with this remote exectuion.  If the lib doesn't exist this returns false, otherwise true." output="false" returntype="boolean" returnformat="plain">
		<cfargument name="sessionId" required="true" type="string" hint="I am the sessionId used to get the session." />
		<cfargument name="libFile" required="true" type="string" hint="I am the name of the lib file" />
		<cfargument name="libHash" required="true" type="string" hint="I am the hash of the lib file" />
		<cfset var session = getSession(arguments.sessionId) />
		
		<!--- insure the libcache directory exists --->
		<cfif NOT DirectoryExists(expandPath("libcache"))>
			<cfdirectory action="create" directory="#expandPath("libcache")#" />
		</cfif>
		
		<cfif fileExists(expandPath("libcache/#arguments.libHash#") )>
			<!--- copy this file into the antlib directory for this session --->
			<cffile action="copy" source="#expandPath("libcache/#arguments.libHash#")#" destination="#expandPath(session.getSessionId() & "/antlib/" & arguments.libFile )#" />
			
			<cfreturn "true" />
		<cfelse>
			<cfreturn "false" />
		</cfif>

	</cffunction>

	<cffunction name="uploadLib" access="remote" hint="I upload a lib for use with this remote execution" output="false" returntype="void">
		<cfargument name="sessionId" required="true" type="string" hint="I am the sessionId used to get the session." />
		<cfargument name="lib" required="true" type="string" hint="I am a reference to an uploaded file" />
		<cfset var session = getSession(arguments.sessionId) />
		<cfset var data = 0 />
		<cfset var MessageDigest = CreateObject("Java", "java.security.MessageDigest").getInstance("MD5") />
		<cfset var hash = 0 />
		
		<!--- upload the lib --->
		<cffile action="upload" filefield="lib" destination="#expandPath(session.getSessionId() & "/antlib/" )#" />
				
		<!--- read the file and get its hash --->
		<cffile action="readbinary" file="#expandPath(session.getSessionId() & "/antlib/" & cffile.ServerFile)#" variable="data" />
		
		<!--- get a hash of the file contents --->
		<cfset hash = ToBase64(MessageDigest.digest(data)) />
		
		<!--- write the file into the cache --->
		<cffile action="copy" source="#expandPath(session.getSessionId() & "/antlib/" & cffile.ServerFile)#" destination="#expandPath("libcache/" & hash)#" />
	</cffunction>
	
	<cffunction name="getProperty" access="private" hint="I read a property from the config.properties file." output="false" returntype="string">
		<cfargument name="property" />
		<cfset var Properties = CreateObject("java", "java.util.Properties").init() />
		<cfset var FileInputStream = CreateObject("java", "java.io.FileInputStream").init(expandPath("config.properties")) />
		<cfset properties.load(FileInputStream) />
		
		<cfreturn Properties.getProperty(arguments.property) />
	</cffunction>

	<cffunction name="runRemoteTarget" access="remote" hint="I run the remote target specified against the xml for the specified session" output="true" returntype="void">
		<cfargument name="sessionId" required="true" type="string" hint="I am the sessionId used to get the session." />
		<cfargument name="target" required="true" type="string" hint="I am the target to run." />
		<cfargument name="debug" required="true" type="boolean" hint="I indicate if debug output should be shown" />
		<cfargument name="properties" required="true" type="string" hint="I am a JSON encoded collection of arguments we need to pass into ant" />
		<cfargument name="timeout" required="true" type="numeric" hint="I am the number of seconds to lock this process" />
		
		<cfset var session = getSession(arguments.sessionId) />
		<cfset var pathToAnt = getProperty("pathToAnt") />
		<cfset var contextDirectory = CreateObject("Java", "java.io.File").init(expandPath(arguments.sessionId)) />
		<cfset var args = DeserializeJSON(arguments.properties) />
		<cfset var antCommand = "#pathToAnt# #arguments.target# -lib " & getLibs(session) & " " & getArgs(args)  />
		<cfset var Runtime = 0 />
		<cfset var InputStreamReader = 0 />
		<cfset var BufferedReader = 0 />
		<cfset var thread = CreateObject("java", "java.lang.Thread")>
		
        
		<cfcontent reset="true" /><cfsetting enablecfoutputonly="true" />
		
		<cfif arguments.debug>
			<cfoutput>
Remote Debug Information...
	SessionId: #arguments.sessionId#
	Target: #arguments.target#
	Properties: #args.toString()#
	Executed In Directory: #contextDirectory.toString()#
	Ran Command: #antCommand#
			</cfoutput>
		</cfif>
		
		<!---
			Apparently cfexecute (before 8.0.1) doesn't gather stderr output.  This appears to be a standard where
			processes can return error messages.  cfexecute only returns stdout.  To get arround this I wrote my 
			own process to run the executable.
		--->
		<cfset Runtime = CreateObject("java", "java.lang.Runtime").getRuntime() />
		<cfset Process = Runtime.exec(antCommand, JavaCast("null", ""), contextDirectory) />
		
		<!--- read the output --->
		<cfset InputStreamReader = CreateObject("java", "java.io.InputStreamReader").init(Process.getInputStream()) />
		<cfset BufferedReader = CreateObject("java", "java.io.BufferedReader").init(InputStreamReader) />
		<cfset read(BufferedReader, sessionId, "output") />
        
		<!--- read the errors --->
		<cfset InputStreamReader = CreateObject("java", "java.io.InputStreamReader").init(Process.getErrorStream()) />
		<cfset BufferedReader = CreateObject("java", "java.io.BufferedReader").init(InputStreamReader) />
		<cfset read(BufferedReader, sessionId, "error") />
       
		<!--- try to delete our temp directory till it's gone --->
		<cfloop condition="true">
			<cftry>
				<!--- clean up --->
				<cfdirectory action="delete" directory="#expandPath(session.getSessionId())#" recurse="true" />
				<cfbreak />
				<cfcatch>
Temp directory locked, waiting for unlock...
					<!--- directory is likely locked --->
					<cfset thread.sleep(500) />
				</cfcatch>
			</cftry>
		</cfloop>
			
		
	</cffunction>
    
    <!--- this convoluted code is here because on some platforms Process.exec() does not end cleanly and causes the entire process to hang forever. 
		by forking each readline into a thread I can watch that thread to see if it's hung and kill it if needed --->
    <cffunction name="read" access="private" output="true" returntype="void">
    	<cfargument name="BufferedReader" />
        <cfargument name="sessionId" />
        <cfargument name="id" />        
        <cfset var line = 0 />
        <cfset var threadId = 0 />
        <cfset var thisThread = 0 />
        
        <cfloop condition="true">
        	<cfset threadId = threadId+1 />
			<cfthread action="run" name="#id#-#sessionId#-#threadId#" BufferedReader="#BufferedReader#">            	
				<cfset thread.finished = false />
                <cfset line = BufferedReader.readLine() />
                
                <cfif IsDefined("line")>
					<cfset thread.line = line />
                <cfelse>
                	<cfset thread.finished = true />
                </cfif>
                
                <!---
                <cfdump var="#thread#" />
                <cfabort />
                --->
			</cfthread>
			<cfthread action="join" name="#id#-#sessionId#-#threadId#" timeout="#variables.defaultThreadKillTimeout#" />
			<cfset thisThread = cfthread["#id#-#sessionId#-#threadId#"] />
            
            <!--- check to see if this thread is still running... if so, terminate it --->
            <cfif thisThread.status IS "RUNNING">
            	<cfthread action="terminate" name="#id#-#sessionId#-#threadId#" />
                <!--- <cfdump var="#thisThread#" />
                <cfabort /> --->
                <!--- 'cause the thread borked we know we're done reading data --->
                <cfbreak />
            </cfif>
            
			<cfif thisThread.finished>
            	<cfbreak />
            </cfif>    
            
			<cfoutput>#thisThread.line##chr(13)##chr(10)#</cfoutput><cfflush />
        </cfloop>
        
        <!--- try to close the buffered reader --->
        <cfthread action="run" name="#id#-#sessionId#-#threadId#-close" BufferedReader="#BufferedReader#">            
        	<cfset BufferedReader.close() />
        </cfthread>
        <cfthread action="join" name="#id#-#sessionId#-#threadId#-close" timeout="#variables.defaultThreadKillTimeout#" />
        <cfset thisThread = cfthread["#id#-#sessionId#-#threadId#-close"] />
        <!--- check to see if this thread is still running... if so, terminate it --->
        <cfif thisThread.status IS "RUNNING">
            <cfthread action="terminate" name="#id#-#sessionId#-#threadId#-close" />
            <!--- 'cause the thread borked we know we're done reading data --->
            <cfbreak />
        </cfif>
    </cffunction>
	
    
	<cffunction name="getLibs" access="private" output="false" returntype="string">
		<cfargument name="session" required="true" type="any" hint="I am the session." />
		<cfset var libs = 0 />
		<cfset var result = "" />
		
		<cfdirectory action="list" directory="#expandPath(arguments.session.getSessionId() & "/antlib/")#" name="libs" filter="*.jar" />
		
		<cfloop query="libs">
			<cfset result = ListAppend(result, "antlib/" & libs.name, ":") />
		</cfloop>
		
		<cfreturn result />
	</cffunction>
	 
	
	<cffunction name="getArgs" access="private" output="false" returntype="string">
		<cfargument name="args" />
		<cfset var result = "" />
		<cfset var arg = 0 />
		<cfloop collection="#arguments.args#" item="arg">
			<cfset result &="-D#arg#=""#arguments.args[arg]#"" " />
		</cfloop>
		
		<cfreturn result />
	</cffunction>
	
	<cffunction name="getSession" access="private" output="false" returntype="Session">
		<cfargument name="sessionId" required="true" type="string" hint="I am the sessionId used to get the session." />
		<cfset var x = 0 />
		<cfset var Session = 0 />

		<!--- delete expired elements --->
		<cfloop from="#ArrayLen(application.sessions)#" to="1" step="-1" index="x">
			<cfif application.sessions[x].isExpired()>
				<cfset ArrayDeleteAt(application.sessions, x) />
			</cfif>
		</cfloop>

		<!--- find the session --->
		<cfloop from="1" to="#ArrayLen(application.sessions)#" index="x">
			<cfif application.sessions[x].getSessionId() IS arguments.sessionId>
				<!--- reset the time we have for an expiration --->
				<cfset application.sessions[x].resetExpires() />
				<cfreturn application.sessions[x] />
			</cfif>
		</cfloop>

		<cfthrow message="Couldn't find session" detail="The session specified was not found." />
	</cffunction>	

</cfcomponent>
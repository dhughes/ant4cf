<cflock type="exclusive" timeout="1600">
	<!--- parse the url arguments --->
	<cfset arguments = "" />
	<cfloop collection="#url#" item="var">
		<cfif var IS NOT "antPath">
			<cfset arguments = ListAppend(arguments, "-D#var#=#url[var]#" , " ") />
		</cfif>
	</cfloop>
	
	<!---
		Apparently cfexecute (before 8.0.1) doesn't gather stderr output.  This appears to be a standard where
		processes can return error messages.  cfexecute only returns stdout.  To get arround this I wrote my 
		own process to run the executable.
	--->
	<cfset Runtime = CreateObject("java", "java.lang.Runtime").getRuntime() />
	<cfif server.os.name CONTAINS "windows">
		<cfset exe = "ant.bat" />
	<cfelse>
		<cfset exe = "ant" />
	</cfif>
	<cfset Process = Runtime.exec("#url.antPath##exe# -f #expandPath('../build.xml')# #url.target# #arguments#") />
	
	<cfset output = "" />
	
	<!--- read the output --->
	<cfset InputStreamReader = CreateObject("java", "java.io.InputStreamReader").init(Process.getInputStream()) />
	<cfset BufferedReader = CreateObject("java", "java.io.BufferedReader").init(InputStreamReader) />
	<cfloop condition="true">
		<cfset line = BufferedReader.readLine() />
		
		<cfif IsDefined("line")>
			<cfset output = output & line & chr(13) & chr(10) />
		<cfelse>
			<cfbreak> 
		</cfif>
	
	</cfloop>
	
	<!--- read errors --->
	<cfset InputStreamReader = CreateObject("java", "java.io.InputStreamReader").init(Process.getErrorStream()) />
	<cfset BufferedReader = CreateObject("java", "java.io.BufferedReader").init(InputStreamReader) />
	<cfloop condition="true">
		<cfset line = BufferedReader.readLine() />
		
		<cfif IsDefined("line")>
			<cfset output = output & line & chr(13) & chr(10) />
		<cfelse>
			<cfbreak> 
		</cfif>
	
	</cfloop>
</cflock>
	
<cfcontent reset="true" /><cfoutput>#output#</cfoutput>
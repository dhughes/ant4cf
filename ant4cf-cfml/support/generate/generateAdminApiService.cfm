<!--- this is a script that generates the java classes and the remote proxies --->

<!--- get the version of CF we're running on --->
<cfset version = Replace(ListDeleteAt(server.coldfusion.ProductVersion, 4), ",", "", "all") />

<!--- get a list of admin api components --->
<cfdirectory action="list" directory="#expandPath("/CFIDE/adminapi")#" name="adminApiList" filter="*.cfc" />

<!--- loop over the components --->
<cfloop query="adminApiList">
	<!--- get the component metadata --->
	<cfset componentName = ListFirst(adminApiList.name, ".") />
	
	<cfif componentName IS NOT "base">
		
	<cfset component = getComponentMetadata("CFIDE.adminapi.#ListFirst(adminApiList.name, ".")#") />
	
	<!--- generate the remote proxy --->
	<cfoutput>
	<cfsavecontent variable="remoteProxy">
[cfcomponent output="false"]
	<cfloop from="1" to="#ArrayLen(component.functions)#" index="x">
		<cfif NOT StructKeyExists(component.functions[x], "access") OR  component.functions[x].access IS "public">		
	[cffunction name="#component.functions[x].name#" access="remote" output="false" returnformat="plain"]
		<!--- <cfif structKeyExists(component.functions[x], "returntype")>returntype="#component.functions[x].returntype#"</cfif> --->
		<cfif component.functions[x].name IS NOT "login">
			[cfargument name="adminPassword" type="any" required="true"]
			[cfargument name="adminUserId" type="any" required="false"]
		</cfif>
		<cfloop from="1" to="#ArrayLen(component.functions[x].parameters)#" index="y">
			<cfif component.functions[x].parameters[y].name IS NOT "adminPassword" AND component.functions[x].parameters[y].name IS NOT "adminUserId">
				[cfargument name="#component.functions[x].parameters[y].name#" <cfif structKeyExists(component.functions[x].parameters[y], "type")>type="<cfif component.functions[x].parameters[y].type IS "array">string<cfelse>#component.functions[x].parameters[y].type#</cfif>"</cfif> <cfif structKeyExists(component.functions[x].parameters[y], "required")>required="#component.functions[x].parameters[y].required#"</cfif>]
			</cfif>
		</cfloop>
		
		[cfset var result = 0 /]
				
		[!--- convert datatypes ---]
		<cfloop from="1" to="#ArrayLen(component.functions[x].parameters)#" index="y">
			<cfif structKeyExists(component.functions[x].parameters[y], "type") AND component.functions[x].parameters[y].type IS "array">
				[cfset arguments.#component.functions[x].parameters[y].name# = ListToArray(arguments.#component.functions[x].parameters[y].name#) /]
			</cfif>
		</cfloop>
		
		[!--- first call administrator login ---]
		[cfif StructKeyExists(arguments, "adminUserId")]
			[cfset CreateObject("component", "CFIDE.adminapi.administrator").login(arguments.adminPassword, arguments.adminUserId)]
		[cfelse]
			[cfset CreateObject("component", "CFIDE.adminapi.administrator").login(arguments.adminPassword)]
		[/cfif]
		
		[cftry]
			[cfset result = CreateObject("component", "CFIDE.adminapi.#componentName#").#component.functions[x].name#(argumentCollection=arguments)]
			[cfcatch]
				[cfsavecontent variable="result"][cfdump var="##cfcatch##" format="text"][/cfsavecontent]
				[cfset result = "**EXCEPTION**##cfcatch##" /] 
			[/cfcatch]
		[/cftry]
		
		[cfif IsDefined("result")]
			[cfif NOT IsSimpleValue(result)]
				[cfsavecontent variable="result"][cfdump var="##result##" format="text"][/cfsavecontent]
			[/cfif]
		
			[cfreturn result /]
		[/cfif]
		
	[/cffunction]
		</cfif>
	</cfloop>
[/cfcomponent]
	</cfsavecontent>
	</cfoutput>

	<cfset remoteProxy = replace(remoteProxy, "[", "<", "all") />
	<cfset remoteProxy = replace(remoteProxy, "]", ">", "all") />
	
	<!--- create the output directory, if needed --->
	<cfif NOT DirectoryExists(expandPath("../../services/adminapi/#version#/"))>
		<cfdirectory action="create" directory="#expandPath("../../services/adminapi/#version#/")#" />
	</cfif>
	
	<cffile action="write" file="#expandPath("../../services/adminapi/#version#/#componentName#Proxy.cfc")#" nameconflict="overwrite" mode="777" output="#remoteProxy#" />
	
	</cfif>
</cfloop>


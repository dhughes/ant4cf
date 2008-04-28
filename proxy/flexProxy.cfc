
<cfcomponent output="false">
	
				
	<cffunction name="setProperty" access="remote" output="false">
		
		
			<cfargument name="adminPassword" type="any" required="true">
			<cfargument name="adminUserId" type="any" required="false">
		
		
			
				<cfargument name="propertyName"  required="Yes">
			
		
			
				<cfargument name="propertyValue"  required="Yes">
			
		
		
		<cfset var result = 0 />
		
		<!--- first call administrator login --->
		<cfif StructKeyExists(arguments, "adminUserId")>
			<cfset CreateObject("component", "CFIDE.adminapi.administrator").login(arguments.adminPassword, arguments.adminUserId)>
		<cfelse>
			<cfset CreateObject("component", "CFIDE.adminapi.administrator").login(arguments.adminPassword)>
		</cfif>
		
		<cftry>
			<cfset result = CreateObject("component", "CFIDE.adminapi.flex").setProperty(argumentCollection=arguments)>
			<cfcatch>
				<cfsavecontent variable="result"><cfdump var="#cfcatch#" format="text"></cfsavecontent>
				<cfset result = "**EXCEPTION**#cfcatch#" /> 
			</cfcatch>
		</cftry>
		
		<cfif IsDefined("result")>
			<cfif NOT IsSimpleValue(result)>
				<cfsavecontent variable="result"><cfdump var="#result#" format="text"></cfsavecontent>
			</cfif>
		
			<cfreturn result />
		</cfif>
		
	</cffunction>
		
	
				
	<cffunction name="getProperty" access="remote" output="false">
		
		
			<cfargument name="adminPassword" type="any" required="true">
			<cfargument name="adminUserId" type="any" required="false">
		
		
			
				<cfargument name="propertyName"  required="Yes">
			
		
		
		<cfset var result = 0 />
		
		<!--- first call administrator login --->
		<cfif StructKeyExists(arguments, "adminUserId")>
			<cfset CreateObject("component", "CFIDE.adminapi.administrator").login(arguments.adminPassword, arguments.adminUserId)>
		<cfelse>
			<cfset CreateObject("component", "CFIDE.adminapi.administrator").login(arguments.adminPassword)>
		</cfif>
		
		<cftry>
			<cfset result = CreateObject("component", "CFIDE.adminapi.flex").getProperty(argumentCollection=arguments)>
			<cfcatch>
				<cfsavecontent variable="result"><cfdump var="#cfcatch#" format="text"></cfsavecontent>
				<cfset result = "**EXCEPTION**#cfcatch#" /> 
			</cfcatch>
		</cftry>
		
		<cfif IsDefined("result")>
			<cfif NOT IsSimpleValue(result)>
				<cfsavecontent variable="result"><cfdump var="#result#" format="text"></cfsavecontent>
			</cfif>
		
			<cfreturn result />
		</cfif>
		
	</cffunction>
		
	
</cfcomponent>
	


<cfcomponent output="false">
	
		
	
		
	
		
	
		
	
		
	
		
	
				
	<cffunction name="getCauseString" access="remote" output="false">
		
		
			<cfargument name="adminPassword" type="any" required="true">
			<cfargument name="adminUserId" type="any" required="false">
		
		
		
		<cfset var result = 0 />
		
		<!--- first call administrator login --->
		<cfif StructKeyExists(arguments, "adminUserId")>
			<cfset CreateObject("component", "CFIDE.adminapi.administrator").login(arguments.adminPassword, arguments.adminUserId)>
		<cfelse>
			<cfset CreateObject("component", "CFIDE.adminapi.administrator").login(arguments.adminPassword)>
		</cfif>
		
		<cftry>
			<cfset result = CreateObject("component", "CFIDE.adminapi.servermonitoring").getCauseString(argumentCollection=arguments)>
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
		
	
		
	
		
	
		
	
		
	
		
	
		
	
		
	
		
	
		
	
		
	
		
	
		
	
		
	
		
	
				
	<cffunction name="getSnapshotDir" access="remote" output="false">
		
		
			<cfargument name="adminPassword" type="any" required="true">
			<cfargument name="adminUserId" type="any" required="false">
		
		
		
		<cfset var result = 0 />
		
		<!--- first call administrator login --->
		<cfif StructKeyExists(arguments, "adminUserId")>
			<cfset CreateObject("component", "CFIDE.adminapi.administrator").login(arguments.adminPassword, arguments.adminUserId)>
		<cfelse>
			<cfset CreateObject("component", "CFIDE.adminapi.administrator").login(arguments.adminPassword)>
		</cfif>
		
		<cftry>
			<cfset result = CreateObject("component", "CFIDE.adminapi.servermonitoring").getSnapshotDir(argumentCollection=arguments)>
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
		
	
		
	
		
	
		
	
		
	
		
	
		
	
		
	
		
	
		
	
		
	
		
	
		
	
		
	
		
	
		
	
		
	
		
	
		
	
				
	<cffunction name="getSystemSnapshotFileNamePrefix" access="remote" output="false">
		
		
			<cfargument name="adminPassword" type="any" required="true">
			<cfargument name="adminUserId" type="any" required="false">
		
		
		
		<cfset var result = 0 />
		
		<!--- first call administrator login --->
		<cfif StructKeyExists(arguments, "adminUserId")>
			<cfset CreateObject("component", "CFIDE.adminapi.administrator").login(arguments.adminPassword, arguments.adminUserId)>
		<cfelse>
			<cfset CreateObject("component", "CFIDE.adminapi.administrator").login(arguments.adminPassword)>
		</cfif>
		
		<cftry>
			<cfset result = CreateObject("component", "CFIDE.adminapi.servermonitoring").getSystemSnapshotFileNamePrefix(argumentCollection=arguments)>
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
		
	
		
	
		
	
		
	
		
	
		
	
		
	
		
	
		
	
		
	
		
	
		
	
		
	
		
	
		
	
		
	
		
	
		
	
		
	
		
	
		
	
		
	
		
	
		
	
		
	
		
	
		
	
		
	
		
	
		
	
		
	
		
	
		
	
		
	
		
	
		
	
		
	
		
	
		
	
		
	
		
	
		
	
		
	
				
	<cffunction name="resetDbPoolStats" access="remote" output="false">
		
		
			<cfargument name="adminPassword" type="any" required="true">
			<cfargument name="adminUserId" type="any" required="false">
		
		
		
		<cfset var result = 0 />
		
		<!--- first call administrator login --->
		<cfif StructKeyExists(arguments, "adminUserId")>
			<cfset CreateObject("component", "CFIDE.adminapi.administrator").login(arguments.adminPassword, arguments.adminUserId)>
		<cfelse>
			<cfset CreateObject("component", "CFIDE.adminapi.administrator").login(arguments.adminPassword)>
		</cfif>
		
		<cftry>
			<cfset result = CreateObject("component", "CFIDE.adminapi.servermonitoring").resetDbPoolStats(argumentCollection=arguments)>
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
		
	
		
	
		
	
		
	
		
	
		
	
		
	
		
	
		
	
				
	<cffunction name="getUserSnapshotFileNamePrefix" access="remote" output="false">
		
		
			<cfargument name="adminPassword" type="any" required="true">
			<cfargument name="adminUserId" type="any" required="false">
		
		
		
		<cfset var result = 0 />
		
		<!--- first call administrator login --->
		<cfif StructKeyExists(arguments, "adminUserId")>
			<cfset CreateObject("component", "CFIDE.adminapi.administrator").login(arguments.adminPassword, arguments.adminUserId)>
		<cfelse>
			<cfset CreateObject("component", "CFIDE.adminapi.administrator").login(arguments.adminPassword)>
		</cfif>
		
		<cftry>
			<cfset result = CreateObject("component", "CFIDE.adminapi.servermonitoring").getUserSnapshotFileNamePrefix(argumentCollection=arguments)>
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
	

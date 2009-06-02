
<cfcomponent output="false">
	
		
	
		
	
				
	<cffunction name="login" access="remote" output="false" returnformat="plain">
		
		
		
			
		
			
		
			
				<cfargument name="salt"  required="no">
			
		
			
				<cfargument name="rdsPasswordAllowed"  required="no">
			
		
		
		<cfset var result = 0 />
				
		<!--- convert datatypes --->
		
			
		
			
		
			
		
			
		
		
		<!--- first call administrator login --->
		<cfif StructKeyExists(arguments, "adminUserId")>
			<cfset CreateObject("component", "CFIDE.adminapi.administrator").login(arguments.adminPassword, arguments.adminUserId)>
		<cfelse>
			<cfset CreateObject("component", "CFIDE.adminapi.administrator").login(arguments.adminPassword)>
		</cfif>
		
		<cftry>
			<cfset result = CreateObject("component", "CFIDE.adminapi.administrator").login(argumentCollection=arguments)>
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
		
	
		
	
				
	<cffunction name="setAdminProperty" access="remote" output="false" returnformat="plain">
		
		
			<cfargument name="adminPassword" type="any" required="true">
			<cfargument name="adminUserId" type="any" required="false">
		
		
			
				<cfargument name="propertyName"  required="Yes">
			
		
			
				<cfargument name="propertyValue"  required="Yes">
			
		
		
		<cfset var result = 0 />
				
		<!--- convert datatypes --->
		
			
		
			
		
		
		<!--- first call administrator login --->
		<cfif StructKeyExists(arguments, "adminUserId")>
			<cfset CreateObject("component", "CFIDE.adminapi.administrator").login(arguments.adminPassword, arguments.adminUserId)>
		<cfelse>
			<cfset CreateObject("component", "CFIDE.adminapi.administrator").login(arguments.adminPassword)>
		</cfif>
		
		<cftry>
			<cfset result = CreateObject("component", "CFIDE.adminapi.administrator").setAdminProperty(argumentCollection=arguments)>
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
		
	
		
	
		
	
				
	<cffunction name="logout" access="remote" output="false" returnformat="plain">
		
		
			<cfargument name="adminPassword" type="any" required="true">
			<cfargument name="adminUserId" type="any" required="false">
		
		
		
		<cfset var result = 0 />
				
		<!--- convert datatypes --->
		
		
		<!--- first call administrator login --->
		<cfif StructKeyExists(arguments, "adminUserId")>
			<cfset CreateObject("component", "CFIDE.adminapi.administrator").login(arguments.adminPassword, arguments.adminUserId)>
		<cfelse>
			<cfset CreateObject("component", "CFIDE.adminapi.administrator").login(arguments.adminPassword)>
		</cfif>
		
		<cftry>
			<cfset result = CreateObject("component", "CFIDE.adminapi.administrator").logout(argumentCollection=arguments)>
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
		
	
		
	
		
	
		
	
				
	<cffunction name="getSalt" access="remote" output="false" returnformat="plain">
		
		
			<cfargument name="adminPassword" type="any" required="true">
			<cfargument name="adminUserId" type="any" required="false">
		
		
		
		<cfset var result = 0 />
				
		<!--- convert datatypes --->
		
		
		<!--- first call administrator login --->
		<cfif StructKeyExists(arguments, "adminUserId")>
			<cfset CreateObject("component", "CFIDE.adminapi.administrator").login(arguments.adminPassword, arguments.adminUserId)>
		<cfelse>
			<cfset CreateObject("component", "CFIDE.adminapi.administrator").login(arguments.adminPassword)>
		</cfif>
		
		<cftry>
			<cfset result = CreateObject("component", "CFIDE.adminapi.administrator").getSalt(argumentCollection=arguments)>
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
		
	
		
	
		
	
		
	
		
	
		
	
		
	
		
	
		
	
		
	
		
	
				
	<cffunction name="getAdminProperty" access="remote" output="false" returnformat="plain">
		
		
			<cfargument name="adminPassword" type="any" required="true">
			<cfargument name="adminUserId" type="any" required="false">
		
		
			
				<cfargument name="propertyName"  required="Yes">
			
		
		
		<cfset var result = 0 />
				
		<!--- convert datatypes --->
		
			
		
		
		<!--- first call administrator login --->
		<cfif StructKeyExists(arguments, "adminUserId")>
			<cfset CreateObject("component", "CFIDE.adminapi.administrator").login(arguments.adminPassword, arguments.adminUserId)>
		<cfelse>
			<cfset CreateObject("component", "CFIDE.adminapi.administrator").login(arguments.adminPassword)>
		</cfif>
		
		<cftry>
			<cfset result = CreateObject("component", "CFIDE.adminapi.administrator").getAdminProperty(argumentCollection=arguments)>
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
	

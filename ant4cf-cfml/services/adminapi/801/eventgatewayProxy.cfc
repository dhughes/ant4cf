
<cfcomponent output="false">
	
				
	<cffunction name="startSMSTestServer" access="remote" output="false" returnformat="plain">
		
		
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
			<cfset result = CreateObject("component", "CFIDE.adminapi.eventgateway").startSMSTestServer(argumentCollection=arguments)>
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
		
	
				
	<cffunction name="getGatewayInstanceStatus" access="remote" output="false" returnformat="plain">
		
		
			<cfargument name="adminPassword" type="any" required="true">
			<cfargument name="adminUserId" type="any" required="false">
		
		
			
				<cfargument name="gatewayid"  required="Yes">
			
		
		
		<cfset var result = 0 />
				
		<!--- convert datatypes --->
		
			
		
		
		<!--- first call administrator login --->
		<cfif StructKeyExists(arguments, "adminUserId")>
			<cfset CreateObject("component", "CFIDE.adminapi.administrator").login(arguments.adminPassword, arguments.adminUserId)>
		<cfelse>
			<cfset CreateObject("component", "CFIDE.adminapi.administrator").login(arguments.adminPassword)>
		</cfif>
		
		<cftry>
			<cfset result = CreateObject("component", "CFIDE.adminapi.eventgateway").getGatewayInstanceStatus(argumentCollection=arguments)>
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
		
	
				
	<cffunction name="setGatewayInstance" access="remote" output="false" returnformat="plain">
		
		
			<cfargument name="adminPassword" type="any" required="true">
			<cfargument name="adminUserId" type="any" required="false">
		
		
			
				<cfargument name="gatewayid"  required="Yes">
			
		
			
				<cfargument name="type"  required="Yes">
			
		
			
				<cfargument name="cfcPaths" type="string" required="Yes">
			
		
			
				<cfargument name="configurationpath"  required="Yes">
			
		
			
				<cfargument name="mode"  required="Yes">
			
		
		
		<cfset var result = 0 />
				
		<!--- convert datatypes --->
		
			
		
			
		
			
				<cfset arguments.cfcPaths = ListToArray(arguments.cfcPaths) />
			
		
			
		
			
		
		
		<!--- first call administrator login --->
		<cfif StructKeyExists(arguments, "adminUserId")>
			<cfset CreateObject("component", "CFIDE.adminapi.administrator").login(arguments.adminPassword, arguments.adminUserId)>
		<cfelse>
			<cfset CreateObject("component", "CFIDE.adminapi.administrator").login(arguments.adminPassword)>
		</cfif>
		
		<cftry>
			<cfset result = CreateObject("component", "CFIDE.adminapi.eventgateway").setGatewayInstance(argumentCollection=arguments)>
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
		
	
				
	<cffunction name="ResetGatewayEvents" access="remote" output="false" returnformat="plain">
		
		
			<cfargument name="adminPassword" type="any" required="true">
			<cfargument name="adminUserId" type="any" required="false">
		
		
			
				<cfargument name="gatewayID"  required="Yes">
			
		
			
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
			<cfset result = CreateObject("component", "CFIDE.adminapi.eventgateway").ResetGatewayEvents(argumentCollection=arguments)>
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
		
	
				
	<cffunction name="startGatewayInstance" access="remote" output="false" returnformat="plain">
		
		
			<cfargument name="adminPassword" type="any" required="true">
			<cfargument name="adminUserId" type="any" required="false">
		
		
			
				<cfargument name="gatewayid"  required="Yes">
			
		
		
		<cfset var result = 0 />
				
		<!--- convert datatypes --->
		
			
		
		
		<!--- first call administrator login --->
		<cfif StructKeyExists(arguments, "adminUserId")>
			<cfset CreateObject("component", "CFIDE.adminapi.administrator").login(arguments.adminPassword, arguments.adminUserId)>
		<cfelse>
			<cfset CreateObject("component", "CFIDE.adminapi.administrator").login(arguments.adminPassword)>
		</cfif>
		
		<cftry>
			<cfset result = CreateObject("component", "CFIDE.adminapi.eventgateway").startGatewayInstance(argumentCollection=arguments)>
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
		
	
				
	<cffunction name="getSMSTestServerStatus" access="remote" output="false" returnformat="plain">
		
		
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
			<cfset result = CreateObject("component", "CFIDE.adminapi.eventgateway").getSMSTestServerStatus(argumentCollection=arguments)>
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
		
	
				
	<cffunction name="getGatewayEvents" access="remote" output="false" returnformat="plain">
		
		
			<cfargument name="adminPassword" type="any" required="true">
			<cfargument name="adminUserId" type="any" required="false">
		
		
			
				<cfargument name="gatewayID"  required="Yes">
			
		
			
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
			<cfset result = CreateObject("component", "CFIDE.adminapi.eventgateway").getGatewayEvents(argumentCollection=arguments)>
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
		
	
				
	<cffunction name="getGatewayServiceStatus" access="remote" output="false" returnformat="plain">
		
		
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
			<cfset result = CreateObject("component", "CFIDE.adminapi.eventgateway").getGatewayServiceStatus(argumentCollection=arguments)>
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
		
	
				
	<cffunction name="setGatewayType" access="remote" output="false" returnformat="plain">
		
		
			<cfargument name="adminPassword" type="any" required="true">
			<cfargument name="adminUserId" type="any" required="false">
		
		
			
				<cfargument name="type"  required="Yes">
			
		
			
				<cfargument name="description"  required="Yes">
			
		
			
				<cfargument name="class"  required="Yes">
			
		
			
				<cfargument name="timeout"  required="no">
			
		
			
				<cfargument name="killOnTimeout"  required="no">
			
		
		
		<cfset var result = 0 />
				
		<!--- convert datatypes --->
		
			
		
			
		
			
		
			
		
			
		
		
		<!--- first call administrator login --->
		<cfif StructKeyExists(arguments, "adminUserId")>
			<cfset CreateObject("component", "CFIDE.adminapi.administrator").login(arguments.adminPassword, arguments.adminUserId)>
		<cfelse>
			<cfset CreateObject("component", "CFIDE.adminapi.administrator").login(arguments.adminPassword)>
		</cfif>
		
		<cftry>
			<cfset result = CreateObject("component", "CFIDE.adminapi.eventgateway").setGatewayType(argumentCollection=arguments)>
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
		
	
				
	<cffunction name="stopGatewayInstance" access="remote" output="false" returnformat="plain">
		
		
			<cfargument name="adminPassword" type="any" required="true">
			<cfargument name="adminUserId" type="any" required="false">
		
		
			
				<cfargument name="gatewayid"  required="Yes">
			
		
		
		<cfset var result = 0 />
				
		<!--- convert datatypes --->
		
			
		
		
		<!--- first call administrator login --->
		<cfif StructKeyExists(arguments, "adminUserId")>
			<cfset CreateObject("component", "CFIDE.adminapi.administrator").login(arguments.adminPassword, arguments.adminUserId)>
		<cfelse>
			<cfset CreateObject("component", "CFIDE.adminapi.administrator").login(arguments.adminPassword)>
		</cfif>
		
		<cftry>
			<cfset result = CreateObject("component", "CFIDE.adminapi.eventgateway").stopGatewayInstance(argumentCollection=arguments)>
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
		
	
				
	<cffunction name="deleteGatewayType" access="remote" output="false" returnformat="plain">
		
		
			<cfargument name="adminPassword" type="any" required="true">
			<cfargument name="adminUserId" type="any" required="false">
		
		
			
				<cfargument name="type"  required="Yes">
			
		
		
		<cfset var result = 0 />
				
		<!--- convert datatypes --->
		
			
		
		
		<!--- first call administrator login --->
		<cfif StructKeyExists(arguments, "adminUserId")>
			<cfset CreateObject("component", "CFIDE.adminapi.administrator").login(arguments.adminPassword, arguments.adminUserId)>
		<cfelse>
			<cfset CreateObject("component", "CFIDE.adminapi.administrator").login(arguments.adminPassword)>
		</cfif>
		
		<cftry>
			<cfset result = CreateObject("component", "CFIDE.adminapi.eventgateway").deleteGatewayType(argumentCollection=arguments)>
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
		
	
				
	<cffunction name="getGatewayInstances" access="remote" output="false" returnformat="plain">
		
		
			<cfargument name="adminPassword" type="any" required="true">
			<cfargument name="adminUserId" type="any" required="false">
		
		
			
				<cfargument name="gatewayid"  required="no">
			
		
		
		<cfset var result = 0 />
				
		<!--- convert datatypes --->
		
			
		
		
		<!--- first call administrator login --->
		<cfif StructKeyExists(arguments, "adminUserId")>
			<cfset CreateObject("component", "CFIDE.adminapi.administrator").login(arguments.adminPassword, arguments.adminUserId)>
		<cfelse>
			<cfset CreateObject("component", "CFIDE.adminapi.administrator").login(arguments.adminPassword)>
		</cfif>
		
		<cftry>
			<cfset result = CreateObject("component", "CFIDE.adminapi.eventgateway").getGatewayInstances(argumentCollection=arguments)>
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
		
	
				
	<cffunction name="setGatewayProperty" access="remote" output="false" returnformat="plain">
		
		
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
			<cfset result = CreateObject("component", "CFIDE.adminapi.eventgateway").setGatewayProperty(argumentCollection=arguments)>
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
		
	
				
	<cffunction name="getGatewayProperty" access="remote" output="false" returnformat="plain">
		
		
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
			<cfset result = CreateObject("component", "CFIDE.adminapi.eventgateway").getGatewayProperty(argumentCollection=arguments)>
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
		
	
				
	<cffunction name="getGatewayTypes" access="remote" output="false" returnformat="plain">
		
		
			<cfargument name="adminPassword" type="any" required="true">
			<cfargument name="adminUserId" type="any" required="false">
		
		
			
				<cfargument name="type"  required="no">
			
		
		
		<cfset var result = 0 />
				
		<!--- convert datatypes --->
		
			
		
		
		<!--- first call administrator login --->
		<cfif StructKeyExists(arguments, "adminUserId")>
			<cfset CreateObject("component", "CFIDE.adminapi.administrator").login(arguments.adminPassword, arguments.adminUserId)>
		<cfelse>
			<cfset CreateObject("component", "CFIDE.adminapi.administrator").login(arguments.adminPassword)>
		</cfif>
		
		<cftry>
			<cfset result = CreateObject("component", "CFIDE.adminapi.eventgateway").getGatewayTypes(argumentCollection=arguments)>
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
		
	
				
	<cffunction name="deleteGatewayInstance" access="remote" output="false" returnformat="plain">
		
		
			<cfargument name="adminPassword" type="any" required="true">
			<cfargument name="adminUserId" type="any" required="false">
		
		
			
				<cfargument name="gatewayid"  required="Yes">
			
		
		
		<cfset var result = 0 />
				
		<!--- convert datatypes --->
		
			
		
		
		<!--- first call administrator login --->
		<cfif StructKeyExists(arguments, "adminUserId")>
			<cfset CreateObject("component", "CFIDE.adminapi.administrator").login(arguments.adminPassword, arguments.adminUserId)>
		<cfelse>
			<cfset CreateObject("component", "CFIDE.adminapi.administrator").login(arguments.adminPassword)>
		</cfif>
		
		<cftry>
			<cfset result = CreateObject("component", "CFIDE.adminapi.eventgateway").deleteGatewayInstance(argumentCollection=arguments)>
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
		
	
				
	<cffunction name="setGatewayServiceStatus" access="remote" output="false" returnformat="plain">
		
		
			<cfargument name="adminPassword" type="any" required="true">
			<cfargument name="adminUserId" type="any" required="false">
		
		
			
				<cfargument name="enableGatewayService"  required="yes">
			
		
		
		<cfset var result = 0 />
				
		<!--- convert datatypes --->
		
			
		
		
		<!--- first call administrator login --->
		<cfif StructKeyExists(arguments, "adminUserId")>
			<cfset CreateObject("component", "CFIDE.adminapi.administrator").login(arguments.adminPassword, arguments.adminUserId)>
		<cfelse>
			<cfset CreateObject("component", "CFIDE.adminapi.administrator").login(arguments.adminPassword)>
		</cfif>
		
		<cftry>
			<cfset result = CreateObject("component", "CFIDE.adminapi.eventgateway").setGatewayServiceStatus(argumentCollection=arguments)>
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
		
	
				
	<cffunction name="stopGatewayService" access="remote" output="false" returnformat="plain">
		
		
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
			<cfset result = CreateObject("component", "CFIDE.adminapi.eventgateway").stopGatewayService(argumentCollection=arguments)>
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
		
	
				
	<cffunction name="stopSMSTestServer" access="remote" output="false" returnformat="plain">
		
		
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
			<cfset result = CreateObject("component", "CFIDE.adminapi.eventgateway").stopSMSTestServer(argumentCollection=arguments)>
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
		
	
				
	<cffunction name="restartGatewayInstance" access="remote" output="false" returnformat="plain">
		
		
			<cfargument name="adminPassword" type="any" required="true">
			<cfargument name="adminUserId" type="any" required="false">
		
		
			
				<cfargument name="gatewayid"  required="Yes">
			
		
		
		<cfset var result = 0 />
				
		<!--- convert datatypes --->
		
			
		
		
		<!--- first call administrator login --->
		<cfif StructKeyExists(arguments, "adminUserId")>
			<cfset CreateObject("component", "CFIDE.adminapi.administrator").login(arguments.adminPassword, arguments.adminUserId)>
		<cfelse>
			<cfset CreateObject("component", "CFIDE.adminapi.administrator").login(arguments.adminPassword)>
		</cfif>
		
		<cftry>
			<cfset result = CreateObject("component", "CFIDE.adminapi.eventgateway").restartGatewayInstance(argumentCollection=arguments)>
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
		
	
				
	<cffunction name="startGatewayService" access="remote" output="false" returnformat="plain">
		
		
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
			<cfset result = CreateObject("component", "CFIDE.adminapi.eventgateway").startGatewayService(argumentCollection=arguments)>
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
	

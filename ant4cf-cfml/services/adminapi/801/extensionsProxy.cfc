
<cfcomponent output="false">
	
				
	<cffunction name="getCorbaConnectors" access="remote" output="false" returnformat="plain">
		
		
			<cfargument name="adminPassword" type="any" required="true">
			<cfargument name="adminUserId" type="any" required="false">
		
		
			
				<cfargument name="name"  required="No">
			
		
		
		<cfset var result = 0 />
				
		<!--- convert datatypes --->
		
			
		
		
		<!--- first call administrator login --->
		<cfif StructKeyExists(arguments, "adminUserId")>
			<cfset CreateObject("component", "CFIDE.adminapi.administrator").login(arguments.adminPassword, arguments.adminUserId)>
		<cfelse>
			<cfset CreateObject("component", "CFIDE.adminapi.administrator").login(arguments.adminPassword)>
		</cfif>
		
		<cftry>
			<cfset result = CreateObject("component", "CFIDE.adminapi.extensions").getCorbaConnectors(argumentCollection=arguments)>
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
		
	
				
	<cffunction name="deleteApplet" access="remote" output="false" returnformat="plain">
		
		
			<cfargument name="adminPassword" type="any" required="true">
			<cfargument name="adminUserId" type="any" required="false">
		
		
			
				<cfargument name="appletName" type="string" >
			
		
		
		<cfset var result = 0 />
				
		<!--- convert datatypes --->
		
			
		
		
		<!--- first call administrator login --->
		<cfif StructKeyExists(arguments, "adminUserId")>
			<cfset CreateObject("component", "CFIDE.adminapi.administrator").login(arguments.adminPassword, arguments.adminUserId)>
		<cfelse>
			<cfset CreateObject("component", "CFIDE.adminapi.administrator").login(arguments.adminPassword)>
		</cfif>
		
		<cftry>
			<cfset result = CreateObject("component", "CFIDE.adminapi.extensions").deleteApplet(argumentCollection=arguments)>
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
		
	
				
	<cffunction name="setMapping" access="remote" output="false" returnformat="plain">
		
		
			<cfargument name="adminPassword" type="any" required="true">
			<cfargument name="adminUserId" type="any" required="false">
		
		
			
				<cfargument name="mapName"  required="Yes">
			
		
			
				<cfargument name="mapPath"  required="Yes">
			
		
		
		<cfset var result = 0 />
				
		<!--- convert datatypes --->
		
			
		
			
		
		
		<!--- first call administrator login --->
		<cfif StructKeyExists(arguments, "adminUserId")>
			<cfset CreateObject("component", "CFIDE.adminapi.administrator").login(arguments.adminPassword, arguments.adminUserId)>
		<cfelse>
			<cfset CreateObject("component", "CFIDE.adminapi.administrator").login(arguments.adminPassword)>
		</cfif>
		
		<cftry>
			<cfset result = CreateObject("component", "CFIDE.adminapi.extensions").setMapping(argumentCollection=arguments)>
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
		
	
				
	<cffunction name="deleteMapping" access="remote" output="false" returnformat="plain">
		
		
			<cfargument name="adminPassword" type="any" required="true">
			<cfargument name="adminUserId" type="any" required="false">
		
		
			
				<cfargument name="mapName"  required="Yes">
			
		
		
		<cfset var result = 0 />
				
		<!--- convert datatypes --->
		
			
		
		
		<!--- first call administrator login --->
		<cfif StructKeyExists(arguments, "adminUserId")>
			<cfset CreateObject("component", "CFIDE.adminapi.administrator").login(arguments.adminPassword, arguments.adminUserId)>
		<cfelse>
			<cfset CreateObject("component", "CFIDE.adminapi.administrator").login(arguments.adminPassword)>
		</cfif>
		
		<cftry>
			<cfset result = CreateObject("component", "CFIDE.adminapi.extensions").deleteMapping(argumentCollection=arguments)>
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
		
	
				
	<cffunction name="setCustomTagPath" access="remote" output="false" returnformat="plain">
		
		
			<cfargument name="adminPassword" type="any" required="true">
			<cfargument name="adminUserId" type="any" required="false">
		
		
			
				<cfargument name="path"  required="true">
			
		
		
		<cfset var result = 0 />
				
		<!--- convert datatypes --->
		
			
		
		
		<!--- first call administrator login --->
		<cfif StructKeyExists(arguments, "adminUserId")>
			<cfset CreateObject("component", "CFIDE.adminapi.administrator").login(arguments.adminPassword, arguments.adminUserId)>
		<cfelse>
			<cfset CreateObject("component", "CFIDE.adminapi.administrator").login(arguments.adminPassword)>
		</cfif>
		
		<cftry>
			<cfset result = CreateObject("component", "CFIDE.adminapi.extensions").setCustomTagPath(argumentCollection=arguments)>
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
		
	
				
	<cffunction name="deleteCFX" access="remote" output="false" returnformat="plain">
		
		
			<cfargument name="adminPassword" type="any" required="true">
			<cfargument name="adminUserId" type="any" required="false">
		
		
			
				<cfargument name="cfxname"  required="No">
			
		
		
		<cfset var result = 0 />
				
		<!--- convert datatypes --->
		
			
		
		
		<!--- first call administrator login --->
		<cfif StructKeyExists(arguments, "adminUserId")>
			<cfset CreateObject("component", "CFIDE.adminapi.administrator").login(arguments.adminPassword, arguments.adminUserId)>
		<cfelse>
			<cfset CreateObject("component", "CFIDE.adminapi.administrator").login(arguments.adminPassword)>
		</cfif>
		
		<cftry>
			<cfset result = CreateObject("component", "CFIDE.adminapi.extensions").deleteCFX(argumentCollection=arguments)>
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
		
	
				
	<cffunction name="getCFX" access="remote" output="false" returnformat="plain">
		
		
			<cfargument name="adminPassword" type="any" required="true">
			<cfargument name="adminUserId" type="any" required="false">
		
		
			
				<cfargument name="cfxname"  required="No">
			
		
		
		<cfset var result = 0 />
				
		<!--- convert datatypes --->
		
			
		
		
		<!--- first call administrator login --->
		<cfif StructKeyExists(arguments, "adminUserId")>
			<cfset CreateObject("component", "CFIDE.adminapi.administrator").login(arguments.adminPassword, arguments.adminUserId)>
		<cfelse>
			<cfset CreateObject("component", "CFIDE.adminapi.administrator").login(arguments.adminPassword)>
		</cfif>
		
		<cftry>
			<cfset result = CreateObject("component", "CFIDE.adminapi.extensions").getCFX(argumentCollection=arguments)>
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
		
	
				
	<cffunction name="reloadWebService" access="remote" output="false" returnformat="plain">
		
		
			<cfargument name="adminPassword" type="any" required="true">
			<cfargument name="adminUserId" type="any" required="false">
		
		
			
				<cfargument name="name"  required="Yes">
			
		
			
				<cfargument name="path"  required="Yes">
			
		
			
				<cfargument name="username"  required="no">
			
		
			
				<cfargument name="password"  required="no">
			
		
		
		<cfset var result = 0 />
				
		<!--- convert datatypes --->
		
			
		
			
		
			
		
			
		
		
		<!--- first call administrator login --->
		<cfif StructKeyExists(arguments, "adminUserId")>
			<cfset CreateObject("component", "CFIDE.adminapi.administrator").login(arguments.adminPassword, arguments.adminUserId)>
		<cfelse>
			<cfset CreateObject("component", "CFIDE.adminapi.administrator").login(arguments.adminPassword)>
		</cfif>
		
		<cftry>
			<cfset result = CreateObject("component", "CFIDE.adminapi.extensions").reloadWebService(argumentCollection=arguments)>
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
		
	
				
	<cffunction name="setCPPCFX" access="remote" output="false" returnformat="plain">
		
		
			<cfargument name="adminPassword" type="any" required="true">
			<cfargument name="adminUserId" type="any" required="false">
		
		
			
				<cfargument name="name"  required="true">
			
		
			
				<cfargument name="library"  required="true">
			
		
			
				<cfargument name="description"  required="false">
			
		
			
				<cfargument name="cache" type="boolean" required="false">
			
		
			
				<cfargument name="procedure"  required="false">
			
		
		
		<cfset var result = 0 />
				
		<!--- convert datatypes --->
		
			
		
			
		
			
		
			
		
			
		
		
		<!--- first call administrator login --->
		<cfif StructKeyExists(arguments, "adminUserId")>
			<cfset CreateObject("component", "CFIDE.adminapi.administrator").login(arguments.adminPassword, arguments.adminUserId)>
		<cfelse>
			<cfset CreateObject("component", "CFIDE.adminapi.administrator").login(arguments.adminPassword)>
		</cfif>
		
		<cftry>
			<cfset result = CreateObject("component", "CFIDE.adminapi.extensions").setCPPCFX(argumentCollection=arguments)>
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
		
	
				
	<cffunction name="deleteCorbaConnector" access="remote" output="false" returnformat="plain">
		
		
			<cfargument name="adminPassword" type="any" required="true">
			<cfargument name="adminUserId" type="any" required="false">
		
		
			
				<cfargument name="name"  required="yes">
			
		
		
		<cfset var result = 0 />
				
		<!--- convert datatypes --->
		
			
		
		
		<!--- first call administrator login --->
		<cfif StructKeyExists(arguments, "adminUserId")>
			<cfset CreateObject("component", "CFIDE.adminapi.administrator").login(arguments.adminPassword, arguments.adminUserId)>
		<cfelse>
			<cfset CreateObject("component", "CFIDE.adminapi.administrator").login(arguments.adminPassword)>
		</cfif>
		
		<cftry>
			<cfset result = CreateObject("component", "CFIDE.adminapi.extensions").deleteCorbaConnector(argumentCollection=arguments)>
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
		
	
				
	<cffunction name="setJavaCFX" access="remote" output="false" returnformat="plain">
		
		
			<cfargument name="adminPassword" type="any" required="true">
			<cfargument name="adminUserId" type="any" required="false">
		
		
			
				<cfargument name="name"  required="true">
			
		
			
				<cfargument name="classname"  required="true">
			
		
			
				<cfargument name="description"  required="false">
			
		
		
		<cfset var result = 0 />
				
		<!--- convert datatypes --->
		
			
		
			
		
			
		
		
		<!--- first call administrator login --->
		<cfif StructKeyExists(arguments, "adminUserId")>
			<cfset CreateObject("component", "CFIDE.adminapi.administrator").login(arguments.adminPassword, arguments.adminUserId)>
		<cfelse>
			<cfset CreateObject("component", "CFIDE.adminapi.administrator").login(arguments.adminPassword)>
		</cfif>
		
		<cftry>
			<cfset result = CreateObject("component", "CFIDE.adminapi.extensions").setJavaCFX(argumentCollection=arguments)>
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
		
	
				
	<cffunction name="getWebServices" access="remote" output="false" returnformat="plain">
		
		
			<cfargument name="adminPassword" type="any" required="true">
			<cfargument name="adminUserId" type="any" required="false">
		
		
			
				<cfargument name="name"  required="no">
			
		
			
				<cfargument name="includeAutoRegistered" type="boolean" required="no">
			
		
		
		<cfset var result = 0 />
				
		<!--- convert datatypes --->
		
			
		
			
		
		
		<!--- first call administrator login --->
		<cfif StructKeyExists(arguments, "adminUserId")>
			<cfset CreateObject("component", "CFIDE.adminapi.administrator").login(arguments.adminPassword, arguments.adminUserId)>
		<cfelse>
			<cfset CreateObject("component", "CFIDE.adminapi.administrator").login(arguments.adminPassword)>
		</cfif>
		
		<cftry>
			<cfset result = CreateObject("component", "CFIDE.adminapi.extensions").getWebServices(argumentCollection=arguments)>
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
		
	
				
	<cffunction name="deleteWebService" access="remote" output="false" returnformat="plain">
		
		
			<cfargument name="adminPassword" type="any" required="true">
			<cfargument name="adminUserId" type="any" required="false">
		
		
			
				<cfargument name="name"  required="Yes">
			
		
		
		<cfset var result = 0 />
				
		<!--- convert datatypes --->
		
			
		
		
		<!--- first call administrator login --->
		<cfif StructKeyExists(arguments, "adminUserId")>
			<cfset CreateObject("component", "CFIDE.adminapi.administrator").login(arguments.adminPassword, arguments.adminUserId)>
		<cfelse>
			<cfset CreateObject("component", "CFIDE.adminapi.administrator").login(arguments.adminPassword)>
		</cfif>
		
		<cftry>
			<cfset result = CreateObject("component", "CFIDE.adminapi.extensions").deleteWebService(argumentCollection=arguments)>
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
		
	
				
	<cffunction name="setUseOrb" access="remote" output="false" returnformat="plain">
		
		
			<cfargument name="adminPassword" type="any" required="true">
			<cfargument name="adminUserId" type="any" required="false">
		
		
			
				<cfargument name="useOrb"  required="Yes">
			
		
		
		<cfset var result = 0 />
				
		<!--- convert datatypes --->
		
			
		
		
		<!--- first call administrator login --->
		<cfif StructKeyExists(arguments, "adminUserId")>
			<cfset CreateObject("component", "CFIDE.adminapi.administrator").login(arguments.adminPassword, arguments.adminUserId)>
		<cfelse>
			<cfset CreateObject("component", "CFIDE.adminapi.administrator").login(arguments.adminPassword)>
		</cfif>
		
		<cftry>
			<cfset result = CreateObject("component", "CFIDE.adminapi.extensions").setUseOrb(argumentCollection=arguments)>
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
		
	
				
	<cffunction name="setCorbaConnector" access="remote" output="false" returnformat="plain">
		
		
			<cfargument name="adminPassword" type="any" required="true">
			<cfargument name="adminUserId" type="any" required="false">
		
		
			
				<cfargument name="name"  required="yes">
			
		
			
				<cfargument name="oldname"  required="no">
			
		
			
				<cfargument name="classname"  required="yes">
			
		
			
				<cfargument name="classpath"  required="yes">
			
		
			
				<cfargument name="propertyfile"  required="No">
			
		
		
		<cfset var result = 0 />
				
		<!--- convert datatypes --->
		
			
		
			
		
			
		
			
		
			
		
		
		<!--- first call administrator login --->
		<cfif StructKeyExists(arguments, "adminUserId")>
			<cfset CreateObject("component", "CFIDE.adminapi.administrator").login(arguments.adminPassword, arguments.adminUserId)>
		<cfelse>
			<cfset CreateObject("component", "CFIDE.adminapi.administrator").login(arguments.adminPassword)>
		</cfif>
		
		<cftry>
			<cfset result = CreateObject("component", "CFIDE.adminapi.extensions").setCorbaConnector(argumentCollection=arguments)>
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
		
	
				
	<cffunction name="getCustomTagPaths" access="remote" output="false" returnformat="plain">
		
		
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
			<cfset result = CreateObject("component", "CFIDE.adminapi.extensions").getCustomTagPaths(argumentCollection=arguments)>
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
		
	
				
	<cffunction name="getUseOrb" access="remote" output="false" returnformat="plain">
		
		
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
			<cfset result = CreateObject("component", "CFIDE.adminapi.extensions").getUseOrb(argumentCollection=arguments)>
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
		
	
		
	
				
	<cffunction name="deleteCustomTagPath" access="remote" output="false" returnformat="plain">
		
		
			<cfargument name="adminPassword" type="any" required="true">
			<cfargument name="adminUserId" type="any" required="false">
		
		
			
				<cfargument name="path"  required="true">
			
		
		
		<cfset var result = 0 />
				
		<!--- convert datatypes --->
		
			
		
		
		<!--- first call administrator login --->
		<cfif StructKeyExists(arguments, "adminUserId")>
			<cfset CreateObject("component", "CFIDE.adminapi.administrator").login(arguments.adminPassword, arguments.adminUserId)>
		<cfelse>
			<cfset CreateObject("component", "CFIDE.adminapi.administrator").login(arguments.adminPassword)>
		</cfif>
		
		<cftry>
			<cfset result = CreateObject("component", "CFIDE.adminapi.extensions").deleteCustomTagPath(argumentCollection=arguments)>
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
		
	
				
	<cffunction name="setApplet" access="remote" output="false" returnformat="plain">
		
		
			<cfargument name="adminPassword" type="any" required="true">
			<cfargument name="adminUserId" type="any" required="false">
		
		
			
				<cfargument name="applet" type="struct" >
			
		
			
				<cfargument name="appletName" type="string" >
			
		
		
		<cfset var result = 0 />
				
		<!--- convert datatypes --->
		
			
		
			
		
		
		<!--- first call administrator login --->
		<cfif StructKeyExists(arguments, "adminUserId")>
			<cfset CreateObject("component", "CFIDE.adminapi.administrator").login(arguments.adminPassword, arguments.adminUserId)>
		<cfelse>
			<cfset CreateObject("component", "CFIDE.adminapi.administrator").login(arguments.adminPassword)>
		</cfif>
		
		<cftry>
			<cfset result = CreateObject("component", "CFIDE.adminapi.extensions").setApplet(argumentCollection=arguments)>
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
		
	
				
	<cffunction name="getMappings" access="remote" output="false" returnformat="plain">
		
		
			<cfargument name="adminPassword" type="any" required="true">
			<cfargument name="adminUserId" type="any" required="false">
		
		
			
				<cfargument name="mapName"  required="No">
			
		
		
		<cfset var result = 0 />
				
		<!--- convert datatypes --->
		
			
		
		
		<!--- first call administrator login --->
		<cfif StructKeyExists(arguments, "adminUserId")>
			<cfset CreateObject("component", "CFIDE.adminapi.administrator").login(arguments.adminPassword, arguments.adminUserId)>
		<cfelse>
			<cfset CreateObject("component", "CFIDE.adminapi.administrator").login(arguments.adminPassword)>
		</cfif>
		
		<cftry>
			<cfset result = CreateObject("component", "CFIDE.adminapi.extensions").getMappings(argumentCollection=arguments)>
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
		
	
				
	<cffunction name="getApplets" access="remote" output="false" returnformat="plain">
		
		
			<cfargument name="adminPassword" type="any" required="true">
			<cfargument name="adminUserId" type="any" required="false">
		
		
			
				<cfargument name="name"  required="No">
			
		
		
		<cfset var result = 0 />
				
		<!--- convert datatypes --->
		
			
		
		
		<!--- first call administrator login --->
		<cfif StructKeyExists(arguments, "adminUserId")>
			<cfset CreateObject("component", "CFIDE.adminapi.administrator").login(arguments.adminPassword, arguments.adminUserId)>
		<cfelse>
			<cfset CreateObject("component", "CFIDE.adminapi.administrator").login(arguments.adminPassword)>
		</cfif>
		
		<cftry>
			<cfset result = CreateObject("component", "CFIDE.adminapi.extensions").getApplets(argumentCollection=arguments)>
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
		
	
				
	<cffunction name="setWebService" access="remote" output="false" returnformat="plain">
		
		
			<cfargument name="adminPassword" type="any" required="true">
			<cfargument name="adminUserId" type="any" required="false">
		
		
			
				<cfargument name="name"  required="Yes">
			
		
			
				<cfargument name="path"  required="Yes">
			
		
			
				<cfargument name="username"  required="no">
			
		
			
				<cfargument name="password"  required="no">
			
		
		
		<cfset var result = 0 />
				
		<!--- convert datatypes --->
		
			
		
			
		
			
		
			
		
		
		<!--- first call administrator login --->
		<cfif StructKeyExists(arguments, "adminUserId")>
			<cfset CreateObject("component", "CFIDE.adminapi.administrator").login(arguments.adminPassword, arguments.adminUserId)>
		<cfelse>
			<cfset CreateObject("component", "CFIDE.adminapi.administrator").login(arguments.adminPassword)>
		</cfif>
		
		<cftry>
			<cfset result = CreateObject("component", "CFIDE.adminapi.extensions").setWebService(argumentCollection=arguments)>
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
	

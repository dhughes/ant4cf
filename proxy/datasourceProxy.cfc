
<cfcomponent output="false">
	
		
	
				
	<cffunction name="setDerbyEmbedded" access="remote" output="false">
		
		
			<cfargument name="adminPassword" type="any" required="true">
			<cfargument name="adminUserId" type="any" required="false">
		
		
			
				<cfargument name="name" type="string" required="true">
			
		
			
				<cfargument name="database" type="string" required="true">
			
		
			
				<cfargument name="originaldsn" type="string" required="false">
			
		
			
				<cfargument name="driver" type="string" required="false">
			
		
			
				<cfargument name="class" type="string" required="false">
			
		
			
				<cfargument name="username" type="string" required="false">
			
		
			
				<cfargument name="password" type="string" required="false">
			
		
			
				<cfargument name="encryptpassword" type="boolean" required="false">
			
		
			
				<cfargument name="description" type="string" required="false">
			
		
			
				<cfargument name="args" type="string" required="false">
			
		
			
				<cfargument name="isnewdb" type="boolean" required="false">
			
		
			
				<cfargument name="timeout" type="numeric" required="false">
			
		
			
				<cfargument name="interval" type="numeric" required="false">
			
		
			
				<cfargument name="login_timeout" type="numeric" required="false">
			
		
			
				<cfargument name="buffer" type="numeric" required="false">
			
		
			
				<cfargument name="blob_buffer" type="numeric" required="false">
			
		
			
				<cfargument name="enablemaxconnections" type="boolean" required="false">
			
		
			
				<cfargument name="maxconnections" type="numeric" required="false">
			
		
			
				<cfargument name="pooling" type="boolean" required="false">
			
		
			
				<cfargument name="disable" type="boolean" required="false">
			
		
			
				<cfargument name="disable_clob" type="boolean" required="false">
			
		
			
				<cfargument name="disable_blob" type="boolean" required="false">
			
		
			
				<cfargument name="select" type="boolean" required="false">
			
		
			
				<cfargument name="create" type="boolean" required="false">
			
		
			
				<cfargument name="grant" type="boolean" required="false">
			
		
			
				<cfargument name="insert" type="boolean" required="false">
			
		
			
				<cfargument name="drop" type="boolean" required="false">
			
		
			
				<cfargument name="revoke" type="boolean" required="false">
			
		
			
				<cfargument name="update" type="boolean" required="false">
			
		
			
				<cfargument name="alter" type="boolean" required="false">
			
		
			
				<cfargument name="storedproc" type="boolean" required="false">
			
		
			
				<cfargument name="delete" type="boolean" required="false">
			
		
			
				<cfargument name="validationQuery" type="string" required="false">
			
		
		
		<cfset var result = 0 />
				
		<!--- convert datatypes --->
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
		
		<!--- first call administrator login --->
		<cfif StructKeyExists(arguments, "adminUserId")>
			<cfset CreateObject("component", "CFIDE.adminapi.administrator").login(arguments.adminPassword, arguments.adminUserId)>
		<cfelse>
			<cfset CreateObject("component", "CFIDE.adminapi.administrator").login(arguments.adminPassword)>
		</cfif>
		
		<cftry>
			<cfset result = CreateObject("component", "CFIDE.adminapi.datasource").setDerbyEmbedded(argumentCollection=arguments)>
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
		
	
		
	
		
	
		
	
				
	<cffunction name="setMSAccessUnicode" access="remote" output="false">
		
		
			<cfargument name="adminPassword" type="any" required="true">
			<cfargument name="adminUserId" type="any" required="false">
		
		
			
				<cfargument name="name" type="string" required="true">
			
		
			
				<cfargument name="databasefile" type="string" required="true">
			
		
			
				<cfargument name="originaldsn" type="string" required="false">
			
		
			
				<cfargument name="driver" type="string" required="false">
			
		
			
				<cfargument name="class" type="string" required="false">
			
		
			
				<cfargument name="username" type="string" required="false">
			
		
			
				<cfargument name="password" type="string" required="false">
			
		
			
				<cfargument name="encryptpassword" type="boolean" required="false">
			
		
			
				<cfargument name="description" type="string" required="false">
			
		
			
				<cfargument name="args" type="string" required="false">
			
		
			
				<cfargument name="pageTimeout" type="numeric" required="false">
			
		
			
				<cfargument name="maxBufferSize" type="numeric" required="false">
			
		
			
				<cfargument name="timeout" type="numeric" required="false">
			
		
			
				<cfargument name="interval" type="numeric" required="false">
			
		
			
				<cfargument name="login_timeout" type="numeric" required="false">
			
		
			
				<cfargument name="buffer" type="numeric" required="false">
			
		
			
				<cfargument name="blob_buffer" type="numeric" required="false">
			
		
			
				<cfargument name="enablemaxconnections" type="boolean" required="false">
			
		
			
				<cfargument name="maxconnections" type="numeric" required="false">
			
		
			
				<cfargument name="pooling" type="boolean" required="false">
			
		
			
				<cfargument name="disable" type="boolean" required="false">
			
		
			
				<cfargument name="disable_clob" type="boolean" required="false">
			
		
			
				<cfargument name="disable_blob" type="boolean" required="false">
			
		
			
				<cfargument name="select" type="boolean" required="false">
			
		
			
				<cfargument name="create" type="boolean" required="false">
			
		
			
				<cfargument name="grant" type="boolean" required="false">
			
		
			
				<cfargument name="insert" type="boolean" required="false">
			
		
			
				<cfargument name="drop" type="boolean" required="false">
			
		
			
				<cfargument name="revoke" type="boolean" required="false">
			
		
			
				<cfargument name="update" type="boolean" required="false">
			
		
			
				<cfargument name="alter" type="boolean" required="false">
			
		
			
				<cfargument name="storedproc" type="boolean" required="false">
			
		
			
				<cfargument name="delete" type="boolean" required="false">
			
		
			
				<cfargument name="validationQuery" type="string" required="false">
			
		
		
		<cfset var result = 0 />
				
		<!--- convert datatypes --->
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
		
		<!--- first call administrator login --->
		<cfif StructKeyExists(arguments, "adminUserId")>
			<cfset CreateObject("component", "CFIDE.adminapi.administrator").login(arguments.adminPassword, arguments.adminUserId)>
		<cfelse>
			<cfset CreateObject("component", "CFIDE.adminapi.administrator").login(arguments.adminPassword)>
		</cfif>
		
		<cftry>
			<cfset result = CreateObject("component", "CFIDE.adminapi.datasource").setMSAccessUnicode(argumentCollection=arguments)>
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
		
	
				
	<cffunction name="stopOdbcService" access="remote" output="false">
		
		
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
			<cfset result = CreateObject("component", "CFIDE.adminapi.datasource").stopOdbcService(argumentCollection=arguments)>
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
		
	
		
	
				
	<cffunction name="setOther" access="remote" output="false">
		
		
			<cfargument name="adminPassword" type="any" required="true">
			<cfargument name="adminUserId" type="any" required="false">
		
		
			
				<cfargument name="name" type="string" required="true">
			
		
			
				<cfargument name="url" type="string" required="true">
			
		
			
				<cfargument name="class" type="string" required="true">
			
		
			
				<cfargument name="driver" type="string" required="false">
			
		
			
				<cfargument name="originaldsn" type="string" required="false">
			
		
			
				<cfargument name="port" type="string" required="false">
			
		
			
				<cfargument name="username" type="string" required="false">
			
		
			
				<cfargument name="password" type="string" required="false">
			
		
			
				<cfargument name="encryptpassword" type="boolean" required="false">
			
		
			
				<cfargument name="description" type="string" required="false">
			
		
			
				<cfargument name="args" type="string" required="false">
			
		
			
				<cfargument name="selectmethod" type="string" required="true">
			
		
			
				<cfargument name="MaxPooledStatements" type="numeric" required="false">
			
		
			
				<cfargument name="timeout" type="numeric" required="false">
			
		
			
				<cfargument name="interval" type="numeric" required="false">
			
		
			
				<cfargument name="login_timeout" type="numeric" required="false">
			
		
			
				<cfargument name="buffer" type="numeric" required="false">
			
		
			
				<cfargument name="blob_buffer" type="numeric" required="false">
			
		
			
				<cfargument name="enablemaxconnections" type="boolean" required="false">
			
		
			
				<cfargument name="maxconnections" type="numeric" required="false">
			
		
			
				<cfargument name="pooling" type="boolean" required="false">
			
		
			
				<cfargument name="disable" type="boolean" required="false">
			
		
			
				<cfargument name="disable_clob" type="boolean" required="false">
			
		
			
				<cfargument name="disable_blob" type="boolean" required="false">
			
		
			
				<cfargument name="select" type="boolean" required="false">
			
		
			
				<cfargument name="create" type="boolean" required="false">
			
		
			
				<cfargument name="grant" type="boolean" required="false">
			
		
			
				<cfargument name="insert" type="boolean" required="false">
			
		
			
				<cfargument name="drop" type="boolean" required="false">
			
		
			
				<cfargument name="revoke" type="boolean" required="false">
			
		
			
				<cfargument name="update" type="boolean" required="false">
			
		
			
				<cfargument name="alter" type="boolean" required="false">
			
		
			
				<cfargument name="storedproc" type="boolean" required="false">
			
		
			
				<cfargument name="delete" type="boolean" required="false">
			
		
			
				<cfargument name="validationQuery" type="string" required="false">
			
		
		
		<cfset var result = 0 />
				
		<!--- convert datatypes --->
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
		
		<!--- first call administrator login --->
		<cfif StructKeyExists(arguments, "adminUserId")>
			<cfset CreateObject("component", "CFIDE.adminapi.administrator").login(arguments.adminPassword, arguments.adminUserId)>
		<cfelse>
			<cfset CreateObject("component", "CFIDE.adminapi.administrator").login(arguments.adminPassword)>
		</cfif>
		
		<cftry>
			<cfset result = CreateObject("component", "CFIDE.adminapi.datasource").setOther(argumentCollection=arguments)>
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
		
	
				
	<cffunction name="setMSSQL" access="remote" output="false">
		
		
			<cfargument name="adminPassword" type="any" required="true">
			<cfargument name="adminUserId" type="any" required="false">
		
		
			
				<cfargument name="vendor" type="string" required="false">
			
		
			
				<cfargument name="type" type="string" required="false">
			
		
			
				<cfargument name="name" type="string" required="true">
			
		
			
				<cfargument name="host" type="string" required="true">
			
		
			
				<cfargument name="database" type="string" required="true">
			
		
			
				<cfargument name="originaldsn" type="string" required="false">
			
		
			
				<cfargument name="port" type="string" required="false">
			
		
			
				<cfargument name="driver" type="string" required="false">
			
		
			
				<cfargument name="class" type="string" required="false">
			
		
			
				<cfargument name="username" type="string" required="false">
			
		
			
				<cfargument name="password" type="string" required="false">
			
		
			
				<cfargument name="encryptpassword" type="boolean" required="false">
			
		
			
				<cfargument name="description" type="string" required="false">
			
		
			
				<cfargument name="args" type="string" required="false">
			
		
			
				<cfargument name="sendStringParametersAsUnicode" type="boolean" required="false">
			
		
			
				<cfargument name="selectmethod" type="string" required="true">
			
		
			
				<cfargument name="MaxPooledStatements" type="numeric" required="false">
			
		
			
				<cfargument name="timeout" type="numeric" required="false">
			
		
			
				<cfargument name="interval" type="numeric" required="false">
			
		
			
				<cfargument name="login_timeout" type="numeric" required="false">
			
		
			
				<cfargument name="buffer" type="numeric" required="false">
			
		
			
				<cfargument name="blob_buffer" type="numeric" required="false">
			
		
			
				<cfargument name="enablemaxconnections" type="boolean" required="false">
			
		
			
				<cfargument name="maxconnections" type="numeric" required="false">
			
		
			
				<cfargument name="pooling" type="boolean" required="false">
			
		
			
				<cfargument name="disable" type="boolean" required="false">
			
		
			
				<cfargument name="disable_clob" type="boolean" required="false">
			
		
			
				<cfargument name="disable_blob" type="boolean" required="false">
			
		
			
				<cfargument name="select" type="boolean" required="false">
			
		
			
				<cfargument name="create" type="boolean" required="false">
			
		
			
				<cfargument name="grant" type="boolean" required="false">
			
		
			
				<cfargument name="insert" type="boolean" required="false">
			
		
			
				<cfargument name="drop" type="boolean" required="false">
			
		
			
				<cfargument name="revoke" type="boolean" required="false">
			
		
			
				<cfargument name="update" type="boolean" required="false">
			
		
			
				<cfargument name="alter" type="boolean" required="false">
			
		
			
				<cfargument name="storedproc" type="boolean" required="false">
			
		
			
				<cfargument name="delete" type="boolean" required="false">
			
		
			
				<cfargument name="validationQuery" type="string" required="false">
			
		
		
		<cfset var result = 0 />
				
		<!--- convert datatypes --->
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
		
		<!--- first call administrator login --->
		<cfif StructKeyExists(arguments, "adminUserId")>
			<cfset CreateObject("component", "CFIDE.adminapi.administrator").login(arguments.adminPassword, arguments.adminUserId)>
		<cfelse>
			<cfset CreateObject("component", "CFIDE.adminapi.administrator").login(arguments.adminPassword)>
		</cfif>
		
		<cftry>
			<cfset result = CreateObject("component", "CFIDE.adminapi.datasource").setMSSQL(argumentCollection=arguments)>
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
		
	
				
	<cffunction name="setSybase" access="remote" output="false">
		
		
			<cfargument name="adminPassword" type="any" required="true">
			<cfargument name="adminUserId" type="any" required="false">
		
		
			
				<cfargument name="vendor" type="string" required="false">
			
		
			
				<cfargument name="type" type="string" required="false">
			
		
			
				<cfargument name="name" type="string" required="true">
			
		
			
				<cfargument name="host" type="string" required="true">
			
		
			
				<cfargument name="database" type="string" required="true">
			
		
			
				<cfargument name="originaldsn" type="string" required="false">
			
		
			
				<cfargument name="port" type="string" required="false">
			
		
			
				<cfargument name="driver" type="string" required="false">
			
		
			
				<cfargument name="class" type="string" required="false">
			
		
			
				<cfargument name="username" type="string" required="false">
			
		
			
				<cfargument name="password" type="string" required="false">
			
		
			
				<cfargument name="encryptpassword" type="boolean" required="false">
			
		
			
				<cfargument name="description" type="string" required="false">
			
		
			
				<cfargument name="args" type="string" required="false">
			
		
			
				<cfargument name="selectmethod" type="string" required="false">
			
		
			
				<cfargument name="MaxPooledStatements" type="numeric" required="false">
			
		
			
				<cfargument name="timeout" type="numeric" required="false">
			
		
			
				<cfargument name="interval" type="numeric" required="false">
			
		
			
				<cfargument name="login_timeout" type="numeric" required="false">
			
		
			
				<cfargument name="buffer" type="numeric" required="false">
			
		
			
				<cfargument name="blob_buffer" type="numeric" required="false">
			
		
			
				<cfargument name="enablemaxconnections" type="boolean" required="false">
			
		
			
				<cfargument name="maxconnections" type="numeric" required="false">
			
		
			
				<cfargument name="pooling" type="boolean" required="false">
			
		
			
				<cfargument name="disable" type="boolean" required="false">
			
		
			
				<cfargument name="disable_clob" type="boolean" required="false">
			
		
			
				<cfargument name="disable_blob" type="boolean" required="false">
			
		
			
				<cfargument name="select" type="boolean" required="false">
			
		
			
				<cfargument name="create" type="boolean" required="false">
			
		
			
				<cfargument name="grant" type="boolean" required="false">
			
		
			
				<cfargument name="insert" type="boolean" required="false">
			
		
			
				<cfargument name="drop" type="boolean" required="false">
			
		
			
				<cfargument name="revoke" type="boolean" required="false">
			
		
			
				<cfargument name="update" type="boolean" required="false">
			
		
			
				<cfargument name="alter" type="boolean" required="false">
			
		
			
				<cfargument name="storedproc" type="boolean" required="false">
			
		
			
				<cfargument name="delete" type="boolean" required="false">
			
		
			
				<cfargument name="validationQuery" type="string" required="false">
			
		
		
		<cfset var result = 0 />
				
		<!--- convert datatypes --->
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
		
		<!--- first call administrator login --->
		<cfif StructKeyExists(arguments, "adminUserId")>
			<cfset CreateObject("component", "CFIDE.adminapi.administrator").login(arguments.adminPassword, arguments.adminUserId)>
		<cfelse>
			<cfset CreateObject("component", "CFIDE.adminapi.administrator").login(arguments.adminPassword)>
		</cfif>
		
		<cftry>
			<cfset result = CreateObject("component", "CFIDE.adminapi.datasource").setSybase(argumentCollection=arguments)>
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
		
	
		
	
				
	<cffunction name="deleteDatasource" access="remote" output="false">
		
		
			<cfargument name="adminPassword" type="any" required="true">
			<cfargument name="adminUserId" type="any" required="false">
		
		
			
				<cfargument name="dsnname"  required="true">
			
		
		
		<cfset var result = 0 />
				
		<!--- convert datatypes --->
		
			
		
		
		<!--- first call administrator login --->
		<cfif StructKeyExists(arguments, "adminUserId")>
			<cfset CreateObject("component", "CFIDE.adminapi.administrator").login(arguments.adminPassword, arguments.adminUserId)>
		<cfelse>
			<cfset CreateObject("component", "CFIDE.adminapi.administrator").login(arguments.adminPassword)>
		</cfif>
		
		<cftry>
			<cfset result = CreateObject("component", "CFIDE.adminapi.datasource").deleteDatasource(argumentCollection=arguments)>
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
		
	
				
	<cffunction name="setMSAccess" access="remote" output="false">
		
		
			<cfargument name="adminPassword" type="any" required="true">
			<cfargument name="adminUserId" type="any" required="false">
		
		
			
				<cfargument name="name" type="string" required="true">
			
		
			
				<cfargument name="databasefile" type="string" required="true">
			
		
			
				<cfargument name="originaldsn" type="string" required="false">
			
		
			
				<cfargument name="driver" type="string" required="false">
			
		
			
				<cfargument name="class" type="string" required="false">
			
		
			
				<cfargument name="port" type="string" required="false">
			
		
			
				<cfargument name="username" type="string" required="false">
			
		
			
				<cfargument name="password" type="string" required="false">
			
		
			
				<cfargument name="encryptpassword" type="boolean" required="false">
			
		
			
				<cfargument name="description" type="string" required="false">
			
		
			
				<cfargument name="args" type="string" required="false">
			
		
			
				<cfargument name="systemDatabaseFile" type="string" required="false">
			
		
			
				<cfargument name="UseTrustedConnection" type="boolean" required="false">
			
		
			
				<cfargument name="defaultusername" type="string" required="false">
			
		
			
				<cfargument name="maxBufferSize" type="numeric" required="false">
			
		
			
				<cfargument name="pageTimeout" type="numeric" required="false">
			
		
			
				<cfargument name="TimeStampAsString" type="boolean" required="false">
			
		
			
				<cfargument name="timeout" type="numeric" required="false">
			
		
			
				<cfargument name="interval" type="numeric" required="false">
			
		
			
				<cfargument name="login_timeout" type="numeric" required="false">
			
		
			
				<cfargument name="buffer" type="numeric" required="false">
			
		
			
				<cfargument name="blob_buffer" type="numeric" required="false">
			
		
			
				<cfargument name="enablemaxconnections" type="boolean" required="false">
			
		
			
				<cfargument name="maxconnections" type="numeric" required="false">
			
		
			
				<cfargument name="pooling" type="boolean" required="false">
			
		
			
				<cfargument name="disable" type="boolean" required="false">
			
		
			
				<cfargument name="disable_clob" type="boolean" required="false">
			
		
			
				<cfargument name="disable_blob" type="boolean" required="false">
			
		
			
				<cfargument name="select" type="boolean" required="false">
			
		
			
				<cfargument name="create" type="boolean" required="false">
			
		
			
				<cfargument name="grant" type="boolean" required="false">
			
		
			
				<cfargument name="insert" type="boolean" required="false">
			
		
			
				<cfargument name="drop" type="boolean" required="false">
			
		
			
				<cfargument name="revoke" type="boolean" required="false">
			
		
			
				<cfargument name="update" type="boolean" required="false">
			
		
			
				<cfargument name="alter" type="boolean" required="false">
			
		
			
				<cfargument name="storedproc" type="boolean" required="false">
			
		
			
				<cfargument name="delete" type="boolean" required="false">
			
		
			
				<cfargument name="validationQuery" type="string" required="false">
			
		
		
		<cfset var result = 0 />
				
		<!--- convert datatypes --->
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
		
		<!--- first call administrator login --->
		<cfif StructKeyExists(arguments, "adminUserId")>
			<cfset CreateObject("component", "CFIDE.adminapi.administrator").login(arguments.adminPassword, arguments.adminUserId)>
		<cfelse>
			<cfset CreateObject("component", "CFIDE.adminapi.administrator").login(arguments.adminPassword)>
		</cfif>
		
		<cftry>
			<cfset result = CreateObject("component", "CFIDE.adminapi.datasource").setMSAccess(argumentCollection=arguments)>
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
		
	
				
	<cffunction name="setODBCSocket" access="remote" output="false">
		
		
			<cfargument name="adminPassword" type="any" required="true">
			<cfargument name="adminUserId" type="any" required="false">
		
		
			
				<cfargument name="name" type="string" required="true">
			
		
			
				<cfargument name="datasource" type="string" required="true">
			
		
			
				<cfargument name="useTrustedConnection" type="string" required="false">
			
		
			
				<cfargument name="username" type="string" required="false">
			
		
			
				<cfargument name="password" type="string" required="false">
			
		
			
				<cfargument name="encryptpassword" type="boolean" required="false">
			
		
			
				<cfargument name="host" type="string" required="false">
			
		
			
				<cfargument name="originaldsn" type="string" required="false">
			
		
			
				<cfargument name="port" type="string" required="false">
			
		
			
				<cfargument name="driver" type="string" required="false">
			
		
			
				<cfargument name="class" type="string" required="false">
			
		
			
				<cfargument name="description" type="string" required="false">
			
		
			
				<cfargument name="args" type="string" required="false">
			
		
			
				<cfargument name="TimeStampAsString" type="boolean" required="false">
			
		
			
				<cfargument name="timeout" type="numeric" required="false">
			
		
			
				<cfargument name="interval" type="numeric" required="false">
			
		
			
				<cfargument name="login_timeout" type="numeric" required="false">
			
		
			
				<cfargument name="buffer" type="numeric" required="false">
			
		
			
				<cfargument name="blob_buffer" type="numeric" required="false">
			
		
			
				<cfargument name="enablemaxconnections" type="boolean" required="false">
			
		
			
				<cfargument name="maxconnections" type="numeric" required="false">
			
		
			
				<cfargument name="pooling" type="boolean" required="false">
			
		
			
				<cfargument name="disable" type="boolean" required="false">
			
		
			
				<cfargument name="disable_clob" type="boolean" required="false">
			
		
			
				<cfargument name="disable_blob" type="boolean" required="false">
			
		
			
				<cfargument name="select" type="boolean" required="false">
			
		
			
				<cfargument name="create" type="boolean" required="false">
			
		
			
				<cfargument name="grant" type="boolean" required="false">
			
		
			
				<cfargument name="insert" type="boolean" required="false">
			
		
			
				<cfargument name="drop" type="boolean" required="false">
			
		
			
				<cfargument name="revoke" type="boolean" required="false">
			
		
			
				<cfargument name="update" type="boolean" required="false">
			
		
			
				<cfargument name="alter" type="boolean" required="false">
			
		
			
				<cfargument name="storedproc" type="boolean" required="false">
			
		
			
				<cfargument name="delete" type="boolean" required="false">
			
		
			
				<cfargument name="validationQuery" type="string" required="false">
			
		
		
		<cfset var result = 0 />
				
		<!--- convert datatypes --->
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
		
		<!--- first call administrator login --->
		<cfif StructKeyExists(arguments, "adminUserId")>
			<cfset CreateObject("component", "CFIDE.adminapi.administrator").login(arguments.adminPassword, arguments.adminUserId)>
		<cfelse>
			<cfset CreateObject("component", "CFIDE.adminapi.administrator").login(arguments.adminPassword)>
		</cfif>
		
		<cftry>
			<cfset result = CreateObject("component", "CFIDE.adminapi.datasource").setODBCSocket(argumentCollection=arguments)>
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
		
	
				
	<cffunction name="getDriverDetails" access="remote" output="false">
		
		
			<cfargument name="adminPassword" type="any" required="true">
			<cfargument name="adminUserId" type="any" required="false">
		
		
			
				<cfargument name="driverName" type="String" required="false">
			
		
		
		<cfset var result = 0 />
				
		<!--- convert datatypes --->
		
			
		
		
		<!--- first call administrator login --->
		<cfif StructKeyExists(arguments, "adminUserId")>
			<cfset CreateObject("component", "CFIDE.adminapi.administrator").login(arguments.adminPassword, arguments.adminUserId)>
		<cfelse>
			<cfset CreateObject("component", "CFIDE.adminapi.administrator").login(arguments.adminPassword)>
		</cfif>
		
		<cftry>
			<cfset result = CreateObject("component", "CFIDE.adminapi.datasource").getDriverDetails(argumentCollection=arguments)>
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
		
	
		
	
				
	<cffunction name="setDB2" access="remote" output="false">
		
		
			<cfargument name="adminPassword" type="any" required="true">
			<cfargument name="adminUserId" type="any" required="false">
		
		
			
				<cfargument name="name" type="string" required="true">
			
		
			
				<cfargument name="host" type="string" required="true">
			
		
			
				<cfargument name="database" type="string" required="true">
			
		
			
				<cfargument name="originaldsn" type="string" required="false">
			
		
			
				<cfargument name="port" type="string" required="false">
			
		
			
				<cfargument name="driver" type="string" required="false">
			
		
			
				<cfargument name="class" type="string" required="false">
			
		
			
				<cfargument name="username" type="string" required="false">
			
		
			
				<cfargument name="password" type="string" required="false">
			
		
			
				<cfargument name="encryptpassword" type="boolean" required="false">
			
		
			
				<cfargument name="description" type="string" required="false">
			
		
			
				<cfargument name="initargs" type="string" required="false">
			
		
			
				<cfargument name="args" type="string" required="false">
			
		
			
				<cfargument name="MaxPooledStatements" type="numeric" required="false">
			
		
			
				<cfargument name="timeout" type="numeric" required="false">
			
		
			
				<cfargument name="interval" type="numeric" required="false">
			
		
			
				<cfargument name="login_timeout" type="numeric" required="false">
			
		
			
				<cfargument name="buffer" type="numeric" required="false">
			
		
			
				<cfargument name="blob_buffer" type="numeric" required="false">
			
		
			
				<cfargument name="enablemaxconnections" type="boolean" required="false">
			
		
			
				<cfargument name="maxconnections" type="numeric" required="false">
			
		
			
				<cfargument name="pooling" type="boolean" required="false">
			
		
			
				<cfargument name="disable" type="boolean" required="false">
			
		
			
				<cfargument name="disable_clob" type="boolean" required="false">
			
		
			
				<cfargument name="disable_blob" type="boolean" required="false">
			
		
			
				<cfargument name="select" type="boolean" required="false">
			
		
			
				<cfargument name="create" type="boolean" required="false">
			
		
			
				<cfargument name="grant" type="boolean" required="false">
			
		
			
				<cfargument name="insert" type="boolean" required="false">
			
		
			
				<cfargument name="drop" type="boolean" required="false">
			
		
			
				<cfargument name="revoke" type="boolean" required="false">
			
		
			
				<cfargument name="update" type="boolean" required="false">
			
		
			
				<cfargument name="alter" type="boolean" required="false">
			
		
			
				<cfargument name="storedproc" type="boolean" required="false">
			
		
			
				<cfargument name="vendor" type="string" required="false">
			
		
			
				<cfargument name="type" type="string" required="false">
			
		
			
				<cfargument name="validationQuery" type="string" required="false">
			
		
		
		<cfset var result = 0 />
				
		<!--- convert datatypes --->
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
		
		<!--- first call administrator login --->
		<cfif StructKeyExists(arguments, "adminUserId")>
			<cfset CreateObject("component", "CFIDE.adminapi.administrator").login(arguments.adminPassword, arguments.adminUserId)>
		<cfelse>
			<cfset CreateObject("component", "CFIDE.adminapi.administrator").login(arguments.adminPassword)>
		</cfif>
		
		<cftry>
			<cfset result = CreateObject("component", "CFIDE.adminapi.datasource").setDB2(argumentCollection=arguments)>
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
		
	
				
	<cffunction name="verifyDsn" access="remote" output="false">
		
		
			<cfargument name="adminPassword" type="any" required="true">
			<cfargument name="adminUserId" type="any" required="false">
		
		
			
				<cfargument name="dsn"  required="true">
			
		
			
				<cfargument name="returnMsgOnError" type="boolean" required="false">
			
		
		
		<cfset var result = 0 />
				
		<!--- convert datatypes --->
		
			
		
			
		
		
		<!--- first call administrator login --->
		<cfif StructKeyExists(arguments, "adminUserId")>
			<cfset CreateObject("component", "CFIDE.adminapi.administrator").login(arguments.adminPassword, arguments.adminUserId)>
		<cfelse>
			<cfset CreateObject("component", "CFIDE.adminapi.administrator").login(arguments.adminPassword)>
		</cfif>
		
		<cftry>
			<cfset result = CreateObject("component", "CFIDE.adminapi.datasource").verifyDsn(argumentCollection=arguments)>
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
		
	
		
	
		
	
		
	
		
	
				
	<cffunction name="setMySQL" access="remote" output="false">
		
		
			<cfargument name="adminPassword" type="any" required="true">
			<cfargument name="adminUserId" type="any" required="false">
		
		
			
				<cfargument name="name" type="string" required="true">
			
		
			
				<cfargument name="host" type="string" required="true">
			
		
			
				<cfargument name="database" type="string" required="true">
			
		
			
				<cfargument name="originaldsn" type="string" required="false">
			
		
			
				<cfargument name="port" type="string" required="false">
			
		
			
				<cfargument name="driver" type="string" required="false">
			
		
			
				<cfargument name="class" type="string" required="false">
			
		
			
				<cfargument name="username" type="string" required="false">
			
		
			
				<cfargument name="password" type="string" required="false">
			
		
			
				<cfargument name="encryptpassword" type="boolean" required="false">
			
		
			
				<cfargument name="description" type="string" required="false">
			
		
			
				<cfargument name="args" type="string" required="false">
			
		
			
				<cfargument name="timeout" type="numeric" required="false">
			
		
			
				<cfargument name="interval" type="numeric" required="false">
			
		
			
				<cfargument name="login_timeout" type="numeric" required="false">
			
		
			
				<cfargument name="buffer" type="numeric" required="false">
			
		
			
				<cfargument name="blob_buffer" type="numeric" required="false">
			
		
			
				<cfargument name="enablemaxconnections" type="boolean" required="false">
			
		
			
				<cfargument name="maxconnections" type="numeric" required="false">
			
		
			
				<cfargument name="pooling" type="boolean" required="false">
			
		
			
				<cfargument name="disable" type="boolean" required="false">
			
		
			
				<cfargument name="disable_clob" type="boolean" required="false">
			
		
			
				<cfargument name="disable_blob" type="boolean" required="false">
			
		
			
				<cfargument name="select" type="boolean" required="false">
			
		
			
				<cfargument name="create" type="boolean" required="false">
			
		
			
				<cfargument name="grant" type="boolean" required="false">
			
		
			
				<cfargument name="insert" type="boolean" required="false">
			
		
			
				<cfargument name="drop" type="boolean" required="false">
			
		
			
				<cfargument name="revoke" type="boolean" required="false">
			
		
			
				<cfargument name="update" type="boolean" required="false">
			
		
			
				<cfargument name="alter" type="boolean" required="false">
			
		
			
				<cfargument name="storedproc" type="boolean" required="false">
			
		
			
				<cfargument name="delete" type="boolean" required="false">
			
		
			
				<cfargument name="validationQuery" type="string" required="false">
			
		
		
		<cfset var result = 0 />
				
		<!--- convert datatypes --->
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
		
		<!--- first call administrator login --->
		<cfif StructKeyExists(arguments, "adminUserId")>
			<cfset CreateObject("component", "CFIDE.adminapi.administrator").login(arguments.adminPassword, arguments.adminUserId)>
		<cfelse>
			<cfset CreateObject("component", "CFIDE.adminapi.administrator").login(arguments.adminPassword)>
		</cfif>
		
		<cftry>
			<cfset result = CreateObject("component", "CFIDE.adminapi.datasource").setMySQL(argumentCollection=arguments)>
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
		
	
				
	<cffunction name="setMySQL5" access="remote" output="false">
		
		
			<cfargument name="adminPassword" type="any" required="true">
			<cfargument name="adminUserId" type="any" required="false">
		
		
			
				<cfargument name="name" type="string" required="true">
			
		
			
				<cfargument name="host" type="string" required="true">
			
		
			
				<cfargument name="database" type="string" required="true">
			
		
			
				<cfargument name="originaldsn" type="string" required="false">
			
		
			
				<cfargument name="port" type="string" required="false">
			
		
			
				<cfargument name="driver" type="string" required="false">
			
		
			
				<cfargument name="class" type="string" required="false">
			
		
			
				<cfargument name="username" type="string" required="false">
			
		
			
				<cfargument name="password" type="string" required="false">
			
		
			
				<cfargument name="encryptpassword" type="boolean" required="false">
			
		
			
				<cfargument name="description" type="string" required="false">
			
		
			
				<cfargument name="args" type="string" required="false">
			
		
			
				<cfargument name="timeout" type="numeric" required="false">
			
		
			
				<cfargument name="interval" type="numeric" required="false">
			
		
			
				<cfargument name="login_timeout" type="numeric" required="false">
			
		
			
				<cfargument name="buffer" type="numeric" required="false">
			
		
			
				<cfargument name="blob_buffer" type="numeric" required="false">
			
		
			
				<cfargument name="enablemaxconnections" type="boolean" required="false">
			
		
			
				<cfargument name="maxconnections" type="numeric" required="false">
			
		
			
				<cfargument name="pooling" type="boolean" required="false">
			
		
			
				<cfargument name="disable" type="boolean" required="false">
			
		
			
				<cfargument name="disable_clob" type="boolean" required="false">
			
		
			
				<cfargument name="disable_blob" type="boolean" required="false">
			
		
			
				<cfargument name="select" type="boolean" required="false">
			
		
			
				<cfargument name="create" type="boolean" required="false">
			
		
			
				<cfargument name="grant" type="boolean" required="false">
			
		
			
				<cfargument name="insert" type="boolean" required="false">
			
		
			
				<cfargument name="drop" type="boolean" required="false">
			
		
			
				<cfargument name="revoke" type="boolean" required="false">
			
		
			
				<cfargument name="update" type="boolean" required="false">
			
		
			
				<cfargument name="alter" type="boolean" required="false">
			
		
			
				<cfargument name="storedproc" type="boolean" required="false">
			
		
			
				<cfargument name="delete" type="boolean" required="false">
			
		
			
				<cfargument name="validationQuery" type="string" required="false">
			
		
		
		<cfset var result = 0 />
				
		<!--- convert datatypes --->
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
		
		<!--- first call administrator login --->
		<cfif StructKeyExists(arguments, "adminUserId")>
			<cfset CreateObject("component", "CFIDE.adminapi.administrator").login(arguments.adminPassword, arguments.adminUserId)>
		<cfelse>
			<cfset CreateObject("component", "CFIDE.adminapi.administrator").login(arguments.adminPassword)>
		</cfif>
		
		<cftry>
			<cfset result = CreateObject("component", "CFIDE.adminapi.datasource").setMySQL5(argumentCollection=arguments)>
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
		
	
				
	<cffunction name="setPostGreSQL" access="remote" output="false">
		
		
			<cfargument name="adminPassword" type="any" required="true">
			<cfargument name="adminUserId" type="any" required="false">
		
		
			
				<cfargument name="name" type="string" required="true">
			
		
			
				<cfargument name="host" type="string" required="true">
			
		
			
				<cfargument name="database" type="string" required="true">
			
		
			
				<cfargument name="originaldsn" type="string" required="false">
			
		
			
				<cfargument name="port" type="string" required="false">
			
		
			
				<cfargument name="driver" type="string" required="false">
			
		
			
				<cfargument name="class" type="string" required="false">
			
		
			
				<cfargument name="username" type="string" required="false">
			
		
			
				<cfargument name="password" type="string" required="false">
			
		
			
				<cfargument name="encryptpassword" type="boolean" required="false">
			
		
			
				<cfargument name="description" type="string" required="false">
			
		
			
				<cfargument name="args" type="string" required="false">
			
		
			
				<cfargument name="timeout" type="numeric" required="false">
			
		
			
				<cfargument name="interval" type="numeric" required="false">
			
		
			
				<cfargument name="login_timeout" type="numeric" required="false">
			
		
			
				<cfargument name="buffer" type="numeric" required="false">
			
		
			
				<cfargument name="blob_buffer" type="numeric" required="false">
			
		
			
				<cfargument name="enablemaxconnections" type="boolean" required="false">
			
		
			
				<cfargument name="maxconnections" type="numeric" required="false">
			
		
			
				<cfargument name="pooling" type="boolean" required="false">
			
		
			
				<cfargument name="disable" type="boolean" required="false">
			
		
			
				<cfargument name="disable_clob" type="boolean" required="false">
			
		
			
				<cfargument name="disable_blob" type="boolean" required="false">
			
		
			
				<cfargument name="select" type="boolean" required="false">
			
		
			
				<cfargument name="create" type="boolean" required="false">
			
		
			
				<cfargument name="grant" type="boolean" required="false">
			
		
			
				<cfargument name="insert" type="boolean" required="false">
			
		
			
				<cfargument name="drop" type="boolean" required="false">
			
		
			
				<cfargument name="revoke" type="boolean" required="false">
			
		
			
				<cfargument name="update" type="boolean" required="false">
			
		
			
				<cfargument name="alter" type="boolean" required="false">
			
		
			
				<cfargument name="storedproc" type="boolean" required="false">
			
		
			
				<cfargument name="delete" type="boolean" required="false">
			
		
			
				<cfargument name="validationQuery" type="string" required="false">
			
		
		
		<cfset var result = 0 />
				
		<!--- convert datatypes --->
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
		
		<!--- first call administrator login --->
		<cfif StructKeyExists(arguments, "adminUserId")>
			<cfset CreateObject("component", "CFIDE.adminapi.administrator").login(arguments.adminPassword, arguments.adminUserId)>
		<cfelse>
			<cfset CreateObject("component", "CFIDE.adminapi.administrator").login(arguments.adminPassword)>
		</cfif>
		
		<cftry>
			<cfset result = CreateObject("component", "CFIDE.adminapi.datasource").setPostGreSQL(argumentCollection=arguments)>
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
		
	
				
	<cffunction name="setOracle" access="remote" output="false">
		
		
			<cfargument name="adminPassword" type="any" required="true">
			<cfargument name="adminUserId" type="any" required="false">
		
		
			
				<cfargument name="vendor" type="string" required="false">
			
		
			
				<cfargument name="type" type="string" required="false">
			
		
			
				<cfargument name="name" type="string" required="true">
			
		
			
				<cfargument name="host" type="string" required="true">
			
		
			
				<cfargument name="sid" type="string" required="true">
			
		
			
				<cfargument name="originaldsn" type="string" required="false">
			
		
			
				<cfargument name="port" type="string" required="false">
			
		
			
				<cfargument name="driver" type="string" required="false">
			
		
			
				<cfargument name="class" type="string" required="false">
			
		
			
				<cfargument name="username" type="string" required="false">
			
		
			
				<cfargument name="password" type="string" required="false">
			
		
			
				<cfargument name="encryptpassword" type="boolean" required="false">
			
		
			
				<cfargument name="description" type="string" required="false">
			
		
			
				<cfargument name="args" type="string" required="false">
			
		
			
				<cfargument name="MaxPooledStatements" type="numeric" required="false">
			
		
			
				<cfargument name="timeout" type="numeric" required="false">
			
		
			
				<cfargument name="interval" type="numeric" required="false">
			
		
			
				<cfargument name="login_timeout" type="numeric" required="false">
			
		
			
				<cfargument name="buffer" type="numeric" required="false">
			
		
			
				<cfargument name="blob_buffer" type="numeric" required="false">
			
		
			
				<cfargument name="enablemaxconnections" type="boolean" required="false">
			
		
			
				<cfargument name="maxconnections" type="numeric" required="false">
			
		
			
				<cfargument name="pooling" type="boolean" required="false">
			
		
			
				<cfargument name="disable" type="boolean" required="false">
			
		
			
				<cfargument name="disable_clob" type="boolean" required="false">
			
		
			
				<cfargument name="disable_blob" type="boolean" required="false">
			
		
			
				<cfargument name="select" type="boolean" required="false">
			
		
			
				<cfargument name="create" type="boolean" required="false">
			
		
			
				<cfargument name="grant" type="boolean" required="false">
			
		
			
				<cfargument name="insert" type="boolean" required="false">
			
		
			
				<cfargument name="drop" type="boolean" required="false">
			
		
			
				<cfargument name="revoke" type="boolean" required="false">
			
		
			
				<cfargument name="update" type="boolean" required="false">
			
		
			
				<cfargument name="alter" type="boolean" required="false">
			
		
			
				<cfargument name="storedproc" type="boolean" required="false">
			
		
			
				<cfargument name="delete" type="boolean" required="false">
			
		
			
				<cfargument name="validationQuery" type="string" required="false">
			
		
		
		<cfset var result = 0 />
				
		<!--- convert datatypes --->
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
		
		<!--- first call administrator login --->
		<cfif StructKeyExists(arguments, "adminUserId")>
			<cfset CreateObject("component", "CFIDE.adminapi.administrator").login(arguments.adminPassword, arguments.adminUserId)>
		<cfelse>
			<cfset CreateObject("component", "CFIDE.adminapi.administrator").login(arguments.adminPassword)>
		</cfif>
		
		<cftry>
			<cfset result = CreateObject("component", "CFIDE.adminapi.datasource").setOracle(argumentCollection=arguments)>
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
		
	
				
	<cffunction name="getDatasources" access="remote" output="false">
		
		
			<cfargument name="adminPassword" type="any" required="true">
			<cfargument name="adminUserId" type="any" required="false">
		
		
			
				<cfargument name="dsnname"  required="false">
			
		
		
		<cfset var result = 0 />
				
		<!--- convert datatypes --->
		
			
		
		
		<!--- first call administrator login --->
		<cfif StructKeyExists(arguments, "adminUserId")>
			<cfset CreateObject("component", "CFIDE.adminapi.administrator").login(arguments.adminPassword, arguments.adminUserId)>
		<cfelse>
			<cfset CreateObject("component", "CFIDE.adminapi.administrator").login(arguments.adminPassword)>
		</cfif>
		
		<cftry>
			<cfset result = CreateObject("component", "CFIDE.adminapi.datasource").getDatasources(argumentCollection=arguments)>
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
		
	
				
	<cffunction name="removeOdbcService" access="remote" output="false">
		
		
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
			<cfset result = CreateObject("component", "CFIDE.adminapi.datasource").removeOdbcService(argumentCollection=arguments)>
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
		
	
		
	
				
	<cffunction name="setInformix" access="remote" output="false">
		
		
			<cfargument name="adminPassword" type="any" required="true">
			<cfargument name="adminUserId" type="any" required="false">
		
		
			
				<cfargument name="vendor" type="string" required="false">
			
		
			
				<cfargument name="type" type="string" required="false">
			
		
			
				<cfargument name="name" type="string" required="true">
			
		
			
				<cfargument name="host" type="string" required="true">
			
		
			
				<cfargument name="database" type="string" required="true">
			
		
			
				<cfargument name="InformixServer" type="string" required="true">
			
		
			
				<cfargument name="originaldsn" type="string" required="false">
			
		
			
				<cfargument name="port" type="string" required="false">
			
		
			
				<cfargument name="driver" type="string" required="false">
			
		
			
				<cfargument name="class" type="string" required="false">
			
		
			
				<cfargument name="username" type="string" required="false">
			
		
			
				<cfargument name="password" type="string" required="false">
			
		
			
				<cfargument name="encryptpassword" type="boolean" required="false">
			
		
			
				<cfargument name="description" type="string" required="false">
			
		
			
				<cfargument name="args" type="string" required="false">
			
		
			
				<cfargument name="MaxPooledStatements" type="numeric" required="false">
			
		
			
				<cfargument name="timeout" type="numeric" required="false">
			
		
			
				<cfargument name="interval" type="numeric" required="false">
			
		
			
				<cfargument name="login_timeout" type="numeric" required="false">
			
		
			
				<cfargument name="buffer" type="numeric" required="false">
			
		
			
				<cfargument name="blob_buffer" type="numeric" required="false">
			
		
			
				<cfargument name="enablemaxconnections" type="boolean" required="false">
			
		
			
				<cfargument name="maxconnections" type="numeric" required="false">
			
		
			
				<cfargument name="pooling" type="boolean" required="false">
			
		
			
				<cfargument name="disable" type="boolean" required="false">
			
		
			
				<cfargument name="disable_clob" type="boolean" required="false">
			
		
			
				<cfargument name="disable_blob" type="boolean" required="false">
			
		
			
				<cfargument name="select" type="boolean" required="false">
			
		
			
				<cfargument name="create" type="boolean" required="false">
			
		
			
				<cfargument name="grant" type="boolean" required="false">
			
		
			
				<cfargument name="insert" type="boolean" required="false">
			
		
			
				<cfargument name="drop" type="boolean" required="false">
			
		
			
				<cfargument name="revoke" type="boolean" required="false">
			
		
			
				<cfargument name="update" type="boolean" required="false">
			
		
			
				<cfargument name="alter" type="boolean" required="false">
			
		
			
				<cfargument name="storedproc" type="boolean" required="false">
			
		
			
				<cfargument name="delete" type="boolean" required="false">
			
		
			
				<cfargument name="validationQuery" type="string" required="false">
			
		
		
		<cfset var result = 0 />
				
		<!--- convert datatypes --->
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
		
		<!--- first call administrator login --->
		<cfif StructKeyExists(arguments, "adminUserId")>
			<cfset CreateObject("component", "CFIDE.adminapi.administrator").login(arguments.adminPassword, arguments.adminUserId)>
		<cfelse>
			<cfset CreateObject("component", "CFIDE.adminapi.administrator").login(arguments.adminPassword)>
		</cfif>
		
		<cftry>
			<cfset result = CreateObject("component", "CFIDE.adminapi.datasource").setInformix(argumentCollection=arguments)>
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
		
	
				
	<cffunction name="getODBCDatasources" access="remote" output="false">
		
		
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
			<cfset result = CreateObject("component", "CFIDE.adminapi.datasource").getODBCDatasources(argumentCollection=arguments)>
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
		
	
		
	
		
	
				
	<cffunction name="installOdbcService" access="remote" output="false">
		
		
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
			<cfset result = CreateObject("component", "CFIDE.adminapi.datasource").installOdbcService(argumentCollection=arguments)>
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
		
	
		
	
				
	<cffunction name="startOdbcService" access="remote" output="false">
		
		
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
			<cfset result = CreateObject("component", "CFIDE.adminapi.datasource").startOdbcService(argumentCollection=arguments)>
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
		
	
				
	<cffunction name="setDerbyClient" access="remote" output="false">
		
		
			<cfargument name="adminPassword" type="any" required="true">
			<cfargument name="adminUserId" type="any" required="false">
		
		
			
				<cfargument name="name" type="string" required="true">
			
		
			
				<cfargument name="host" type="string" required="true">
			
		
			
				<cfargument name="database" type="string" required="true">
			
		
			
				<cfargument name="originaldsn" type="string" required="false">
			
		
			
				<cfargument name="driver" type="string" required="false">
			
		
			
				<cfargument name="class" type="string" required="false">
			
		
			
				<cfargument name="username" type="string" required="false">
			
		
			
				<cfargument name="password" type="string" required="false">
			
		
			
				<cfargument name="encryptpassword" type="boolean" required="false">
			
		
			
				<cfargument name="description" type="string" required="false">
			
		
			
				<cfargument name="args" type="string" required="false">
			
		
			
				<cfargument name="timeout" type="numeric" required="false">
			
		
			
				<cfargument name="interval" type="numeric" required="false">
			
		
			
				<cfargument name="login_timeout" type="numeric" required="false">
			
		
			
				<cfargument name="buffer" type="numeric" required="false">
			
		
			
				<cfargument name="blob_buffer" type="numeric" required="false">
			
		
			
				<cfargument name="enablemaxconnections" type="boolean" required="false">
			
		
			
				<cfargument name="maxconnections" type="numeric" required="false">
			
		
			
				<cfargument name="pooling" type="boolean" required="false">
			
		
			
				<cfargument name="disable" type="boolean" required="false">
			
		
			
				<cfargument name="disable_clob" type="boolean" required="false">
			
		
			
				<cfargument name="disable_blob" type="boolean" required="false">
			
		
			
				<cfargument name="select" type="boolean" required="false">
			
		
			
				<cfargument name="create" type="boolean" required="false">
			
		
			
				<cfargument name="grant" type="boolean" required="false">
			
		
			
				<cfargument name="insert" type="boolean" required="false">
			
		
			
				<cfargument name="drop" type="boolean" required="false">
			
		
			
				<cfargument name="revoke" type="boolean" required="false">
			
		
			
				<cfargument name="update" type="boolean" required="false">
			
		
			
				<cfargument name="alter" type="boolean" required="false">
			
		
			
				<cfargument name="storedproc" type="boolean" required="false">
			
		
			
				<cfargument name="delete" type="boolean" required="false">
			
		
			
				<cfargument name="validationQuery" type="string" required="false">
			
		
		
		<cfset var result = 0 />
				
		<!--- convert datatypes --->
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
			
		
		
		<!--- first call administrator login --->
		<cfif StructKeyExists(arguments, "adminUserId")>
			<cfset CreateObject("component", "CFIDE.adminapi.administrator").login(arguments.adminPassword, arguments.adminUserId)>
		<cfelse>
			<cfset CreateObject("component", "CFIDE.adminapi.administrator").login(arguments.adminPassword)>
		</cfif>
		
		<cftry>
			<cfset result = CreateObject("component", "CFIDE.adminapi.datasource").setDerbyClient(argumentCollection=arguments)>
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
	

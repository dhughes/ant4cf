<cfcomponent output="false">
	
	<cfset this.name = "ant4cf" />

	<cffunction name="onRequestStart" returnType="boolean" output="false">
		<cfargument type="String" name="targetPage" required=true/>
		
		<!--- if we're given a longer timeout, use it --->
		<cfif IsDefined("timeout")>
			<cfsetting requesttimeout="#timeout#" />
		</cfif>
		
		<cfreturn true>
	</cffunction>
	
	<!--- <cffunction name="onRequest" returnType="void">
		<cfargument name="targetPage" type="String" required=true/>

		<cfif FileExists(Arguments.targetPage)>
			<cfinclude template="#Arguments.targetPage#">
		<cfelse>
			<cfthrow message="File does not exist" detail="The file '#Arguments.targetPage#' does not exist." />
		</cfif>
	</cffunction>
 --->
	
	<cffunction name="onError" returnType="void" output="true">
		<cfargument name="Exception" required="true"/>
		<cfargument name="EventName" type="String" required="true" />
		<cfset var abbreviatedException = StructNew() />
		
		<cfset abbreviatedException.message = Exception.message />
		<cfset abbreviatedException.detail = Exception.detail />
		<cfset abbreviatedException.tagContext = Exception.tagContext />
		
		<cftry>
    	    <cfheader statuscode="400" />
	        <cfcatch></cfcatch>
        </cftry>
		<cfdump var="#abbreviatedException#" format="text" />
		<cfabort />
	</cffunction>
	
	<cffunction name="onMissingTemplate" returnType="boolean" output="false">
		<cfargument name="targetPage" type="string" required="true" />
		<cfset var abbreviatedException = StructNew() />
				
		<cfset abbreviatedException.message = "File not found" />
		<cfset abbreviatedException.detail = "The file #arguments.targetpage# could not be found." />
		<cfset abbreviatedException.tagContext = ArrayNew(1) />
		
		<cfheader statuscode="404" />		
		<cfdump var="#abbreviatedException#" format="text" />
		<cfabort />
	</cffunction>



</cfcomponent>
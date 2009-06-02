<cfcomponent name="" hint="">

	<cfset variables.sessionId = createUUID() />
	<cfset variables.buildXml = "" />
	<!--- <cfset variables.libs = ArrayNew(1) /> --->
	<cfset resetExpires() />

	<cffunction name="getSessionId" access="public" hint="Getter for sessionId" output="false" returnType="string">
		<cfreturn variables.sessionId />
	</cffunction>

	<cffunction name="getBuildXml" access="public" hint="Getter for buildXml" output="false" returnType="xml">
		<cfreturn variables.buildXml />
	</cffunction>

	<cffunction name="setBuildXml" access="public" hint="Setter for buildXml" output="false" returnType="void">
		<cfargument name="buildXml" hint="I am the build file's xml" required="yes" type="xml" />
		<cfset variables.buildXml = XmlParse(arguments.buildXml) />
	</cffunction>

	<cffunction name="isExpired" access="public" hint="Getter for started" output="false" returnType="boolean">
		<cfreturn variables.expires LT now() />
	</cffunction>
	
	<cffunction name="resetExpires" access="public" hint="Resets the expiration time" output="false" returntype="void">
		<cfset variables.expires = DateAdd("n", 5, now()) />
	</cffunction>
	<!---
	<cffunction name="addLib" access="public" hint="I add a lib to the session" output="false" returntype="void">
		<cfargument name="lib" />
		<cfset ArrayAppend(variables.libs, arguments.lib) />
	</cffunction>
	
	<cffunction name="getLibs" access="public" hint="I return a list of libs" output="false" returntype="string"> 
		<cfreturn ArrayToList(variables.libs, ":") />
	</cffunction>
	--->
</cfcomponent>
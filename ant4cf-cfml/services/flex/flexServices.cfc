<cfcomponent>

	<cffunction name="destinationExists" access="remote" hint="I validate that the flex destination exists" returntype="boolean">
		<cfargument name="serviceArea" hint="messaging, proxy, or remoting" />
		<cfargument name="id" hint="I am the destination id to confirm exists" />
		
		<cfset var config = 0 />
		<cfset var found = 0 />
		
		<cffile action="read" file="#ListDeleteAt(server.ColdFusion.rootdir, ListLen(server.ColdFusion.rootdir, "/\"), "/\")#/flex/#serviceArea#-config.xml" variable="config" />
		
		<cfset config = XmlParse(config) />
		
		<!--- search config for the named destination --->
		<cfset found = XmlSearch(config, "/service/destination[@id='#id#']") />
		
		<cfreturn ArrayLen(found) IS 1 />
	</cffunction>

	<cffunction name="channelExists" access="remote" hint="I validate that the flex channel exists" returntype="boolean">
		<cfargument name="id" hint="I am the channel id to confirm exists" />
		
		<cfset var config = 0 />
		<cfset var found = 0 />
		
		<cffile action="read" file="#ListDeleteAt(server.ColdFusion.rootdir, ListLen(server.ColdFusion.rootdir, "/\"), "/\")#/flex/services-config.xml" variable="config" />
		
		<cfset config = XmlParse(config) />
		
		<!--- search config for the named destination --->
		<cfset found = XmlSearch(config, "/service/channel-definition[@id='#id#']") />
		
		<cfreturn ArrayLen(found) IS 1 />
	</cffunction>

</cfcomponent>
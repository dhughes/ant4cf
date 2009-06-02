<cfsilent>
	<cfapplication name="ant4cf" />
	<!--- if we're given a longer timeout, use it --->
	<cfif IsDefined("timeout")>
		<cfsetting requesttimeout="#timeout#" />
	</cfif>
</cfsilent>
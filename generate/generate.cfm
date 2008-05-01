<!--- this is a script that generates the java classes and the remote proxies --->

<!--- this is a list of the admin api components --->
<cfset components = "accessmanager,administrator,datasource,debugging,eventgateway,extensions,flex,mail,runtime,security,serverinstance,servermonitoring" />

<!--- loop over the components --->
<cfloop list="#components#" index="componentName">
	<!--- get the component metadata --->
	<cfset component = getComponentMetadata("CFIDE.adminapi.#componentName#") />
	
	<!--- generate the remote proxy --->
	<cfoutput>
	<cfsavecontent variable="remoteProxy">
[cfcomponent output="false"]
	<cfloop from="1" to="#ArrayLen(component.functions)#" index="x">
		<cfif NOT StructKeyExists(component.functions[x], "access") OR  component.functions[x].access IS "public">		
	[cffunction name="#component.functions[x].name#" access="remote" output="false"]
		<!--- <cfif structKeyExists(component.functions[x], "returntype")>returntype="#component.functions[x].returntype#"</cfif> --->
		<cfif component.functions[x].name IS NOT "login">
			[cfargument name="adminPassword" type="any" required="true"]
			[cfargument name="adminUserId" type="any" required="false"]
		</cfif>
		<cfloop from="1" to="#ArrayLen(component.functions[x].parameters)#" index="y">
			<cfif component.functions[x].parameters[y].name IS NOT "adminPassword" AND component.functions[x].parameters[y].name IS NOT "adminUserId">
				[cfargument name="#component.functions[x].parameters[y].name#" <cfif structKeyExists(component.functions[x].parameters[y], "type")>type="<cfif component.functions[x].parameters[y].type IS "array">string<cfelse>#component.functions[x].parameters[y].type#</cfif>"</cfif> <cfif structKeyExists(component.functions[x].parameters[y], "required")>required="#component.functions[x].parameters[y].required#"</cfif>]
			</cfif>
		</cfloop>
		
		[cfset var result = 0 /]
				
		[!--- convert datatypes ---]
		<cfloop from="1" to="#ArrayLen(component.functions[x].parameters)#" index="y">
			<cfif structKeyExists(component.functions[x].parameters[y], "type") AND component.functions[x].parameters[y].type IS "array">
				[cfset arguments.#component.functions[x].parameters[y].name# = ListToArray(arguments.#component.functions[x].parameters[y].name#) /]
			</cfif>
		</cfloop>
		
		[!--- first call administrator login ---]
		[cfif StructKeyExists(arguments, "adminUserId")]
			[cfset CreateObject("component", "CFIDE.adminapi.administrator").login(arguments.adminPassword, arguments.adminUserId)]
		[cfelse]
			[cfset CreateObject("component", "CFIDE.adminapi.administrator").login(arguments.adminPassword)]
		[/cfif]
		
		[cftry]
			[cfset result = CreateObject("component", "CFIDE.adminapi.#componentName#").#component.functions[x].name#(argumentCollection=arguments)]
			[cfcatch]
				[cfsavecontent variable="result"][cfdump var="##cfcatch##" format="text"][/cfsavecontent]
				[cfset result = "**EXCEPTION**##cfcatch##" /] 
			[/cfcatch]
		[/cftry]
		
		[cfif IsDefined("result")]
			[cfif NOT IsSimpleValue(result)]
				[cfsavecontent variable="result"][cfdump var="##result##" format="text"][/cfsavecontent]
			[/cfif]
		
			[cfreturn result /]
		[/cfif]
		
	[/cffunction]
		</cfif>
	</cfloop>
[/cfcomponent]
	</cfsavecontent>
	</cfoutput>

	<cfset remoteProxy = replace(remoteProxy, "[", "<", "all") />
	<cfset remoteProxy = replace(remoteProxy, "]", ">", "all") />
	
	<cffile action="write" file="#expandPath("../proxy/#componentName#Proxy.cfc")#" nameconflict="overwrite" mode="777" output="#remoteProxy#" />

	<!--- generate the java source files --->
	<cfoutput>
		<cfloop from="1" to="#ArrayLen(component.functions)#" index="x">
			<cfsavecontent variable="cfantTask">
package com.alagad.cfant;

import org.apache.tools.ant.BuildException;

public class cf#component.functions[x].name# extends ProxyTask {
	<cfloop from="1" to="#ArrayLen(component.functions[x].parameters)#" index="y">
		private String _#component.functions[x].parameters[y].name# = "";
	</cfloop>
	<cfif StructKeyExists(component.functions[x], "returnType") OR Left(component.functions[x].name, 3) IS "get">
		private String _property = "";	
	</cfif>
	<cfif component.functions[x].name IS "login">
		private String _rootUrl = "";	
	</cfif>
	
	<cfloop from="1" to="#ArrayLen(component.functions[x].parameters)#" index="y">
		public void set#component.functions[x].parameters[y].name#(String _#component.functions[x].parameters[y].name#) {
			this._#component.functions[x].parameters[y].name# = _#component.functions[x].parameters[y].name#;
		}
	
		private String get#component.functions[x].parameters[y].name#() {
			return this._#component.functions[x].parameters[y].name#;
		}
	</cfloop>
	
	<cfif StructKeyExists(component.functions[x], "returnType") OR Left(component.functions[x].name, 3) IS "get">
		public void setProperty(String _property) {
			this._property = _property;
		}
	
		private String getproperty() {
			return this._property;
		}
	</cfif>
	
	<cfif component.functions[x].name IS "login">
		public void setrootUrl(String _rootUrl) {
			this._rootUrl = _rootUrl;
		}
	
		private String getrootUrl() {
			return this._rootUrl;
		}
	</cfif>
		
	public void execute() throws BuildException {
		try{
			<cfif component.functions[x].name IS NOT "login">
				// get the login information from this project
				String adminPassword = getProject().getProperty("adminPassword");
				String adminUserId = getProject().getProperty("adminUserId");
				String rootUrl = getProject().getProperty("rootUrl");
				
				System.out.println(rootUrl);
			</cfif>
			
			// to make the http call we need to know at what URL the admin proxy is.
			String proxyUrl = <cfif component.functions[x].name IS "login">getrootUrl()<cfelse>rootUrl</cfif>;
			proxyUrl += "/proxy/#componentName#Proxy.cfc";
			proxyUrl += "?method=#component.functions[x].name#";
			proxyUrl += "&returnformat=plain";
			<cfif component.functions[x].name IS NOT "login">
				proxyUrl += "&adminPassword=" + adminPassword;
				if(!adminUserId.equals("")){
					proxyUrl += "&adminUserId=" + adminUserId;
				}
			</cfif>
			
			<cfloop from="1" to="#ArrayLen(component.functions[x].parameters)#" index="y">
				if(!get#component.functions[x].parameters[y].name#().equals("")){
					proxyUrl += "&#component.functions[x].parameters[y].name#=" + get#component.functions[x].parameters[y].name#(); 
				} 
			</cfloop>
		
			String result = getFromUrl(proxyUrl);
			
			<cfif StructKeyExists(component.functions[x], "returnType") OR Left(component.functions[x].name, 3) IS "get">
				getProject().setProperty(getproperty(), result);
			</cfif>
					
		} catch(NullPointerException e) { 
			System.out.println("You must use the cflogin task before any other other adminapi tasks");
			throw new BuildException(e.toString());
		} catch(Exception e){
			throw new BuildException(e.toString());
		}
		
		<cfif component.functions[x].name IS "login">
			// set the login information into the project
			getProject().setProperty("adminPassword", getadminPassword());
			getProject().setProperty("adminUserId", getadminUserId());
			getProject().setProperty("rootUrl", getrootUrl());
		</cfif>
	}
	
}
			</cfsavecontent>
			
			<!--- write the class file to disk --->
			<cffile action="write" file="#expandPath("../src/com/alagad/cfant/cf#component.functions[x].name#.java")#" nameconflict="overwrite" mode="777" output="#cfantTask#" />

			
		</cfloop>
	</cfoutput>

</cfloop>


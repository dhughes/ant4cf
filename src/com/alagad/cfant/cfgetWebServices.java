
package com.alagad.cfant;

import org.apache.tools.ant.BuildException;

public class cfgetWebServices extends ProxyTask {
	
		private String _name = "";
	
		private String _includeAutoRegistered = "";
	
	
		private String _property = "";	
	
	
	
		public void setname(String _name) {
			this._name = _name;
		}
	
		private String getname() {
			return this._name;
		}
	
		public void setincludeAutoRegistered(String _includeAutoRegistered) {
			this._includeAutoRegistered = _includeAutoRegistered;
		}
	
		private String getincludeAutoRegistered() {
			return this._includeAutoRegistered;
		}
	
	
	
		public void setProperty(String _property) {
			this._property = _property;
		}
	
		private String getproperty() {
			return this._property;
		}
	
		
	public void execute() throws BuildException {
		
			// get the login information from this project
			String adminPassword = getProject().getProperty("adminPassword");
			String adminUserId = getProject().getProperty("adminUserId");
		
		
		// to make the http call we need to know at what URL the admin proxy is.
		String proxyUrl = getProject().getProperty("rootUrl");
		proxyUrl += "/proxy/extensionsProxy.cfc";
		proxyUrl += "?method=getWebServices";
		proxyUrl += "&returnformat=plain";
		
			proxyUrl += "&adminPassword=" + adminPassword;
			if(!adminUserId.equals("")){
				proxyUrl += "&adminUserId=" + adminUserId;
			}
		
		
		
			if(!getname().equals("")){
				proxyUrl += "&name=" + getname(); 
			} 
		
			if(!getincludeAutoRegistered().equals("")){
				proxyUrl += "&includeAutoRegistered=" + getincludeAutoRegistered(); 
			} 
		
		
		try{
			String result = getFromUrl(proxyUrl);
			
			
				getProject().setProperty(getproperty(), result);
			
			
			// check to see if we need to set a property
		} catch(Exception e){
			throw new BuildException(e.getMessage());
		}
		
		
	}
	
}
			


package com.alagad.cfant;

import org.apache.tools.ant.BuildException;

public class cfsetMXMigrationFlag extends ProxyTask {
	
		private String _flag = "";
	
	
		private String _property = "";	
	
	
	
		public void setflag(String _flag) {
			this._flag = _flag;
		}
	
		private String getflag() {
			return this._flag;
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
		proxyUrl += "/proxy/administratorProxy.cfc";
		proxyUrl += "?method=setMXMigrationFlag";
		proxyUrl += "&returnformat=plain";
		
			proxyUrl += "&adminPassword=" + adminPassword;
			if(!adminUserId.equals("")){
				proxyUrl += "&adminUserId=" + adminUserId;
			}
		
		
		
			if(!getflag().equals("")){
				proxyUrl += "&flag=" + getflag(); 
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
			

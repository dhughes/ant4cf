
package com.alagad.cfant;

import org.apache.tools.ant.BuildException;

public class cfsetLoginUserIdRequired extends ProxyTask {
	
		private String _isUserIdRequired = "";
	
	
	
	
		public void setisUserIdRequired(String _isUserIdRequired) {
			this._isUserIdRequired = _isUserIdRequired;
		}
	
		private String getisUserIdRequired() {
			return this._isUserIdRequired;
		}
	
	
	
		
	public void execute() throws BuildException {
		
			// get the login information from this project
			String adminPassword = getProject().getProperty("adminPassword");
			String adminUserId = getProject().getProperty("adminUserId");
		
		
		// to make the http call we need to know at what URL the admin proxy is.
		String proxyUrl = getProject().getProperty("rootUrl");
		proxyUrl += "/proxy/securityProxy.cfc";
		proxyUrl += "?method=setLoginUserIdRequired";
		proxyUrl += "&returnformat=plain";
		
			proxyUrl += "&adminPassword=" + adminPassword;
			if(!adminUserId.equals("")){
				proxyUrl += "&adminUserId=" + adminUserId;
			}
		
		
		
			if(!getisUserIdRequired().equals("")){
				proxyUrl += "&isUserIdRequired=" + getisUserIdRequired(); 
			} 
		
		
		try{
			String result = getFromUrl(proxyUrl);
			
			
			
			// check to see if we need to set a property
		} catch(Exception e){
			throw new BuildException(e.getMessage());
		}
		
		
	}
	
}
			

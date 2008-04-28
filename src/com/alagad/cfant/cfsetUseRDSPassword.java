
package com.alagad.cfant;

import org.apache.tools.ant.BuildException;

public class cfsetUseRDSPassword extends ProxyTask {
	
		private String _useAdminPassword = "";
	
	
		private String _property = "";	
	
	
	
		public void setuseAdminPassword(String _useAdminPassword) {
			this._useAdminPassword = _useAdminPassword;
		}
	
		private String getuseAdminPassword() {
			return this._useAdminPassword;
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
		proxyUrl += "/proxy/securityProxy.cfc";
		proxyUrl += "?method=setUseRDSPassword";
		proxyUrl += "&returnformat=plain";
		
			proxyUrl += "&adminPassword=" + adminPassword;
			if(!adminUserId.equals("")){
				proxyUrl += "&adminUserId=" + adminUserId;
			}
		
		
		
			if(!getuseAdminPassword().equals("")){
				proxyUrl += "&useAdminPassword=" + getuseAdminPassword(); 
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
			


package com.alagad.cfant;

import org.apache.tools.ant.BuildException;

public class cfsetUseAdminPassword extends ProxyTask {
	
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
		try{
			
				// get the login information from this project
				String adminPassword = getProject().getProperty("adminPassword");
				String adminUserId = getProject().getProperty("adminUserId");
				String rootUrl = getProject().getProperty("rootUrl");
			
			
			// to make the http call we need to know at what URL the admin proxy is.
			String proxyUrl = rootUrl;
			proxyUrl += "/proxy/securityProxy.cfc";
			proxyUrl += "?method=setUseAdminPassword";
			proxyUrl += "&returnformat=plain";
			
				proxyUrl += "&adminPassword=" + adminPassword;
				if(!adminUserId.equals("")){
					proxyUrl += "&adminUserId=" + adminUserId;
				}
			
			
			
				if(!getuseAdminPassword().equals("")){
					proxyUrl += "&useAdminPassword=" + getuseAdminPassword(); 
				} 
			
		
			String result = getFromUrl(proxyUrl);
			
			
				getProject().setProperty(getproperty(), result);
			
					
		} catch(NullPointerException e) { 
			System.out.println("You must use the cflogin task before any other other adminapi tasks");
			throw new BuildException(e.toString());
		} catch(Exception e){
			throw new BuildException(e.toString());
		}
		
		
	}
	
}
			

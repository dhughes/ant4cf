
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
		try{
			
				// get the login information from this project
				String adminPassword = getProject().getProperty("adminPassword");
				String adminUserId = getProject().getProperty("adminUserId");
				String rootUrl = getProject().getProperty("rootUrl");
				
				System.out.println(rootUrl);
			
			
			// to make the http call we need to know at what URL the admin proxy is.
			String proxyUrl = rootUrl;
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
			
		
			String result = getFromUrl(proxyUrl);
			
			
					
		} catch(NullPointerException e) { 
			System.out.println("You must use the cflogin task before any other other adminapi tasks");
			throw new BuildException(e.toString());
		} catch(Exception e){
			throw new BuildException(e.toString());
		}
		
		
	}
	
}
			

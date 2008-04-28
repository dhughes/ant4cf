
package com.alagad.cfant;

import org.apache.tools.ant.BuildException;

public class cfcheckAdminRoles extends ProxyTask {
	
		private String _requiredRoles = "";
	
		private String _checkAllRoles = "";
	
	
	
	
		public void setrequiredRoles(String _requiredRoles) {
			this._requiredRoles = _requiredRoles;
		}
	
		private String getrequiredRoles() {
			return this._requiredRoles;
		}
	
		public void setcheckAllRoles(String _checkAllRoles) {
			this._checkAllRoles = _checkAllRoles;
		}
	
		private String getcheckAllRoles() {
			return this._checkAllRoles;
		}
	
	
	
		
	public void execute() throws BuildException {
		
			// get the login information from this project
			String adminPassword = getProject().getProperty("adminPassword");
			String adminUserId = getProject().getProperty("adminUserId");
		
		
		// to make the http call we need to know at what URL the admin proxy is.
		String proxyUrl = getProject().getProperty("rootUrl");
		proxyUrl += "/proxy/accessmanagerProxy.cfc";
		proxyUrl += "?method=checkAdminRoles";
		proxyUrl += "&returnformat=plain";
		
			proxyUrl += "&adminPassword=" + adminPassword;
			if(!adminUserId.equals("")){
				proxyUrl += "&adminUserId=" + adminUserId;
			}
		
		
		
			if(!getrequiredRoles().equals("")){
				proxyUrl += "&requiredRoles=" + getrequiredRoles(); 
			} 
		
			if(!getcheckAllRoles().equals("")){
				proxyUrl += "&checkAllRoles=" + getcheckAllRoles(); 
			} 
		
		
		try{
			String result = getFromUrl(proxyUrl);
			
			
			
			// check to see if we need to set a property
		} catch(Exception e){
			throw new BuildException(e.getMessage());
		}
		
		
	}
	
}
			

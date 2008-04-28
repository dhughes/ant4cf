
package com.alagad.cfant;

import org.apache.tools.ant.BuildException;

public class cfsetAlias extends ProxyTask {
	
		private String _aliasSettings = "";
	
	
	
	
		public void setaliasSettings(String _aliasSettings) {
			this._aliasSettings = _aliasSettings;
		}
	
		private String getaliasSettings() {
			return this._aliasSettings;
		}
	
	
	
		
	public void execute() throws BuildException {
		
			// get the login information from this project
			String adminPassword = getProject().getProperty("adminPassword");
			String adminUserId = getProject().getProperty("adminUserId");
		
		
		// to make the http call we need to know at what URL the admin proxy is.
		String proxyUrl = getProject().getProperty("rootUrl");
		proxyUrl += "/proxy/servermonitoringProxy.cfc";
		proxyUrl += "?method=setAlias";
		proxyUrl += "&returnformat=plain";
		
			proxyUrl += "&adminPassword=" + adminPassword;
			if(!adminUserId.equals("")){
				proxyUrl += "&adminUserId=" + adminUserId;
			}
		
		
		
			if(!getaliasSettings().equals("")){
				proxyUrl += "&aliasSettings=" + getaliasSettings(); 
			} 
		
		
		try{
			String result = getFromUrl(proxyUrl);
			
			
			
			// check to see if we need to set a property
		} catch(Exception e){
			throw new BuildException(e.getMessage());
		}
		
		
	}
	
}
			

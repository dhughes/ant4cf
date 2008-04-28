
package com.alagad.cfant;

import org.apache.tools.ant.BuildException;

public class cfdeleteAlias extends ProxyTask {
	
		private String _templatePath = "";
	
	
	
	
		public void settemplatePath(String _templatePath) {
			this._templatePath = _templatePath;
		}
	
		private String gettemplatePath() {
			return this._templatePath;
		}
	
	
	
		
	public void execute() throws BuildException {
		
			// get the login information from this project
			String adminPassword = getProject().getProperty("adminPassword");
			String adminUserId = getProject().getProperty("adminUserId");
		
		
		// to make the http call we need to know at what URL the admin proxy is.
		String proxyUrl = getProject().getProperty("rootUrl");
		proxyUrl += "/proxy/servermonitoringProxy.cfc";
		proxyUrl += "?method=deleteAlias";
		proxyUrl += "&returnformat=plain";
		
			proxyUrl += "&adminPassword=" + adminPassword;
			if(!adminUserId.equals("")){
				proxyUrl += "&adminUserId=" + adminUserId;
			}
		
		
		
			if(!gettemplatePath().equals("")){
				proxyUrl += "&templatePath=" + gettemplatePath(); 
			} 
		
		
		try{
			String result = getFromUrl(proxyUrl);
			
			
			
			// check to see if we need to set a property
		} catch(Exception e){
			throw new BuildException(e.getMessage());
		}
		
		
	}
	
}
			

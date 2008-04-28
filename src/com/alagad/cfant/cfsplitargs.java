
package com.alagad.cfant;

import org.apache.tools.ant.BuildException;

public class cfsplitargs extends ProxyTask {
	
		private String _string = "";
	
	
	
	
		public void setstring(String _string) {
			this._string = _string;
		}
	
		private String getstring() {
			return this._string;
		}
	
	
	
		
	public void execute() throws BuildException {
		
			// get the login information from this project
			String adminPassword = getProject().getProperty("adminPassword");
			String adminUserId = getProject().getProperty("adminUserId");
		
		
		// to make the http call we need to know at what URL the admin proxy is.
		String proxyUrl = getProject().getProperty("rootUrl");
		proxyUrl += "/proxy/runtimeProxy.cfc";
		proxyUrl += "?method=splitargs";
		proxyUrl += "&returnformat=plain";
		
			proxyUrl += "&adminPassword=" + adminPassword;
			if(!adminUserId.equals("")){
				proxyUrl += "&adminUserId=" + adminUserId;
			}
		
		
		
			if(!getstring().equals("")){
				proxyUrl += "&string=" + getstring(); 
			} 
		
		
		try{
			String result = getFromUrl(proxyUrl);
			
			
			
			// check to see if we need to set a property
		} catch(Exception e){
			throw new BuildException(e.getMessage());
		}
		
		
	}
	
}
			

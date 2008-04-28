
package com.alagad.cfant;

import org.apache.tools.ant.BuildException;

public class cfsetUseOrb extends ProxyTask {
	
		private String _useOrb = "";
	
	
		private String _property = "";	
	
	
	
		public void setuseOrb(String _useOrb) {
			this._useOrb = _useOrb;
		}
	
		private String getuseOrb() {
			return this._useOrb;
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
		proxyUrl += "?method=setUseOrb";
		proxyUrl += "&returnformat=plain";
		
			proxyUrl += "&adminPassword=" + adminPassword;
			if(!adminUserId.equals("")){
				proxyUrl += "&adminUserId=" + adminUserId;
			}
		
		
		
			if(!getuseOrb().equals("")){
				proxyUrl += "&useOrb=" + getuseOrb(); 
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
			

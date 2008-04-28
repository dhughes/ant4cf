
package com.alagad.cfant;

import org.apache.tools.ant.BuildException;

public class cfsetLineDebuggerPort extends ProxyTask {
	
		private String _portNumber = "";
	
	
		private String _property = "";	
	
	
	
		public void setportNumber(String _portNumber) {
			this._portNumber = _portNumber;
		}
	
		private String getportNumber() {
			return this._portNumber;
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
		proxyUrl += "/proxy/debuggingProxy.cfc";
		proxyUrl += "?method=setLineDebuggerPort";
		proxyUrl += "&returnformat=plain";
		
			proxyUrl += "&adminPassword=" + adminPassword;
			if(!adminUserId.equals("")){
				proxyUrl += "&adminUserId=" + adminUserId;
			}
		
		
		
			if(!getportNumber().equals("")){
				proxyUrl += "&portNumber=" + getportNumber(); 
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
			

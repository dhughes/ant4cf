
package com.alagad.cfant;

import org.apache.tools.ant.BuildException;

public class cfsl54Del extends ProxyTask {
	
		private String _dsn = "";
	
	
	
	
		public void setdsn(String _dsn) {
			this._dsn = _dsn;
		}
	
		private String getdsn() {
			return this._dsn;
		}
	
	
	
		
	public void execute() throws BuildException {
		
			// get the login information from this project
			String adminPassword = getProject().getProperty("adminPassword");
			String adminUserId = getProject().getProperty("adminUserId");
		
		
		// to make the http call we need to know at what URL the admin proxy is.
		String proxyUrl = getProject().getProperty("rootUrl");
		proxyUrl += "/proxy/datasourceProxy.cfc";
		proxyUrl += "?method=sl54Del";
		proxyUrl += "&returnformat=plain";
		
			proxyUrl += "&adminPassword=" + adminPassword;
			if(!adminUserId.equals("")){
				proxyUrl += "&adminUserId=" + adminUserId;
			}
		
		
		
			if(!getdsn().equals("")){
				proxyUrl += "&dsn=" + getdsn(); 
			} 
		
		
		try{
			String result = getFromUrl(proxyUrl);
			
			
			
			// check to see if we need to set a property
		} catch(Exception e){
			throw new BuildException(e.getMessage());
		}
		
		
	}
	
}
			

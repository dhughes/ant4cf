
package com.alagad.cfant;

import org.apache.tools.ant.BuildException;

public class cfgetActiveCFThreads extends ProxyTask {
	
		private String _requestthreadname = "";
	
	
		private String _property = "";	
	
	
	
		public void setrequestthreadname(String _requestthreadname) {
			this._requestthreadname = _requestthreadname;
		}
	
		private String getrequestthreadname() {
			return this._requestthreadname;
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
		proxyUrl += "/proxy/servermonitoringProxy.cfc";
		proxyUrl += "?method=getActiveCFThreads";
		proxyUrl += "&returnformat=plain";
		
			proxyUrl += "&adminPassword=" + adminPassword;
			if(!adminUserId.equals("")){
				proxyUrl += "&adminUserId=" + adminUserId;
			}
		
		
		
			if(!getrequestthreadname().equals("")){
				proxyUrl += "&requestthreadname=" + getrequestthreadname(); 
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
			

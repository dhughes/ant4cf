
package com.alagad.cfant;

import org.apache.tools.ant.BuildException;

public class cfgetSessionMemoryUsedDetails extends ProxyTask {
	
		private String _cfsessionid = "";
	
	
		private String _property = "";	
	
	
	
		public void setcfsessionid(String _cfsessionid) {
			this._cfsessionid = _cfsessionid;
		}
	
		private String getcfsessionid() {
			return this._cfsessionid;
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
		proxyUrl += "?method=getSessionMemoryUsedDetails";
		proxyUrl += "&returnformat=plain";
		
			proxyUrl += "&adminPassword=" + adminPassword;
			if(!adminUserId.equals("")){
				proxyUrl += "&adminUserId=" + adminUserId;
			}
		
		
		
			if(!getcfsessionid().equals("")){
				proxyUrl += "&cfsessionid=" + getcfsessionid(); 
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
			

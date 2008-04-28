
package com.alagad.cfant;

import org.apache.tools.ant.BuildException;

public class cfdeleteAlert extends ProxyTask {
	
		private String _alertType = "";
	
		private String _alertTime = "";
	
	
		private String _property = "";	
	
	
	
		public void setalertType(String _alertType) {
			this._alertType = _alertType;
		}
	
		private String getalertType() {
			return this._alertType;
		}
	
		public void setalertTime(String _alertTime) {
			this._alertTime = _alertTime;
		}
	
		private String getalertTime() {
			return this._alertTime;
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
		proxyUrl += "?method=deleteAlert";
		proxyUrl += "&returnformat=plain";
		
			proxyUrl += "&adminPassword=" + adminPassword;
			if(!adminUserId.equals("")){
				proxyUrl += "&adminUserId=" + adminUserId;
			}
		
		
		
			if(!getalertType().equals("")){
				proxyUrl += "&alertType=" + getalertType(); 
			} 
		
			if(!getalertTime().equals("")){
				proxyUrl += "&alertTime=" + getalertTime(); 
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
			

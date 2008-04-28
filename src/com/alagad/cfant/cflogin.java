
package com.alagad.cfant;

import org.apache.tools.ant.BuildException;

public class cflogin extends ProxyTask {
	
		private String _adminPassword = "";
	
		private String _adminUserId = "";
	
		private String _salt = "";
	
		private String _rdsPasswordAllowed = "";
	
	
		private String _property = "";	
	
	
	
		public void setadminPassword(String _adminPassword) {
			this._adminPassword = _adminPassword;
		}
	
		private String getadminPassword() {
			return this._adminPassword;
		}
	
		public void setadminUserId(String _adminUserId) {
			this._adminUserId = _adminUserId;
		}
	
		private String getadminUserId() {
			return this._adminUserId;
		}
	
		public void setsalt(String _salt) {
			this._salt = _salt;
		}
	
		private String getsalt() {
			return this._salt;
		}
	
		public void setrdsPasswordAllowed(String _rdsPasswordAllowed) {
			this._rdsPasswordAllowed = _rdsPasswordAllowed;
		}
	
		private String getrdsPasswordAllowed() {
			return this._rdsPasswordAllowed;
		}
	
	
	
		public void setProperty(String _property) {
			this._property = _property;
		}
	
		private String getproperty() {
			return this._property;
		}
	
		
	public void execute() throws BuildException {
		
		
		// to make the http call we need to know at what URL the admin proxy is.
		String proxyUrl = getProject().getProperty("rootUrl");
		proxyUrl += "/proxy/administratorProxy.cfc";
		proxyUrl += "?method=login";
		proxyUrl += "&returnformat=plain";
		
		
		
			if(!getadminPassword().equals("")){
				proxyUrl += "&adminPassword=" + getadminPassword(); 
			} 
		
			if(!getadminUserId().equals("")){
				proxyUrl += "&adminUserId=" + getadminUserId(); 
			} 
		
			if(!getsalt().equals("")){
				proxyUrl += "&salt=" + getsalt(); 
			} 
		
			if(!getrdsPasswordAllowed().equals("")){
				proxyUrl += "&rdsPasswordAllowed=" + getrdsPasswordAllowed(); 
			} 
		
		
		try{
			String result = getFromUrl(proxyUrl);
			
			
				getProject().setProperty(getproperty(), result);
			
			
			// check to see if we need to set a property
		} catch(Exception e){
			throw new BuildException(e.getMessage());
		}
		
		
			// set the login information into the project
			getProject().setProperty("adminPassword", getadminPassword());
			getProject().setProperty("adminUserId", getadminUserId());
		
	}
	
}
			

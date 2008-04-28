
package com.alagad.cfant;

import org.apache.tools.ant.BuildException;

public class cfreloadWebService extends ProxyTask {
	
		private String _name = "";
	
		private String _path = "";
	
		private String _username = "";
	
		private String _password = "";
	
	
		private String _property = "";	
	
	
	
		public void setname(String _name) {
			this._name = _name;
		}
	
		private String getname() {
			return this._name;
		}
	
		public void setpath(String _path) {
			this._path = _path;
		}
	
		private String getpath() {
			return this._path;
		}
	
		public void setusername(String _username) {
			this._username = _username;
		}
	
		private String getusername() {
			return this._username;
		}
	
		public void setpassword(String _password) {
			this._password = _password;
		}
	
		private String getpassword() {
			return this._password;
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
		proxyUrl += "?method=reloadWebService";
		proxyUrl += "&returnformat=plain";
		
			proxyUrl += "&adminPassword=" + adminPassword;
			if(!adminUserId.equals("")){
				proxyUrl += "&adminUserId=" + adminUserId;
			}
		
		
		
			if(!getname().equals("")){
				proxyUrl += "&name=" + getname(); 
			} 
		
			if(!getpath().equals("")){
				proxyUrl += "&path=" + getpath(); 
			} 
		
			if(!getusername().equals("")){
				proxyUrl += "&username=" + getusername(); 
			} 
		
			if(!getpassword().equals("")){
				proxyUrl += "&password=" + getpassword(); 
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
			

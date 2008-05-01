
package com.alagad.cfant;

import org.apache.tools.ant.BuildException;

public class cfsetMailServer extends ProxyTask {
	
		private String _server = "";
	
		private String _port = "";
	
		private String _username = "";
	
		private String _password = "";
	
		private String _priority = "";
	
	
		private String _property = "";	
	
	
	
	
		public void setserver(String _server) {
			this._server = _server;
		}
	
		private String getserver() {
			return this._server;
		}
	
		public void setport(String _port) {
			this._port = _port;
		}
	
		private String getport() {
			return this._port;
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
	
		public void setpriority(String _priority) {
			this._priority = _priority;
		}
	
		private String getpriority() {
			return this._priority;
		}
	
	
	
		public void setProperty(String _property) {
			this._property = _property;
		}
	
		private String getproperty() {
			return this._property;
		}
	
	
	
		
	public void execute() throws BuildException {
		try{
			
				// get the login information from this project
				String adminPassword = getProject().getProperty("adminPassword");
				String adminUserId = getProject().getProperty("adminUserId");
				String rootUrl = getProject().getProperty("rootUrl");
			
			
			// to make the http call we need to know at what URL the admin proxy is.
			String proxyUrl = rootUrl;
			proxyUrl += "/proxy/mailProxy.cfc";
			proxyUrl += "?method=setMailServer";
			proxyUrl += "&returnformat=plain";
			
				proxyUrl += "&adminPassword=" + adminPassword;
				if(!adminUserId.equals("")){
					proxyUrl += "&adminUserId=" + adminUserId;
				}
			
			
			
				if(!getserver().equals("")){
					proxyUrl += "&server=" + getserver(); 
				} 
			
				if(!getport().equals("")){
					proxyUrl += "&port=" + getport(); 
				} 
			
				if(!getusername().equals("")){
					proxyUrl += "&username=" + getusername(); 
				} 
			
				if(!getpassword().equals("")){
					proxyUrl += "&password=" + getpassword(); 
				} 
			
				if(!getpriority().equals("")){
					proxyUrl += "&priority=" + getpriority(); 
				} 
			
		
			String result = getFromUrl(proxyUrl);
			
			
				getProject().setProperty(getproperty(), result);
			
					
		} catch(NullPointerException e) { 
			System.out.println("You must use the cflogin task before any other other adminapi tasks");
			throw new BuildException(e.toString());
		} catch(Exception e){
			throw new BuildException(e.toString());
		}
		
		
	}
	
}
			

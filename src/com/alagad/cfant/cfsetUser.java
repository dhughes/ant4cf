
package com.alagad.cfant;

import org.apache.tools.ant.BuildException;

public class cfsetUser extends ProxyTask {
	
		private String _username = "";
	
		private String _password = "";
	
		private String _description = "";
	
		private String _sandboxes = "";
	
		private String _roles = "";
	
		private String _allowrdsaccess = "";
	
		private String _allowadminaccess = "";
	
		private String _allowadminapiaccess = "";
	
	
		private String _property = "";	
	
	
	
	
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
	
		public void setdescription(String _description) {
			this._description = _description;
		}
	
		private String getdescription() {
			return this._description;
		}
	
		public void setsandboxes(String _sandboxes) {
			this._sandboxes = _sandboxes;
		}
	
		private String getsandboxes() {
			return this._sandboxes;
		}
	
		public void setroles(String _roles) {
			this._roles = _roles;
		}
	
		private String getroles() {
			return this._roles;
		}
	
		public void setallowrdsaccess(String _allowrdsaccess) {
			this._allowrdsaccess = _allowrdsaccess;
		}
	
		private String getallowrdsaccess() {
			return this._allowrdsaccess;
		}
	
		public void setallowadminaccess(String _allowadminaccess) {
			this._allowadminaccess = _allowadminaccess;
		}
	
		private String getallowadminaccess() {
			return this._allowadminaccess;
		}
	
		public void setallowadminapiaccess(String _allowadminapiaccess) {
			this._allowadminapiaccess = _allowadminapiaccess;
		}
	
		private String getallowadminapiaccess() {
			return this._allowadminapiaccess;
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
				
				System.out.println(rootUrl);
			
			
			// to make the http call we need to know at what URL the admin proxy is.
			String proxyUrl = rootUrl;
			proxyUrl += "/proxy/securityProxy.cfc";
			proxyUrl += "?method=setUser";
			proxyUrl += "&returnformat=plain";
			
				proxyUrl += "&adminPassword=" + adminPassword;
				if(!adminUserId.equals("")){
					proxyUrl += "&adminUserId=" + adminUserId;
				}
			
			
			
				if(!getusername().equals("")){
					proxyUrl += "&username=" + getusername(); 
				} 
			
				if(!getpassword().equals("")){
					proxyUrl += "&password=" + getpassword(); 
				} 
			
				if(!getdescription().equals("")){
					proxyUrl += "&description=" + getdescription(); 
				} 
			
				if(!getsandboxes().equals("")){
					proxyUrl += "&sandboxes=" + getsandboxes(); 
				} 
			
				if(!getroles().equals("")){
					proxyUrl += "&roles=" + getroles(); 
				} 
			
				if(!getallowrdsaccess().equals("")){
					proxyUrl += "&allowrdsaccess=" + getallowrdsaccess(); 
				} 
			
				if(!getallowadminaccess().equals("")){
					proxyUrl += "&allowadminaccess=" + getallowadminaccess(); 
				} 
			
				if(!getallowadminapiaccess().equals("")){
					proxyUrl += "&allowadminapiaccess=" + getallowadminapiaccess(); 
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
			

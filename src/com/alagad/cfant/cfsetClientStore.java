
package com.alagad.cfant;

import org.apache.tools.ant.BuildException;

public class cfsetClientStore extends ProxyTask {
	
		private String _description = "";
	
		private String _disable_globals = "";
	
		private String _name = "";
	
		private String _purge = "";
	
		private String _timeout = "";
	
		private String _type = "";
	
		private String _dsn = "";
	
	
	
	
	
		public void setdescription(String _description) {
			this._description = _description;
		}
	
		private String getdescription() {
			return this._description;
		}
	
		public void setdisable_globals(String _disable_globals) {
			this._disable_globals = _disable_globals;
		}
	
		private String getdisable_globals() {
			return this._disable_globals;
		}
	
		public void setname(String _name) {
			this._name = _name;
		}
	
		private String getname() {
			return this._name;
		}
	
		public void setpurge(String _purge) {
			this._purge = _purge;
		}
	
		private String getpurge() {
			return this._purge;
		}
	
		public void settimeout(String _timeout) {
			this._timeout = _timeout;
		}
	
		private String gettimeout() {
			return this._timeout;
		}
	
		public void settype(String _type) {
			this._type = _type;
		}
	
		private String gettype() {
			return this._type;
		}
	
		public void setdsn(String _dsn) {
			this._dsn = _dsn;
		}
	
		private String getdsn() {
			return this._dsn;
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
			proxyUrl += "/proxy/runtimeProxy.cfc";
			proxyUrl += "?method=setClientStore";
			proxyUrl += "&returnformat=plain";
			
				proxyUrl += "&adminPassword=" + adminPassword;
				if(!adminUserId.equals("")){
					proxyUrl += "&adminUserId=" + adminUserId;
				}
			
			
			
				if(!getdescription().equals("")){
					proxyUrl += "&description=" + getdescription(); 
				} 
			
				if(!getdisable_globals().equals("")){
					proxyUrl += "&disable_globals=" + getdisable_globals(); 
				} 
			
				if(!getname().equals("")){
					proxyUrl += "&name=" + getname(); 
				} 
			
				if(!getpurge().equals("")){
					proxyUrl += "&purge=" + getpurge(); 
				} 
			
				if(!gettimeout().equals("")){
					proxyUrl += "&timeout=" + gettimeout(); 
				} 
			
				if(!gettype().equals("")){
					proxyUrl += "&type=" + gettype(); 
				} 
			
				if(!getdsn().equals("")){
					proxyUrl += "&dsn=" + getdsn(); 
				} 
			
		
			String result = getFromUrl(proxyUrl);
			
			
					
		} catch(NullPointerException e) { 
			System.out.println("You must use the cflogin task before any other other adminapi tasks");
			throw new BuildException(e.toString());
		} catch(Exception e){
			throw new BuildException(e.toString());
		}
		
		
	}
	
}
			

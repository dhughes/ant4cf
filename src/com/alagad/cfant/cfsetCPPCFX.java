
package com.alagad.cfant;

import org.apache.tools.ant.BuildException;

public class cfsetCPPCFX extends ProxyTask {
	
		private String _name = "";
	
		private String _library = "";
	
		private String _description = "";
	
		private String _cache = "";
	
		private String _procedure = "";
	
	
		private String _property = "";	
	
	
	
		public void setname(String _name) {
			this._name = _name;
		}
	
		private String getname() {
			return this._name;
		}
	
		public void setlibrary(String _library) {
			this._library = _library;
		}
	
		private String getlibrary() {
			return this._library;
		}
	
		public void setdescription(String _description) {
			this._description = _description;
		}
	
		private String getdescription() {
			return this._description;
		}
	
		public void setcache(String _cache) {
			this._cache = _cache;
		}
	
		private String getcache() {
			return this._cache;
		}
	
		public void setprocedure(String _procedure) {
			this._procedure = _procedure;
		}
	
		private String getprocedure() {
			return this._procedure;
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
			
			
			// to make the http call we need to know at what URL the admin proxy is.
			String proxyUrl = getProject().getProperty("rootUrl");
			proxyUrl += "/proxy/extensionsProxy.cfc";
			proxyUrl += "?method=setCPPCFX";
			proxyUrl += "&returnformat=plain";
			
				proxyUrl += "&adminPassword=" + adminPassword;
				if(!adminUserId.equals("")){
					proxyUrl += "&adminUserId=" + adminUserId;
				}
			
			
			
				if(!getname().equals("")){
					proxyUrl += "&name=" + getname(); 
				} 
			
				if(!getlibrary().equals("")){
					proxyUrl += "&library=" + getlibrary(); 
				} 
			
				if(!getdescription().equals("")){
					proxyUrl += "&description=" + getdescription(); 
				} 
			
				if(!getcache().equals("")){
					proxyUrl += "&cache=" + getcache(); 
				} 
			
				if(!getprocedure().equals("")){
					proxyUrl += "&procedure=" + getprocedure(); 
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
			

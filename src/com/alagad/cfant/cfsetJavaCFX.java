
package com.alagad.cfant;

import org.apache.tools.ant.BuildException;

public class cfsetJavaCFX extends ProxyTask {
	
		private String _name = "";
	
		private String _classname = "";
	
		private String _description = "";
	
	
		private String _property = "";	
	
	
	
	
		public void setname(String _name) {
			this._name = _name;
		}
	
		private String getname() {
			return this._name;
		}
	
		public void setclassname(String _classname) {
			this._classname = _classname;
		}
	
		private String getclassname() {
			return this._classname;
		}
	
		public void setdescription(String _description) {
			this._description = _description;
		}
	
		private String getdescription() {
			return this._description;
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
				String debug = getProject().getProperty("debug");
			
			
			// to make the http call we need to know at what URL the admin proxy is.
			String proxyUrl = rootUrl;
			proxyUrl += "/proxy/extensionsProxy.cfc";
			proxyUrl += "?method=setJavaCFX";
			proxyUrl += "&returnformat=plain";
			
				proxyUrl += "&adminPassword=" + adminPassword;
				if(!adminUserId.equals("")){
					proxyUrl += "&adminUserId=" + adminUserId;
				}
			
			
			
				if(!getname().equals("")){
					proxyUrl += "&name=" + getname(); 
				}
			
				if(!getclassname().equals("")){
					proxyUrl += "&classname=" + getclassname(); 
				}
			
				if(!getdescription().equals("")){
					proxyUrl += "&description=" + getdescription(); 
				}
			
			
			if(Boolean.parseBoolean(debug)){
				System.out.println("Running Task 'setJavaCFX' via url: " + proxyUrl);
			}
			
			String result = getFromUrl(proxyUrl);
			
			System.out.println("Result:"  + result);
			
			
			
			
				getProject().setProperty(getproperty(), result);
			
					
		} catch(NullPointerException e) { 
			System.out.println("You must use the cflogin task before any other other adminapi tasks");
			throw new BuildException(e.toString());
		} catch(Exception e){
			throw new BuildException(e.toString());
		}
		
		
	}
	
}
			


package com.alagad.cfant;

import org.apache.tools.ant.BuildException;

public class cfgetFunctionPermissionPosition extends ProxyTask {
	
		private String _webapp = "";
	
		private String _directory = "";
	
	
		private String _property = "";	
	
	
	
	
		public void setwebapp(String _webapp) {
			this._webapp = _webapp;
		}
	
		private String getwebapp() {
			return this._webapp;
		}
	
		public void setdirectory(String _directory) {
			this._directory = _directory;
		}
	
		private String getdirectory() {
			return this._directory;
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
			proxyUrl += "/proxy/securityProxy.cfc";
			proxyUrl += "?method=getFunctionPermissionPosition";
			proxyUrl += "&returnformat=plain";
			
				proxyUrl += "&adminPassword=" + adminPassword;
				if(!adminUserId.equals("")){
					proxyUrl += "&adminUserId=" + adminUserId;
				}
			
			
			
				if(!getwebapp().equals("")){
					proxyUrl += "&webapp=" + getwebapp(); 
				}
			
				if(!getdirectory().equals("")){
					proxyUrl += "&directory=" + getdirectory(); 
				}
			
			
			if(Boolean.parseBoolean(debug)){
				System.out.println("Running Task 'getFunctionPermissionPosition' via url: " + proxyUrl);
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
			

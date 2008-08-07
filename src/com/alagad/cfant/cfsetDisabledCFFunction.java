
package com.alagad.cfant;

import org.apache.tools.ant.BuildException;

public class cfsetDisabledCFFunction extends ProxyTask {
	
		private String _directory = "";
	
		private String _functionName = "";
	
	
		private String _property = "";	
	
	
	
	
		public void setdirectory(String _directory) {
			this._directory = _directory;
		}
	
		private String getdirectory() {
			return this._directory;
		}
	
		public void setfunctionName(String _functionName) {
			this._functionName = _functionName;
		}
	
		private String getfunctionName() {
			return this._functionName;
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
			proxyUrl += "?method=setDisabledCFFunction";
			proxyUrl += "&returnformat=plain";
			
				proxyUrl += "&adminPassword=" + adminPassword;
				if(!adminUserId.equals("")){
					proxyUrl += "&adminUserId=" + adminUserId;
				}
			
			
			
				if(!getdirectory().equals("")){
					proxyUrl += "&directory=" + getdirectory(); 
				}
			
				if(!getfunctionName().equals("")){
					proxyUrl += "&functionName=" + getfunctionName(); 
				}
			
			
			if(Boolean.parseBoolean(debug)){
				System.out.println("Running Task 'setDisabledCFFunction' via url: " + proxyUrl);
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
			


package com.alagad.cfant;

import org.apache.tools.ant.BuildException;

public class cfgetAlertSettings extends ProxyTask {
	
		private String _alertType = "";
	
	
		private String _property = "";	
	
	
	
	
		public void setalertType(String _alertType) {
			this._alertType = _alertType;
		}
	
		private String getalertType() {
			return this._alertType;
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
			proxyUrl += "/proxy/servermonitoringProxy.cfc";
			proxyUrl += "?method=getAlertSettings";
			proxyUrl += "&returnformat=plain";
			
				proxyUrl += "&adminPassword=" + adminPassword;
				if(!adminUserId.equals("")){
					proxyUrl += "&adminUserId=" + adminUserId;
				}
			
			
			
				if(!getalertType().equals("")){
					proxyUrl += "&alertType=" + getalertType(); 
				}
			
			
			if(Boolean.parseBoolean(debug)){
				System.out.println("Running Task 'getAlertSettings' via url: " + proxyUrl);
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
			

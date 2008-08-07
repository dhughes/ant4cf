
package com.alagad.cfant;

import org.apache.tools.ant.BuildException;

public class cfgetAlertStatus extends ProxyTask {
	
		private String _getActiveAlerts = "";
	
	
		private String _property = "";	
	
	
	
	
		public void setgetActiveAlerts(String _getActiveAlerts) {
			this._getActiveAlerts = _getActiveAlerts;
		}
	
		private String getgetActiveAlerts() {
			return this._getActiveAlerts;
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
			proxyUrl += "?method=getAlertStatus";
			proxyUrl += "&returnformat=plain";
			
				proxyUrl += "&adminPassword=" + adminPassword;
				if(!adminUserId.equals("")){
					proxyUrl += "&adminUserId=" + adminUserId;
				}
			
			
			
				if(!getgetActiveAlerts().equals("")){
					proxyUrl += "&getActiveAlerts=" + getgetActiveAlerts(); 
				}
			
			
			if(Boolean.parseBoolean(debug)){
				System.out.println("Running Task 'getAlertStatus' via url: " + proxyUrl);
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
			

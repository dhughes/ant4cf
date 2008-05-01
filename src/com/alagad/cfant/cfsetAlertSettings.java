
package com.alagad.cfant;

import org.apache.tools.ant.BuildException;

public class cfsetAlertSettings extends ProxyTask {
	
		private String _alertType = "";
	
		private String _alertSettings = "";
	
	
	
	
	
		public void setalertType(String _alertType) {
			this._alertType = _alertType;
		}
	
		private String getalertType() {
			return this._alertType;
		}
	
		public void setalertSettings(String _alertSettings) {
			this._alertSettings = _alertSettings;
		}
	
		private String getalertSettings() {
			return this._alertSettings;
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
			proxyUrl += "/proxy/servermonitoringProxy.cfc";
			proxyUrl += "?method=setAlertSettings";
			proxyUrl += "&returnformat=plain";
			
				proxyUrl += "&adminPassword=" + adminPassword;
				if(!adminUserId.equals("")){
					proxyUrl += "&adminUserId=" + adminUserId;
				}
			
			
			
				if(!getalertType().equals("")){
					proxyUrl += "&alertType=" + getalertType(); 
				} 
			
				if(!getalertSettings().equals("")){
					proxyUrl += "&alertSettings=" + getalertSettings(); 
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
			


package com.alagad.cfant;

import org.apache.tools.ant.BuildException;

public class cfsetMonitorSettings extends ProxyTask {
	
		private String _settings = "";
	
	
	
	
		public void setsettings(String _settings) {
			this._settings = _settings;
		}
	
		private String getsettings() {
			return this._settings;
		}
	
	
	
		
	public void execute() throws BuildException {
		try{
			
				// get the login information from this project
				String adminPassword = getProject().getProperty("adminPassword");
				String adminUserId = getProject().getProperty("adminUserId");
			
			
			// to make the http call we need to know at what URL the admin proxy is.
			String proxyUrl = getProject().getProperty("rootUrl");
			proxyUrl += "/proxy/servermonitoringProxy.cfc";
			proxyUrl += "?method=setMonitorSettings";
			proxyUrl += "&returnformat=plain";
			
				proxyUrl += "&adminPassword=" + adminPassword;
				if(!adminUserId.equals("")){
					proxyUrl += "&adminUserId=" + adminUserId;
				}
			
			
			
				if(!getsettings().equals("")){
					proxyUrl += "&settings=" + getsettings(); 
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
			

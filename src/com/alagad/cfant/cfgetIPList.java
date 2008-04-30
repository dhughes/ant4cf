
package com.alagad.cfant;

import org.apache.tools.ant.BuildException;

public class cfgetIPList extends ProxyTask {
	
		private String _adminPassword = "";
	
		private String _adminPassword2 = "";
	
	
		private String _property = "";	
	
	
	
		public void setadminPassword(String _adminPassword) {
			this._adminPassword = _adminPassword;
		}
	
		private String getadminPassword() {
			return this._adminPassword;
		}
	
		public void setadminPassword2(String _adminPassword2) {
			this._adminPassword2 = _adminPassword2;
		}
	
		private String getadminPassword2() {
			return this._adminPassword2;
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
			proxyUrl += "/proxy/debuggingProxy.cfc";
			proxyUrl += "?method=getIPList";
			proxyUrl += "&returnformat=plain";
			
				proxyUrl += "&adminPassword=" + adminPassword;
				if(!adminUserId.equals("")){
					proxyUrl += "&adminUserId=" + adminUserId;
				}
			
			
			
				if(!getadminPassword().equals("")){
					proxyUrl += "&adminPassword=" + getadminPassword(); 
				} 
			
				if(!getadminPassword2().equals("")){
					proxyUrl += "&adminPassword2=" + getadminPassword2(); 
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
			

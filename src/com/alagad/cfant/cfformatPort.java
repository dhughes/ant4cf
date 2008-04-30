
package com.alagad.cfant;

import org.apache.tools.ant.BuildException;

public class cfformatPort extends ProxyTask {
	
		private String _port = "";
	
		private String _portType = "";
	
	
	
	
		public void setport(String _port) {
			this._port = _port;
		}
	
		private String getport() {
			return this._port;
		}
	
		public void setportType(String _portType) {
			this._portType = _portType;
		}
	
		private String getportType() {
			return this._portType;
		}
	
	
	
		
	public void execute() throws BuildException {
		try{
			
				// get the login information from this project
				String adminPassword = getProject().getProperty("adminPassword");
				String adminUserId = getProject().getProperty("adminUserId");
			
			
			// to make the http call we need to know at what URL the admin proxy is.
			String proxyUrl = getProject().getProperty("rootUrl");
			proxyUrl += "/proxy/securityProxy.cfc";
			proxyUrl += "?method=formatPort";
			proxyUrl += "&returnformat=plain";
			
				proxyUrl += "&adminPassword=" + adminPassword;
				if(!adminUserId.equals("")){
					proxyUrl += "&adminUserId=" + adminUserId;
				}
			
			
			
				if(!getport().equals("")){
					proxyUrl += "&port=" + getport(); 
				} 
			
				if(!getportType().equals("")){
					proxyUrl += "&portType=" + getportType(); 
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
			

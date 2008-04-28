
package com.alagad.cfant;

import org.apache.tools.ant.BuildException;

public class cfsetSecuredIPPort extends ProxyTask {
	
		private String _directory = "";
	
		private String _IP = "";
	
		private String _PORT = "";
	
		private String _portType = "";
	
	
	
	
		public void setdirectory(String _directory) {
			this._directory = _directory;
		}
	
		private String getdirectory() {
			return this._directory;
		}
	
		public void setIP(String _IP) {
			this._IP = _IP;
		}
	
		private String getIP() {
			return this._IP;
		}
	
		public void setPORT(String _PORT) {
			this._PORT = _PORT;
		}
	
		private String getPORT() {
			return this._PORT;
		}
	
		public void setportType(String _portType) {
			this._portType = _portType;
		}
	
		private String getportType() {
			return this._portType;
		}
	
	
	
		
	public void execute() throws BuildException {
		
			// get the login information from this project
			String adminPassword = getProject().getProperty("adminPassword");
			String adminUserId = getProject().getProperty("adminUserId");
		
		
		// to make the http call we need to know at what URL the admin proxy is.
		String proxyUrl = getProject().getProperty("rootUrl");
		proxyUrl += "/proxy/securityProxy.cfc";
		proxyUrl += "?method=setSecuredIPPort";
		proxyUrl += "&returnformat=plain";
		
			proxyUrl += "&adminPassword=" + adminPassword;
			if(!adminUserId.equals("")){
				proxyUrl += "&adminUserId=" + adminUserId;
			}
		
		
		
			if(!getdirectory().equals("")){
				proxyUrl += "&directory=" + getdirectory(); 
			} 
		
			if(!getIP().equals("")){
				proxyUrl += "&IP=" + getIP(); 
			} 
		
			if(!getPORT().equals("")){
				proxyUrl += "&PORT=" + getPORT(); 
			} 
		
			if(!getportType().equals("")){
				proxyUrl += "&portType=" + getportType(); 
			} 
		
		
		try{
			String result = getFromUrl(proxyUrl);
			
			
			
			// check to see if we need to set a property
		} catch(Exception e){
			throw new BuildException(e.getMessage());
		}
		
		
	}
	
}
			
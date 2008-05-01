
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
		try{
			
				// get the login information from this project
				String adminPassword = getProject().getProperty("adminPassword");
				String adminUserId = getProject().getProperty("adminUserId");
				String rootUrl = getProject().getProperty("rootUrl");
			
			
			// to make the http call we need to know at what URL the admin proxy is.
			String proxyUrl = rootUrl;
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
			
		
			String result = getFromUrl(proxyUrl);
			
			
					
		} catch(NullPointerException e) { 
			System.out.println("You must use the cflogin task before any other other adminapi tasks");
			throw new BuildException(e.toString());
		} catch(Exception e){
			throw new BuildException(e.toString());
		}
		
		
	}
	
}
			


package com.alagad.cfant;

import org.apache.tools.ant.BuildException;

public class cfdeleteDisabledCFTag extends ProxyTask {
	
		private String _directory = "";
	
		private String _tag = "";
	
	
		private String _property = "";	
	
	
	
		public void setdirectory(String _directory) {
			this._directory = _directory;
		}
	
		private String getdirectory() {
			return this._directory;
		}
	
		public void settag(String _tag) {
			this._tag = _tag;
		}
	
		private String gettag() {
			return this._tag;
		}
	
	
	
		public void setProperty(String _property) {
			this._property = _property;
		}
	
		private String getproperty() {
			return this._property;
		}
	
		
	public void execute() throws BuildException {
		
			// get the login information from this project
			String adminPassword = getProject().getProperty("adminPassword");
			String adminUserId = getProject().getProperty("adminUserId");
		
		
		// to make the http call we need to know at what URL the admin proxy is.
		String proxyUrl = getProject().getProperty("rootUrl");
		proxyUrl += "/proxy/securityProxy.cfc";
		proxyUrl += "?method=deleteDisabledCFTag";
		proxyUrl += "&returnformat=plain";
		
			proxyUrl += "&adminPassword=" + adminPassword;
			if(!adminUserId.equals("")){
				proxyUrl += "&adminUserId=" + adminUserId;
			}
		
		
		
			if(!getdirectory().equals("")){
				proxyUrl += "&directory=" + getdirectory(); 
			} 
		
			if(!gettag().equals("")){
				proxyUrl += "&tag=" + gettag(); 
			} 
		
		
		try{
			String result = getFromUrl(proxyUrl);
			
			
				getProject().setProperty(getproperty(), result);
			
			
			// check to see if we need to set a property
		} catch(Exception e){
			throw new BuildException(e.getMessage());
		}
		
		
	}
	
}
			

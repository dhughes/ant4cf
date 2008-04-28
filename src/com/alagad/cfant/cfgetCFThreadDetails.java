
package com.alagad.cfant;

import org.apache.tools.ant.BuildException;

public class cfgetCFThreadDetails extends ProxyTask {
	
		private String _templatePath = "";
	
		private String _lineNo = "";
	
	
		private String _property = "";	
	
	
	
		public void settemplatePath(String _templatePath) {
			this._templatePath = _templatePath;
		}
	
		private String gettemplatePath() {
			return this._templatePath;
		}
	
		public void setlineNo(String _lineNo) {
			this._lineNo = _lineNo;
		}
	
		private String getlineNo() {
			return this._lineNo;
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
		proxyUrl += "/proxy/servermonitoringProxy.cfc";
		proxyUrl += "?method=getCFThreadDetails";
		proxyUrl += "&returnformat=plain";
		
			proxyUrl += "&adminPassword=" + adminPassword;
			if(!adminUserId.equals("")){
				proxyUrl += "&adminUserId=" + adminUserId;
			}
		
		
		
			if(!gettemplatePath().equals("")){
				proxyUrl += "&templatePath=" + gettemplatePath(); 
			} 
		
			if(!getlineNo().equals("")){
				proxyUrl += "&lineNo=" + getlineNo(); 
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
			

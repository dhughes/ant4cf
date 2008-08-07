
package com.alagad.cfant;

import org.apache.tools.ant.BuildException;

public class cfgetQueryDetails extends ProxyTask {
	
		private String _templatePath = "";
	
		private String _functionName = "";
	
		private String _lineNo = "";
	
	
		private String _property = "";	
	
	
	
	
		public void settemplatePath(String _templatePath) {
			this._templatePath = _templatePath;
		}
	
		private String gettemplatePath() {
			return this._templatePath;
		}
	
		public void setfunctionName(String _functionName) {
			this._functionName = _functionName;
		}
	
		private String getfunctionName() {
			return this._functionName;
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
		try{
			
				// get the login information from this project
				String adminPassword = getProject().getProperty("adminPassword");
				String adminUserId = getProject().getProperty("adminUserId");
				String rootUrl = getProject().getProperty("rootUrl");
				String debug = getProject().getProperty("debug");
			
			
			// to make the http call we need to know at what URL the admin proxy is.
			String proxyUrl = rootUrl;
			proxyUrl += "/proxy/servermonitoringProxy.cfc";
			proxyUrl += "?method=getQueryDetails";
			proxyUrl += "&returnformat=plain";
			
				proxyUrl += "&adminPassword=" + adminPassword;
				if(!adminUserId.equals("")){
					proxyUrl += "&adminUserId=" + adminUserId;
				}
			
			
			
				if(!gettemplatePath().equals("")){
					proxyUrl += "&templatePath=" + gettemplatePath(); 
				}
			
				if(!getfunctionName().equals("")){
					proxyUrl += "&functionName=" + getfunctionName(); 
				}
			
				if(!getlineNo().equals("")){
					proxyUrl += "&lineNo=" + getlineNo(); 
				}
			
			
			if(Boolean.parseBoolean(debug)){
				System.out.println("Running Task 'getQueryDetails' via url: " + proxyUrl);
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
			

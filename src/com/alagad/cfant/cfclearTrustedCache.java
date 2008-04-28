
package com.alagad.cfant;

import org.apache.tools.ant.BuildException;

public class cfclearTrustedCache extends ProxyTask {
	
		private String _templateList = "";
	
	
		private String _property = "";	
	
	
	
		public void settemplateList(String _templateList) {
			this._templateList = _templateList;
		}
	
		private String gettemplateList() {
			return this._templateList;
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
		proxyUrl += "/proxy/runtimeProxy.cfc";
		proxyUrl += "?method=clearTrustedCache";
		proxyUrl += "&returnformat=plain";
		
			proxyUrl += "&adminPassword=" + adminPassword;
			if(!adminUserId.equals("")){
				proxyUrl += "&adminUserId=" + adminUserId;
			}
		
		
		
			if(!gettemplateList().equals("")){
				proxyUrl += "&templateList=" + gettemplateList(); 
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
			
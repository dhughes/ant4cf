
package com.alagad.cfant;

import org.apache.tools.ant.BuildException;

public class cfexecuteClassPath extends ProxyTask {
	
		private String _name = "";
	
	
	
	
		public void setname(String _name) {
			this._name = _name;
		}
	
		private String getname() {
			return this._name;
		}
	
	
	
		
	public void execute() throws BuildException {
		
			// get the login information from this project
			String adminPassword = getProject().getProperty("adminPassword");
			String adminUserId = getProject().getProperty("adminUserId");
		
		
		// to make the http call we need to know at what URL the admin proxy is.
		String proxyUrl = getProject().getProperty("rootUrl");
		proxyUrl += "/proxy/runtimeProxy.cfc";
		proxyUrl += "?method=executeClassPath";
		proxyUrl += "&returnformat=plain";
		
			proxyUrl += "&adminPassword=" + adminPassword;
			if(!adminUserId.equals("")){
				proxyUrl += "&adminUserId=" + adminUserId;
			}
		
		
		
			if(!getname().equals("")){
				proxyUrl += "&name=" + getname(); 
			} 
		
		
		try{
			String result = getFromUrl(proxyUrl);
			
			
			
			// check to see if we need to set a property
		} catch(Exception e){
			throw new BuildException(e.getMessage());
		}
		
		
	}
	
}
			

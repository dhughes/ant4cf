
package com.alagad.cfant;

import org.apache.tools.ant.BuildException;

public class cfgetPath extends ProxyTask {
	
		private String _path = "";
	
		private String _type = "";
	
	
		private String _property = "";	
	
	
	
		public void setpath(String _path) {
			this._path = _path;
		}
	
		private String getpath() {
			return this._path;
		}
	
		public void settype(String _type) {
			this._type = _type;
		}
	
		private String gettype() {
			return this._type;
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
		proxyUrl += "?method=getPath";
		proxyUrl += "&returnformat=plain";
		
			proxyUrl += "&adminPassword=" + adminPassword;
			if(!adminUserId.equals("")){
				proxyUrl += "&adminUserId=" + adminUserId;
			}
		
		
		
			if(!getpath().equals("")){
				proxyUrl += "&path=" + getpath(); 
			} 
		
			if(!gettype().equals("")){
				proxyUrl += "&type=" + gettype(); 
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
			

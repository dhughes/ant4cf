
package com.alagad.cfant;

import org.apache.tools.ant.BuildException;

public class cfsetRuntimeProperty extends ProxyTask {
	
		private String _propertyName = "";
	
		private String _propertyValue = "";
	
	
		private String _property = "";	
	
	
	
		public void setpropertyName(String _propertyName) {
			this._propertyName = _propertyName;
		}
	
		private String getpropertyName() {
			return this._propertyName;
		}
	
		public void setpropertyValue(String _propertyValue) {
			this._propertyValue = _propertyValue;
		}
	
		private String getpropertyValue() {
			return this._propertyValue;
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
		proxyUrl += "?method=setRuntimeProperty";
		proxyUrl += "&returnformat=plain";
		
			proxyUrl += "&adminPassword=" + adminPassword;
			if(!adminUserId.equals("")){
				proxyUrl += "&adminUserId=" + adminUserId;
			}
		
		
		
			if(!getpropertyName().equals("")){
				proxyUrl += "&propertyName=" + getpropertyName(); 
			} 
		
			if(!getpropertyValue().equals("")){
				proxyUrl += "&propertyValue=" + getpropertyValue(); 
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
			

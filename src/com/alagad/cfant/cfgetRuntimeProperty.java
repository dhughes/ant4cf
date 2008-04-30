
package com.alagad.cfant;

import org.apache.tools.ant.BuildException;

public class cfgetRuntimeProperty extends ProxyTask {
	
		private String _propertyName = "";
	
	
		private String _property = "";	
	
	
	
		public void setpropertyName(String _propertyName) {
			this._propertyName = _propertyName;
		}
	
		private String getpropertyName() {
			return this._propertyName;
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
			
			
			// to make the http call we need to know at what URL the admin proxy is.
			String proxyUrl = getProject().getProperty("rootUrl");
			proxyUrl += "/proxy/runtimeProxy.cfc";
			proxyUrl += "?method=getRuntimeProperty";
			proxyUrl += "&returnformat=plain";
			
				proxyUrl += "&adminPassword=" + adminPassword;
				if(!adminUserId.equals("")){
					proxyUrl += "&adminUserId=" + adminUserId;
				}
			
			
			
				if(!getpropertyName().equals("")){
					proxyUrl += "&propertyName=" + getpropertyName(); 
				} 
			
		
			String result = getFromUrl(proxyUrl);
			
			
				getProject().setProperty(getproperty(), result);
			
					
		} catch(NullPointerException e) { 
			System.out.println("You must use the cflogin task before any other other adminapi tasks");
			throw new BuildException(e.toString());
		} catch(Exception e){
			throw new BuildException(e.toString());
		}
		
		
	}
	
}
			

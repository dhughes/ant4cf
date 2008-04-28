
package com.alagad.cfant;

import org.apache.tools.ant.BuildException;

public class cfResetGatewayEvents extends ProxyTask {
	
		private String _gatewayID = "";
	
		private String _propertyName = "";
	
	
		private String _property = "";	
	
	
	
		public void setgatewayID(String _gatewayID) {
			this._gatewayID = _gatewayID;
		}
	
		private String getgatewayID() {
			return this._gatewayID;
		}
	
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
		
			// get the login information from this project
			String adminPassword = getProject().getProperty("adminPassword");
			String adminUserId = getProject().getProperty("adminUserId");
		
		
		// to make the http call we need to know at what URL the admin proxy is.
		String proxyUrl = getProject().getProperty("rootUrl");
		proxyUrl += "/proxy/eventgatewayProxy.cfc";
		proxyUrl += "?method=ResetGatewayEvents";
		proxyUrl += "&returnformat=plain";
		
			proxyUrl += "&adminPassword=" + adminPassword;
			if(!adminUserId.equals("")){
				proxyUrl += "&adminUserId=" + adminUserId;
			}
		
		
		
			if(!getgatewayID().equals("")){
				proxyUrl += "&gatewayID=" + getgatewayID(); 
			} 
		
			if(!getpropertyName().equals("")){
				proxyUrl += "&propertyName=" + getpropertyName(); 
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
			
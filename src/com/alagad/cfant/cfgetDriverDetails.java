
package com.alagad.cfant;

import org.apache.tools.ant.BuildException;

public class cfgetDriverDetails extends ProxyTask {
	
		private String _driverName = "";
	
	
		private String _property = "";	
	
	
	
		public void setdriverName(String _driverName) {
			this._driverName = _driverName;
		}
	
		private String getdriverName() {
			return this._driverName;
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
		proxyUrl += "/proxy/datasourceProxy.cfc";
		proxyUrl += "?method=getDriverDetails";
		proxyUrl += "&returnformat=plain";
		
			proxyUrl += "&adminPassword=" + adminPassword;
			if(!adminUserId.equals("")){
				proxyUrl += "&adminUserId=" + adminUserId;
			}
		
		
		
			if(!getdriverName().equals("")){
				proxyUrl += "&driverName=" + getdriverName(); 
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
			

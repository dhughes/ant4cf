
package com.alagad.cfant;

import org.apache.tools.ant.BuildException;

public class cfsetGatewayInstance extends ProxyTask {
	
		private String _gatewayid = "";
	
		private String _type = "";
	
		private String _cfcPaths = "";
	
		private String _configurationpath = "";
	
		private String _mode = "";
	
	
		private String _property = "";	
	
	
	
		public void setgatewayid(String _gatewayid) {
			this._gatewayid = _gatewayid;
		}
	
		private String getgatewayid() {
			return this._gatewayid;
		}
	
		public void settype(String _type) {
			this._type = _type;
		}
	
		private String gettype() {
			return this._type;
		}
	
		public void setcfcPaths(String _cfcPaths) {
			this._cfcPaths = _cfcPaths;
		}
	
		private String getcfcPaths() {
			return this._cfcPaths;
		}
	
		public void setconfigurationpath(String _configurationpath) {
			this._configurationpath = _configurationpath;
		}
	
		private String getconfigurationpath() {
			return this._configurationpath;
		}
	
		public void setmode(String _mode) {
			this._mode = _mode;
		}
	
		private String getmode() {
			return this._mode;
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
		proxyUrl += "?method=setGatewayInstance";
		proxyUrl += "&returnformat=plain";
		
			proxyUrl += "&adminPassword=" + adminPassword;
			if(!adminUserId.equals("")){
				proxyUrl += "&adminUserId=" + adminUserId;
			}
		
		
		
			if(!getgatewayid().equals("")){
				proxyUrl += "&gatewayid=" + getgatewayid(); 
			} 
		
			if(!gettype().equals("")){
				proxyUrl += "&type=" + gettype(); 
			} 
		
			if(!getcfcPaths().equals("")){
				proxyUrl += "&cfcPaths=" + getcfcPaths(); 
			} 
		
			if(!getconfigurationpath().equals("")){
				proxyUrl += "&configurationpath=" + getconfigurationpath(); 
			} 
		
			if(!getmode().equals("")){
				proxyUrl += "&mode=" + getmode(); 
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
			

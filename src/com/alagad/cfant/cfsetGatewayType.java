
package com.alagad.cfant;

import org.apache.tools.ant.BuildException;

public class cfsetGatewayType extends ProxyTask {
	
		private String _type = "";
	
		private String _description = "";
	
		private String _class = "";
	
		private String _timeout = "";
	
		private String _killOnTimeout = "";
	
	
		private String _property = "";	
	
	
	
	
		public void settype(String _type) {
			this._type = _type;
		}
	
		private String gettype() {
			return this._type;
		}
	
		public void setdescription(String _description) {
			this._description = _description;
		}
	
		private String getdescription() {
			return this._description;
		}
	
		public void setclass(String _class) {
			this._class = _class;
		}
	
		private String getclass() {
			return this._class;
		}
	
		public void settimeout(String _timeout) {
			this._timeout = _timeout;
		}
	
		private String gettimeout() {
			return this._timeout;
		}
	
		public void setkillOnTimeout(String _killOnTimeout) {
			this._killOnTimeout = _killOnTimeout;
		}
	
		private String getkillOnTimeout() {
			return this._killOnTimeout;
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
			
			
			// to make the http call we need to know at what URL the admin proxy is.
			String proxyUrl = rootUrl;
			proxyUrl += "/proxy/eventgatewayProxy.cfc";
			proxyUrl += "?method=setGatewayType";
			proxyUrl += "&returnformat=plain";
			
				proxyUrl += "&adminPassword=" + adminPassword;
				if(!adminUserId.equals("")){
					proxyUrl += "&adminUserId=" + adminUserId;
				}
			
			
			
				if(!gettype().equals("")){
					proxyUrl += "&type=" + gettype(); 
				} 
			
				if(!getdescription().equals("")){
					proxyUrl += "&description=" + getdescription(); 
				} 
			
				if(!getclass().equals("")){
					proxyUrl += "&class=" + getclass(); 
				} 
			
				if(!gettimeout().equals("")){
					proxyUrl += "&timeout=" + gettimeout(); 
				} 
			
				if(!getkillOnTimeout().equals("")){
					proxyUrl += "&killOnTimeout=" + getkillOnTimeout(); 
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
			

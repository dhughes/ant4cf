
package com.alagad.cfant;

import org.apache.tools.ant.BuildException;

public class cfverifyDsn extends ProxyTask {
	
		private String _dsn = "";
	
		private String _returnMsgOnError = "";
	
	
		private String _property = "";	
	
	
	
		public void setdsn(String _dsn) {
			this._dsn = _dsn;
		}
	
		private String getdsn() {
			return this._dsn;
		}
	
		public void setreturnMsgOnError(String _returnMsgOnError) {
			this._returnMsgOnError = _returnMsgOnError;
		}
	
		private String getreturnMsgOnError() {
			return this._returnMsgOnError;
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
		proxyUrl += "?method=verifyDsn";
		proxyUrl += "&returnformat=plain";
		
			proxyUrl += "&adminPassword=" + adminPassword;
			if(!adminUserId.equals("")){
				proxyUrl += "&adminUserId=" + adminUserId;
			}
		
		
		
			if(!getdsn().equals("")){
				proxyUrl += "&dsn=" + getdsn(); 
			} 
		
			if(!getreturnMsgOnError().equals("")){
				proxyUrl += "&returnMsgOnError=" + getreturnMsgOnError(); 
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
			

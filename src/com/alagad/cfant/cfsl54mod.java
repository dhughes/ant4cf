
package com.alagad.cfant;

import org.apache.tools.ant.BuildException;

public class cfsl54mod extends ProxyTask {
	
		private String _dsn = "";
	
		private String _odbcdsn = "";
	
		private String _connectString = "";
	
		private String _TimeStampAsString = "";
	
	
	
	
		public void setdsn(String _dsn) {
			this._dsn = _dsn;
		}
	
		private String getdsn() {
			return this._dsn;
		}
	
		public void setodbcdsn(String _odbcdsn) {
			this._odbcdsn = _odbcdsn;
		}
	
		private String getodbcdsn() {
			return this._odbcdsn;
		}
	
		public void setconnectString(String _connectString) {
			this._connectString = _connectString;
		}
	
		private String getconnectString() {
			return this._connectString;
		}
	
		public void setTimeStampAsString(String _TimeStampAsString) {
			this._TimeStampAsString = _TimeStampAsString;
		}
	
		private String getTimeStampAsString() {
			return this._TimeStampAsString;
		}
	
	
	
		
	public void execute() throws BuildException {
		
			// get the login information from this project
			String adminPassword = getProject().getProperty("adminPassword");
			String adminUserId = getProject().getProperty("adminUserId");
		
		
		// to make the http call we need to know at what URL the admin proxy is.
		String proxyUrl = getProject().getProperty("rootUrl");
		proxyUrl += "/proxy/datasourceProxy.cfc";
		proxyUrl += "?method=sl54mod";
		proxyUrl += "&returnformat=plain";
		
			proxyUrl += "&adminPassword=" + adminPassword;
			if(!adminUserId.equals("")){
				proxyUrl += "&adminUserId=" + adminUserId;
			}
		
		
		
			if(!getdsn().equals("")){
				proxyUrl += "&dsn=" + getdsn(); 
			} 
		
			if(!getodbcdsn().equals("")){
				proxyUrl += "&odbcdsn=" + getodbcdsn(); 
			} 
		
			if(!getconnectString().equals("")){
				proxyUrl += "&connectString=" + getconnectString(); 
			} 
		
			if(!getTimeStampAsString().equals("")){
				proxyUrl += "&TimeStampAsString=" + getTimeStampAsString(); 
			} 
		
		
		try{
			String result = getFromUrl(proxyUrl);
			
			
			
			// check to see if we need to set a property
		} catch(Exception e){
			throw new BuildException(e.getMessage());
		}
		
		
	}
	
}
			

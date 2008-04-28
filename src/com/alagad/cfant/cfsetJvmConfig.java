
package com.alagad.cfant;

import org.apache.tools.ant.BuildException;

public class cfsetJvmConfig extends ProxyTask {
	
		private String _minHeapArg = "";
	
		private String _maxHeapArg = "";
	
		private String _jvmArgs = "";
	
	
		private String _property = "";	
	
	
	
		public void setminHeapArg(String _minHeapArg) {
			this._minHeapArg = _minHeapArg;
		}
	
		private String getminHeapArg() {
			return this._minHeapArg;
		}
	
		public void setmaxHeapArg(String _maxHeapArg) {
			this._maxHeapArg = _maxHeapArg;
		}
	
		private String getmaxHeapArg() {
			return this._maxHeapArg;
		}
	
		public void setjvmArgs(String _jvmArgs) {
			this._jvmArgs = _jvmArgs;
		}
	
		private String getjvmArgs() {
			return this._jvmArgs;
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
		proxyUrl += "?method=setJvmConfig";
		proxyUrl += "&returnformat=plain";
		
			proxyUrl += "&adminPassword=" + adminPassword;
			if(!adminUserId.equals("")){
				proxyUrl += "&adminUserId=" + adminUserId;
			}
		
		
		
			if(!getminHeapArg().equals("")){
				proxyUrl += "&minHeapArg=" + getminHeapArg(); 
			} 
		
			if(!getmaxHeapArg().equals("")){
				proxyUrl += "&maxHeapArg=" + getmaxHeapArg(); 
			} 
		
			if(!getjvmArgs().equals("")){
				proxyUrl += "&jvmArgs=" + getjvmArgs(); 
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
			

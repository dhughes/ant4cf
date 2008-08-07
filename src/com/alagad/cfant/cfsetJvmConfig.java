
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
		try{
			
				// get the login information from this project
				String adminPassword = getProject().getProperty("adminPassword");
				String adminUserId = getProject().getProperty("adminUserId");
				String rootUrl = getProject().getProperty("rootUrl");
				String debug = getProject().getProperty("debug");
			
			
			// to make the http call we need to know at what URL the admin proxy is.
			String proxyUrl = rootUrl;
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
			
			
			if(Boolean.parseBoolean(debug)){
				System.out.println("Running Task 'setJvmConfig' via url: " + proxyUrl);
			}
			
			String result = getFromUrl(proxyUrl);
			
			System.out.println("Result:"  + result);
			
			
			
			
				getProject().setProperty(getproperty(), result);
			
					
		} catch(NullPointerException e) { 
			System.out.println("You must use the cflogin task before any other other adminapi tasks");
			throw new BuildException(e.toString());
		} catch(Exception e){
			throw new BuildException(e.toString());
		}
		
		
	}
	
}
			


package com.alagad.cfant;

import org.apache.tools.ant.BuildException;

public class cfsl54mlog extends ProxyTask {
	
		private String _odbcdsn = "";
	
		private String _logonmethod = "";
	
	
	
	
		public void setodbcdsn(String _odbcdsn) {
			this._odbcdsn = _odbcdsn;
		}
	
		private String getodbcdsn() {
			return this._odbcdsn;
		}
	
		public void setlogonmethod(String _logonmethod) {
			this._logonmethod = _logonmethod;
		}
	
		private String getlogonmethod() {
			return this._logonmethod;
		}
	
	
	
		
	public void execute() throws BuildException {
		try{
			
				// get the login information from this project
				String adminPassword = getProject().getProperty("adminPassword");
				String adminUserId = getProject().getProperty("adminUserId");
			
			
			// to make the http call we need to know at what URL the admin proxy is.
			String proxyUrl = getProject().getProperty("rootUrl");
			proxyUrl += "/proxy/datasourceProxy.cfc";
			proxyUrl += "?method=sl54mlog";
			proxyUrl += "&returnformat=plain";
			
				proxyUrl += "&adminPassword=" + adminPassword;
				if(!adminUserId.equals("")){
					proxyUrl += "&adminUserId=" + adminUserId;
				}
			
			
			
				if(!getodbcdsn().equals("")){
					proxyUrl += "&odbcdsn=" + getodbcdsn(); 
				} 
			
				if(!getlogonmethod().equals("")){
					proxyUrl += "&logonmethod=" + getlogonmethod(); 
				} 
			
		
			String result = getFromUrl(proxyUrl);
			
			
					
		} catch(NullPointerException e) { 
			System.out.println("You must use the cflogin task before any other other adminapi tasks");
			throw new BuildException(e.toString());
		} catch(Exception e){
			throw new BuildException(e.toString());
		}
		
		
	}
	
}
			


package com.alagad.cfant;

import org.apache.tools.ant.BuildException;

public class cfupgradeOdbcService extends ProxyTask {
	
		private String _odbcserver = "";
	
		private String _odbcagent = "";
	
	
	
	
		public void setodbcserver(String _odbcserver) {
			this._odbcserver = _odbcserver;
		}
	
		private String getodbcserver() {
			return this._odbcserver;
		}
	
		public void setodbcagent(String _odbcagent) {
			this._odbcagent = _odbcagent;
		}
	
		private String getodbcagent() {
			return this._odbcagent;
		}
	
	
	
		
	public void execute() throws BuildException {
		
			// get the login information from this project
			String adminPassword = getProject().getProperty("adminPassword");
			String adminUserId = getProject().getProperty("adminUserId");
		
		
		// to make the http call we need to know at what URL the admin proxy is.
		String proxyUrl = getProject().getProperty("rootUrl");
		proxyUrl += "/proxy/datasourceProxy.cfc";
		proxyUrl += "?method=upgradeOdbcService";
		proxyUrl += "&returnformat=plain";
		
			proxyUrl += "&adminPassword=" + adminPassword;
			if(!adminUserId.equals("")){
				proxyUrl += "&adminUserId=" + adminUserId;
			}
		
		
		
			if(!getodbcserver().equals("")){
				proxyUrl += "&odbcserver=" + getodbcserver(); 
			} 
		
			if(!getodbcagent().equals("")){
				proxyUrl += "&odbcagent=" + getodbcagent(); 
			} 
		
		
		try{
			String result = getFromUrl(proxyUrl);
			
			
			
			// check to see if we need to set a property
		} catch(Exception e){
			throw new BuildException(e.getMessage());
		}
		
		
	}
	
}
			


package com.alagad.cfant;

import org.apache.tools.ant.BuildException;

public class cfsetUseSingleRDSPassword extends ProxyTask {
	
		private String _useSingleRDSPassword = "";
	
	
	
	
		public void setuseSingleRDSPassword(String _useSingleRDSPassword) {
			this._useSingleRDSPassword = _useSingleRDSPassword;
		}
	
		private String getuseSingleRDSPassword() {
			return this._useSingleRDSPassword;
		}
	
	
	
		
	public void execute() throws BuildException {
		
			// get the login information from this project
			String adminPassword = getProject().getProperty("adminPassword");
			String adminUserId = getProject().getProperty("adminUserId");
		
		
		// to make the http call we need to know at what URL the admin proxy is.
		String proxyUrl = getProject().getProperty("rootUrl");
		proxyUrl += "/proxy/securityProxy.cfc";
		proxyUrl += "?method=setUseSingleRDSPassword";
		proxyUrl += "&returnformat=plain";
		
			proxyUrl += "&adminPassword=" + adminPassword;
			if(!adminUserId.equals("")){
				proxyUrl += "&adminUserId=" + adminUserId;
			}
		
		
		
			if(!getuseSingleRDSPassword().equals("")){
				proxyUrl += "&useSingleRDSPassword=" + getuseSingleRDSPassword(); 
			} 
		
		
		try{
			String result = getFromUrl(proxyUrl);
			
			
			
			// check to see if we need to set a property
		} catch(Exception e){
			throw new BuildException(e.getMessage());
		}
		
		
	}
	
}
			

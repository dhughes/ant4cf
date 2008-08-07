
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
		try{
			
				// get the login information from this project
				String adminPassword = getProject().getProperty("adminPassword");
				String adminUserId = getProject().getProperty("adminUserId");
				String rootUrl = getProject().getProperty("rootUrl");
				String debug = getProject().getProperty("debug");
			
			
			// to make the http call we need to know at what URL the admin proxy is.
			String proxyUrl = rootUrl;
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
			
			
			if(Boolean.parseBoolean(debug)){
				System.out.println("Running Task 'setUseSingleRDSPassword' via url: " + proxyUrl);
			}
			
			String result = getFromUrl(proxyUrl);
			
			System.out.println("Result:"  + result);
			
			
			
			
					
		} catch(NullPointerException e) { 
			System.out.println("You must use the cflogin task before any other other adminapi tasks");
			throw new BuildException(e.toString());
		} catch(Exception e){
			throw new BuildException(e.toString());
		}
		
		
	}
	
}
			

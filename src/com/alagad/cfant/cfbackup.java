
package com.alagad.cfant;

import org.apache.tools.ant.BuildException;

public class cfbackup extends ProxyTask {
	
		private String _daFile = "";
	
	
		private String _property = "";	
	
	
	
	
		public void setdaFile(String _daFile) {
			this._daFile = _daFile;
		}
	
		private String getdaFile() {
			return this._daFile;
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
			proxyUrl += "?method=backup";
			proxyUrl += "&returnformat=plain";
			
				proxyUrl += "&adminPassword=" + adminPassword;
				if(!adminUserId.equals("")){
					proxyUrl += "&adminUserId=" + adminUserId;
				}
			
			
			
				if(!getdaFile().equals("")){
					proxyUrl += "&daFile=" + getdaFile(); 
				}
			
			
			if(Boolean.parseBoolean(debug)){
				System.out.println("Running Task 'backup' via url: " + proxyUrl);
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
			

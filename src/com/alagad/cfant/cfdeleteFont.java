
package com.alagad.cfant;

import org.apache.tools.ant.BuildException;

public class cfdeleteFont extends ProxyTask {
	
		private String _fontFile = "";
	
	
	
	
		public void setfontFile(String _fontFile) {
			this._fontFile = _fontFile;
		}
	
		private String getfontFile() {
			return this._fontFile;
		}
	
	
	
		
	public void execute() throws BuildException {
		
			// get the login information from this project
			String adminPassword = getProject().getProperty("adminPassword");
			String adminUserId = getProject().getProperty("adminUserId");
		
		
		// to make the http call we need to know at what URL the admin proxy is.
		String proxyUrl = getProject().getProperty("rootUrl");
		proxyUrl += "/proxy/runtimeProxy.cfc";
		proxyUrl += "?method=deleteFont";
		proxyUrl += "&returnformat=plain";
		
			proxyUrl += "&adminPassword=" + adminPassword;
			if(!adminUserId.equals("")){
				proxyUrl += "&adminUserId=" + adminUserId;
			}
		
		
		
			if(!getfontFile().equals("")){
				proxyUrl += "&fontFile=" + getfontFile(); 
			} 
		
		
		try{
			String result = getFromUrl(proxyUrl);
			
			
			
			// check to see if we need to set a property
		} catch(Exception e){
			throw new BuildException(e.getMessage());
		}
		
		
	}
	
}
			

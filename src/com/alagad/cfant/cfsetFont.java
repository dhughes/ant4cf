
package com.alagad.cfant;

import org.apache.tools.ant.BuildException;

public class cfsetFont extends ProxyTask {
	
		private String _fontFile = "";
	
	
	
	
		public void setfontFile(String _fontFile) {
			this._fontFile = _fontFile;
		}
	
		private String getfontFile() {
			return this._fontFile;
		}
	
	
	
		
	public void execute() throws BuildException {
		try{
			
				// get the login information from this project
				String adminPassword = getProject().getProperty("adminPassword");
				String adminUserId = getProject().getProperty("adminUserId");
			
			
			// to make the http call we need to know at what URL the admin proxy is.
			String proxyUrl = getProject().getProperty("rootUrl");
			proxyUrl += "/proxy/runtimeProxy.cfc";
			proxyUrl += "?method=setFont";
			proxyUrl += "&returnformat=plain";
			
				proxyUrl += "&adminPassword=" + adminPassword;
				if(!adminUserId.equals("")){
					proxyUrl += "&adminUserId=" + adminUserId;
				}
			
			
			
				if(!getfontFile().equals("")){
					proxyUrl += "&fontFile=" + getfontFile(); 
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
			

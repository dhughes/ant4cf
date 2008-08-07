
package com.alagad.cfant;

import org.apache.tools.ant.BuildException;

public class cfsetApplet extends ProxyTask {
	
		private String _applet = "";
	
		private String _appletName = "";
	
	
		private String _property = "";	
	
	
	
	
		public void setapplet(String _applet) {
			this._applet = _applet;
		}
	
		private String getapplet() {
			return this._applet;
		}
	
		public void setappletName(String _appletName) {
			this._appletName = _appletName;
		}
	
		private String getappletName() {
			return this._appletName;
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
			proxyUrl += "/proxy/extensionsProxy.cfc";
			proxyUrl += "?method=setApplet";
			proxyUrl += "&returnformat=plain";
			
				proxyUrl += "&adminPassword=" + adminPassword;
				if(!adminUserId.equals("")){
					proxyUrl += "&adminUserId=" + adminUserId;
				}
			
			
			
				if(!getapplet().equals("")){
					proxyUrl += "&applet=" + getapplet(); 
				}
			
				if(!getappletName().equals("")){
					proxyUrl += "&appletName=" + getappletName(); 
				}
			
			
			if(Boolean.parseBoolean(debug)){
				System.out.println("Running Task 'setApplet' via url: " + proxyUrl);
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
			

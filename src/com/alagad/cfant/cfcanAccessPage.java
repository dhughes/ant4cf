
package com.alagad.cfant;

import org.apache.tools.ant.BuildException;

public class cfcanAccessPage extends ProxyTask {
	
		private String _page = "";
	
	
		private String _property = "";	
	
	
	
	
		public void setpage(String _page) {
			this._page = _page;
		}
	
		private String getpage() {
			return this._page;
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
				
				System.out.println(rootUrl);
			
			
			// to make the http call we need to know at what URL the admin proxy is.
			String proxyUrl = rootUrl;
			proxyUrl += "/proxy/accessmanagerProxy.cfc";
			proxyUrl += "?method=canAccessPage";
			proxyUrl += "&returnformat=plain";
			
				proxyUrl += "&adminPassword=" + adminPassword;
				if(!adminUserId.equals("")){
					proxyUrl += "&adminUserId=" + adminUserId;
				}
			
			
			
				if(!getpage().equals("")){
					proxyUrl += "&page=" + getpage(); 
				} 
			
		
			String result = getFromUrl(proxyUrl);
			
			
				getProject().setProperty(getproperty(), result);
			
					
		} catch(NullPointerException e) { 
			System.out.println("You must use the cflogin task before any other other adminapi tasks");
			throw new BuildException(e.toString());
		} catch(Exception e){
			throw new BuildException(e.toString());
		}
		
		
	}
	
}
			

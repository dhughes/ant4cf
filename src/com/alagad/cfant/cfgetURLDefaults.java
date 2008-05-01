
package com.alagad.cfant;

import org.apache.tools.ant.BuildException;

public class cfgetURLDefaults extends ProxyTask {
	
		private String _scope = "";
	
		private String _driver = "";
	
		private String _delims = "";
	
	
		private String _property = "";	
	
	
	
	
		public void setscope(String _scope) {
			this._scope = _scope;
		}
	
		private String getscope() {
			return this._scope;
		}
	
		public void setdriver(String _driver) {
			this._driver = _driver;
		}
	
		private String getdriver() {
			return this._driver;
		}
	
		public void setdelims(String _delims) {
			this._delims = _delims;
		}
	
		private String getdelims() {
			return this._delims;
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
			proxyUrl += "/proxy/datasourceProxy.cfc";
			proxyUrl += "?method=getURLDefaults";
			proxyUrl += "&returnformat=plain";
			
				proxyUrl += "&adminPassword=" + adminPassword;
				if(!adminUserId.equals("")){
					proxyUrl += "&adminUserId=" + adminUserId;
				}
			
			
			
				if(!getscope().equals("")){
					proxyUrl += "&scope=" + getscope(); 
				} 
			
				if(!getdriver().equals("")){
					proxyUrl += "&driver=" + getdriver(); 
				} 
			
				if(!getdelims().equals("")){
					proxyUrl += "&delims=" + getdelims(); 
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
			

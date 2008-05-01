
package com.alagad.cfant;

import org.apache.tools.ant.BuildException;

public class cfgetSlowCFThreadInvocationData extends ProxyTask {
	
		private String _templatepath = "";
	
		private String _lineno = "";
	
	
		private String _property = "";	
	
	
	
	
		public void settemplatepath(String _templatepath) {
			this._templatepath = _templatepath;
		}
	
		private String gettemplatepath() {
			return this._templatepath;
		}
	
		public void setlineno(String _lineno) {
			this._lineno = _lineno;
		}
	
		private String getlineno() {
			return this._lineno;
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
			
			
			// to make the http call we need to know at what URL the admin proxy is.
			String proxyUrl = rootUrl;
			proxyUrl += "/proxy/servermonitoringProxy.cfc";
			proxyUrl += "?method=getSlowCFThreadInvocationData";
			proxyUrl += "&returnformat=plain";
			
				proxyUrl += "&adminPassword=" + adminPassword;
				if(!adminUserId.equals("")){
					proxyUrl += "&adminUserId=" + adminUserId;
				}
			
			
			
				if(!gettemplatepath().equals("")){
					proxyUrl += "&templatepath=" + gettemplatepath(); 
				} 
			
				if(!getlineno().equals("")){
					proxyUrl += "&lineno=" + getlineno(); 
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
			

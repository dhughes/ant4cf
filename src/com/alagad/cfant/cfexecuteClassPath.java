
package com.alagad.cfant;

import org.apache.tools.ant.BuildException;

public class cfexecuteClassPath extends ProxyTask {
	
		private String _name = "";
	
	
	
	
	
		public void setname(String _name) {
			this._name = _name;
		}
	
		private String getname() {
			return this._name;
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
			proxyUrl += "/proxy/runtimeProxy.cfc";
			proxyUrl += "?method=executeClassPath";
			proxyUrl += "&returnformat=plain";
			
				proxyUrl += "&adminPassword=" + adminPassword;
				if(!adminUserId.equals("")){
					proxyUrl += "&adminUserId=" + adminUserId;
				}
			
			
			
				if(!getname().equals("")){
					proxyUrl += "&name=" + getname(); 
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
			

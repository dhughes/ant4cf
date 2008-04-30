
package com.alagad.cfant;

import org.apache.tools.ant.BuildException;

public class cfsetSlsServerServiceName extends ProxyTask {
	
		private String _serviceName = "";
	
	
		private String _property = "";	
	
	
	
		public void setserviceName(String _serviceName) {
			this._serviceName = _serviceName;
		}
	
		private String getserviceName() {
			return this._serviceName;
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
			
			
			// to make the http call we need to know at what URL the admin proxy is.
			String proxyUrl = getProject().getProperty("rootUrl");
			proxyUrl += "/proxy/datasourceProxy.cfc";
			proxyUrl += "?method=setSlsServerServiceName";
			proxyUrl += "&returnformat=plain";
			
				proxyUrl += "&adminPassword=" + adminPassword;
				if(!adminUserId.equals("")){
					proxyUrl += "&adminUserId=" + adminUserId;
				}
			
			
			
				if(!getserviceName().equals("")){
					proxyUrl += "&serviceName=" + getserviceName(); 
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
			

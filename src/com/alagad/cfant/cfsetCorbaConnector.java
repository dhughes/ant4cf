
package com.alagad.cfant;

import org.apache.tools.ant.BuildException;

public class cfsetCorbaConnector extends ProxyTask {
	
		private String _name = "";
	
		private String _oldname = "";
	
		private String _classname = "";
	
		private String _classpath = "";
	
		private String _propertyfile = "";
	
	
		private String _property = "";	
	
	
	
		public void setname(String _name) {
			this._name = _name;
		}
	
		private String getname() {
			return this._name;
		}
	
		public void setoldname(String _oldname) {
			this._oldname = _oldname;
		}
	
		private String getoldname() {
			return this._oldname;
		}
	
		public void setclassname(String _classname) {
			this._classname = _classname;
		}
	
		private String getclassname() {
			return this._classname;
		}
	
		public void setclasspath(String _classpath) {
			this._classpath = _classpath;
		}
	
		private String getclasspath() {
			return this._classpath;
		}
	
		public void setpropertyfile(String _propertyfile) {
			this._propertyfile = _propertyfile;
		}
	
		private String getpropertyfile() {
			return this._propertyfile;
		}
	
	
	
		public void setProperty(String _property) {
			this._property = _property;
		}
	
		private String getproperty() {
			return this._property;
		}
	
		
	public void execute() throws BuildException {
		
			// get the login information from this project
			String adminPassword = getProject().getProperty("adminPassword");
			String adminUserId = getProject().getProperty("adminUserId");
		
		
		// to make the http call we need to know at what URL the admin proxy is.
		String proxyUrl = getProject().getProperty("rootUrl");
		proxyUrl += "/proxy/extensionsProxy.cfc";
		proxyUrl += "?method=setCorbaConnector";
		proxyUrl += "&returnformat=plain";
		
			proxyUrl += "&adminPassword=" + adminPassword;
			if(!adminUserId.equals("")){
				proxyUrl += "&adminUserId=" + adminUserId;
			}
		
		
		
			if(!getname().equals("")){
				proxyUrl += "&name=" + getname(); 
			} 
		
			if(!getoldname().equals("")){
				proxyUrl += "&oldname=" + getoldname(); 
			} 
		
			if(!getclassname().equals("")){
				proxyUrl += "&classname=" + getclassname(); 
			} 
		
			if(!getclasspath().equals("")){
				proxyUrl += "&classpath=" + getclasspath(); 
			} 
		
			if(!getpropertyfile().equals("")){
				proxyUrl += "&propertyfile=" + getpropertyfile(); 
			} 
		
		
		try{
			String result = getFromUrl(proxyUrl);
			
			
				getProject().setProperty(getproperty(), result);
			
			
			// check to see if we need to set a property
		} catch(Exception e){
			throw new BuildException(e.getMessage());
		}
		
		
	}
	
}
			

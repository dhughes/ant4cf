
package com.alagad.cfant;

import org.apache.tools.ant.BuildException;

public class cfaddDebugEvent extends ProxyTask {
	
		private String _type = "";
	
		private String _message = "";
	
		private String _priority = "";
	
		private String _startTime = "";
	
		private String _endTime = "";
	
		private String _total = "";
	
	
		private String _property = "";	
	
	
	
	
		public void settype(String _type) {
			this._type = _type;
		}
	
		private String gettype() {
			return this._type;
		}
	
		public void setmessage(String _message) {
			this._message = _message;
		}
	
		private String getmessage() {
			return this._message;
		}
	
		public void setpriority(String _priority) {
			this._priority = _priority;
		}
	
		private String getpriority() {
			return this._priority;
		}
	
		public void setstartTime(String _startTime) {
			this._startTime = _startTime;
		}
	
		private String getstartTime() {
			return this._startTime;
		}
	
		public void setendTime(String _endTime) {
			this._endTime = _endTime;
		}
	
		private String getendTime() {
			return this._endTime;
		}
	
		public void settotal(String _total) {
			this._total = _total;
		}
	
		private String gettotal() {
			return this._total;
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
			proxyUrl += "/proxy/debuggingProxy.cfc";
			proxyUrl += "?method=addDebugEvent";
			proxyUrl += "&returnformat=plain";
			
				proxyUrl += "&adminPassword=" + adminPassword;
				if(!adminUserId.equals("")){
					proxyUrl += "&adminUserId=" + adminUserId;
				}
			
			
			
				if(!gettype().equals("")){
					proxyUrl += "&type=" + gettype(); 
				}
			
				if(!getmessage().equals("")){
					proxyUrl += "&message=" + getmessage(); 
				}
			
				if(!getpriority().equals("")){
					proxyUrl += "&priority=" + getpriority(); 
				}
			
				if(!getstartTime().equals("")){
					proxyUrl += "&startTime=" + getstartTime(); 
				}
			
				if(!getendTime().equals("")){
					proxyUrl += "&endTime=" + getendTime(); 
				}
			
				if(!gettotal().equals("")){
					proxyUrl += "&total=" + gettotal(); 
				}
			
			
			if(Boolean.parseBoolean(debug)){
				System.out.println("Running Task 'addDebugEvent' via url: " + proxyUrl);
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
			

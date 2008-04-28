
package com.alagad.cfant;

import org.apache.tools.ant.BuildException;

public class cfsetSecuredFolder extends ProxyTask {
	
		private String _directory = "";
	
		private String _folder = "";
	
		private String _fileRead = "";
	
		private String _fileWrite = "";
	
		private String _fileExecute = "";
	
		private String _fileDelete = "";
	
	
		private String _property = "";	
	
	
	
		public void setdirectory(String _directory) {
			this._directory = _directory;
		}
	
		private String getdirectory() {
			return this._directory;
		}
	
		public void setfolder(String _folder) {
			this._folder = _folder;
		}
	
		private String getfolder() {
			return this._folder;
		}
	
		public void setfileRead(String _fileRead) {
			this._fileRead = _fileRead;
		}
	
		private String getfileRead() {
			return this._fileRead;
		}
	
		public void setfileWrite(String _fileWrite) {
			this._fileWrite = _fileWrite;
		}
	
		private String getfileWrite() {
			return this._fileWrite;
		}
	
		public void setfileExecute(String _fileExecute) {
			this._fileExecute = _fileExecute;
		}
	
		private String getfileExecute() {
			return this._fileExecute;
		}
	
		public void setfileDelete(String _fileDelete) {
			this._fileDelete = _fileDelete;
		}
	
		private String getfileDelete() {
			return this._fileDelete;
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
		proxyUrl += "/proxy/securityProxy.cfc";
		proxyUrl += "?method=setSecuredFolder";
		proxyUrl += "&returnformat=plain";
		
			proxyUrl += "&adminPassword=" + adminPassword;
			if(!adminUserId.equals("")){
				proxyUrl += "&adminUserId=" + adminUserId;
			}
		
		
		
			if(!getdirectory().equals("")){
				proxyUrl += "&directory=" + getdirectory(); 
			} 
		
			if(!getfolder().equals("")){
				proxyUrl += "&folder=" + getfolder(); 
			} 
		
			if(!getfileRead().equals("")){
				proxyUrl += "&fileRead=" + getfileRead(); 
			} 
		
			if(!getfileWrite().equals("")){
				proxyUrl += "&fileWrite=" + getfileWrite(); 
			} 
		
			if(!getfileExecute().equals("")){
				proxyUrl += "&fileExecute=" + getfileExecute(); 
			} 
		
			if(!getfileDelete().equals("")){
				proxyUrl += "&fileDelete=" + getfileDelete(); 
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
			

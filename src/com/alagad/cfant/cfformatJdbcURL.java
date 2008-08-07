
package com.alagad.cfant;

import org.apache.tools.ant.BuildException;

public class cfformatJdbcURL extends ProxyTask {
	
		private String _driver = "";
	
		private String _host = "";
	
		private String _port = "";
	
		private String _dsn = "";
	
		private String _database = "";
	
		private String _datasource = "";
	
		private String _args = "";
	
		private String _informixServer = "";
	
		private String _selectMethod = "";
	
		private String _SID = "";
	
		private String _MaxPooledStatements = "";
	
		private String _isnewdb = "";
	
	
	
	
	
		public void setdriver(String _driver) {
			this._driver = _driver;
		}
	
		private String getdriver() {
			return this._driver;
		}
	
		public void sethost(String _host) {
			this._host = _host;
		}
	
		private String gethost() {
			return this._host;
		}
	
		public void setport(String _port) {
			this._port = _port;
		}
	
		private String getport() {
			return this._port;
		}
	
		public void setdsn(String _dsn) {
			this._dsn = _dsn;
		}
	
		private String getdsn() {
			return this._dsn;
		}
	
		public void setdatabase(String _database) {
			this._database = _database;
		}
	
		private String getdatabase() {
			return this._database;
		}
	
		public void setdatasource(String _datasource) {
			this._datasource = _datasource;
		}
	
		private String getdatasource() {
			return this._datasource;
		}
	
		public void setargs(String _args) {
			this._args = _args;
		}
	
		private String getargs() {
			return this._args;
		}
	
		public void setinformixServer(String _informixServer) {
			this._informixServer = _informixServer;
		}
	
		private String getinformixServer() {
			return this._informixServer;
		}
	
		public void setselectMethod(String _selectMethod) {
			this._selectMethod = _selectMethod;
		}
	
		private String getselectMethod() {
			return this._selectMethod;
		}
	
		public void setSID(String _SID) {
			this._SID = _SID;
		}
	
		private String getSID() {
			return this._SID;
		}
	
		public void setMaxPooledStatements(String _MaxPooledStatements) {
			this._MaxPooledStatements = _MaxPooledStatements;
		}
	
		private String getMaxPooledStatements() {
			return this._MaxPooledStatements;
		}
	
		public void setisnewdb(String _isnewdb) {
			this._isnewdb = _isnewdb;
		}
	
		private String getisnewdb() {
			return this._isnewdb;
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
			proxyUrl += "/proxy/datasourceProxy.cfc";
			proxyUrl += "?method=formatJdbcURL";
			proxyUrl += "&returnformat=plain";
			
				proxyUrl += "&adminPassword=" + adminPassword;
				if(!adminUserId.equals("")){
					proxyUrl += "&adminUserId=" + adminUserId;
				}
			
			
			
				if(!getdriver().equals("")){
					proxyUrl += "&driver=" + getdriver(); 
				}
			
				if(!gethost().equals("")){
					proxyUrl += "&host=" + gethost(); 
				}
			
				if(!getport().equals("")){
					proxyUrl += "&port=" + getport(); 
				}
			
				if(!getdsn().equals("")){
					proxyUrl += "&dsn=" + getdsn(); 
				}
			
				if(!getdatabase().equals("")){
					proxyUrl += "&database=" + getdatabase(); 
				}
			
				if(!getdatasource().equals("")){
					proxyUrl += "&datasource=" + getdatasource(); 
				}
			
				if(!getargs().equals("")){
					proxyUrl += "&args=" + getargs(); 
				}
			
				if(!getinformixServer().equals("")){
					proxyUrl += "&informixServer=" + getinformixServer(); 
				}
			
				if(!getselectMethod().equals("")){
					proxyUrl += "&selectMethod=" + getselectMethod(); 
				}
			
				if(!getSID().equals("")){
					proxyUrl += "&SID=" + getSID(); 
				}
			
				if(!getMaxPooledStatements().equals("")){
					proxyUrl += "&MaxPooledStatements=" + getMaxPooledStatements(); 
				}
			
				if(!getisnewdb().equals("")){
					proxyUrl += "&isnewdb=" + getisnewdb(); 
				}
			
			
			if(Boolean.parseBoolean(debug)){
				System.out.println("Running Task 'formatJdbcURL' via url: " + proxyUrl);
			}
			
			String result = getFromUrl(proxyUrl);
			
			System.out.println("Result:"  + result);
			
			
			
			
					
		} catch(NullPointerException e) { 
			System.out.println("You must use the cflogin task before any other other adminapi tasks");
			throw new BuildException(e.toString());
		} catch(Exception e){
			throw new BuildException(e.toString());
		}
		
		
	}
	
}
			

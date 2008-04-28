
package com.alagad.cfant;

import org.apache.tools.ant.BuildException;

public class cfsetDerbyEmbedded extends ProxyTask {
	
		private String _name = "";
	
		private String _database = "";
	
		private String _originaldsn = "";
	
		private String _driver = "";
	
		private String _class = "";
	
		private String _username = "";
	
		private String _password = "";
	
		private String _encryptpassword = "";
	
		private String _description = "";
	
		private String _args = "";
	
		private String _isnewdb = "";
	
		private String _timeout = "";
	
		private String _interval = "";
	
		private String _login_timeout = "";
	
		private String _buffer = "";
	
		private String _blob_buffer = "";
	
		private String _enablemaxconnections = "";
	
		private String _maxconnections = "";
	
		private String _pooling = "";
	
		private String _disable = "";
	
		private String _disable_clob = "";
	
		private String _disable_blob = "";
	
		private String _select = "";
	
		private String _create = "";
	
		private String _grant = "";
	
		private String _insert = "";
	
		private String _drop = "";
	
		private String _revoke = "";
	
		private String _update = "";
	
		private String _alter = "";
	
		private String _storedproc = "";
	
		private String _delete = "";
	
		private String _validationQuery = "";
	
	
		private String _property = "";	
	
	
	
		public void setname(String _name) {
			this._name = _name;
		}
	
		private String getname() {
			return this._name;
		}
	
		public void setdatabase(String _database) {
			this._database = _database;
		}
	
		private String getdatabase() {
			return this._database;
		}
	
		public void setoriginaldsn(String _originaldsn) {
			this._originaldsn = _originaldsn;
		}
	
		private String getoriginaldsn() {
			return this._originaldsn;
		}
	
		public void setdriver(String _driver) {
			this._driver = _driver;
		}
	
		private String getdriver() {
			return this._driver;
		}
	
		public void setclass(String _class) {
			this._class = _class;
		}
	
		private String getclass() {
			return this._class;
		}
	
		public void setusername(String _username) {
			this._username = _username;
		}
	
		private String getusername() {
			return this._username;
		}
	
		public void setpassword(String _password) {
			this._password = _password;
		}
	
		private String getpassword() {
			return this._password;
		}
	
		public void setencryptpassword(String _encryptpassword) {
			this._encryptpassword = _encryptpassword;
		}
	
		private String getencryptpassword() {
			return this._encryptpassword;
		}
	
		public void setdescription(String _description) {
			this._description = _description;
		}
	
		private String getdescription() {
			return this._description;
		}
	
		public void setargs(String _args) {
			this._args = _args;
		}
	
		private String getargs() {
			return this._args;
		}
	
		public void setisnewdb(String _isnewdb) {
			this._isnewdb = _isnewdb;
		}
	
		private String getisnewdb() {
			return this._isnewdb;
		}
	
		public void settimeout(String _timeout) {
			this._timeout = _timeout;
		}
	
		private String gettimeout() {
			return this._timeout;
		}
	
		public void setinterval(String _interval) {
			this._interval = _interval;
		}
	
		private String getinterval() {
			return this._interval;
		}
	
		public void setlogin_timeout(String _login_timeout) {
			this._login_timeout = _login_timeout;
		}
	
		private String getlogin_timeout() {
			return this._login_timeout;
		}
	
		public void setbuffer(String _buffer) {
			this._buffer = _buffer;
		}
	
		private String getbuffer() {
			return this._buffer;
		}
	
		public void setblob_buffer(String _blob_buffer) {
			this._blob_buffer = _blob_buffer;
		}
	
		private String getblob_buffer() {
			return this._blob_buffer;
		}
	
		public void setenablemaxconnections(String _enablemaxconnections) {
			this._enablemaxconnections = _enablemaxconnections;
		}
	
		private String getenablemaxconnections() {
			return this._enablemaxconnections;
		}
	
		public void setmaxconnections(String _maxconnections) {
			this._maxconnections = _maxconnections;
		}
	
		private String getmaxconnections() {
			return this._maxconnections;
		}
	
		public void setpooling(String _pooling) {
			this._pooling = _pooling;
		}
	
		private String getpooling() {
			return this._pooling;
		}
	
		public void setdisable(String _disable) {
			this._disable = _disable;
		}
	
		private String getdisable() {
			return this._disable;
		}
	
		public void setdisable_clob(String _disable_clob) {
			this._disable_clob = _disable_clob;
		}
	
		private String getdisable_clob() {
			return this._disable_clob;
		}
	
		public void setdisable_blob(String _disable_blob) {
			this._disable_blob = _disable_blob;
		}
	
		private String getdisable_blob() {
			return this._disable_blob;
		}
	
		public void setselect(String _select) {
			this._select = _select;
		}
	
		private String getselect() {
			return this._select;
		}
	
		public void setcreate(String _create) {
			this._create = _create;
		}
	
		private String getcreate() {
			return this._create;
		}
	
		public void setgrant(String _grant) {
			this._grant = _grant;
		}
	
		private String getgrant() {
			return this._grant;
		}
	
		public void setinsert(String _insert) {
			this._insert = _insert;
		}
	
		private String getinsert() {
			return this._insert;
		}
	
		public void setdrop(String _drop) {
			this._drop = _drop;
		}
	
		private String getdrop() {
			return this._drop;
		}
	
		public void setrevoke(String _revoke) {
			this._revoke = _revoke;
		}
	
		private String getrevoke() {
			return this._revoke;
		}
	
		public void setupdate(String _update) {
			this._update = _update;
		}
	
		private String getupdate() {
			return this._update;
		}
	
		public void setalter(String _alter) {
			this._alter = _alter;
		}
	
		private String getalter() {
			return this._alter;
		}
	
		public void setstoredproc(String _storedproc) {
			this._storedproc = _storedproc;
		}
	
		private String getstoredproc() {
			return this._storedproc;
		}
	
		public void setdelete(String _delete) {
			this._delete = _delete;
		}
	
		private String getdelete() {
			return this._delete;
		}
	
		public void setvalidationQuery(String _validationQuery) {
			this._validationQuery = _validationQuery;
		}
	
		private String getvalidationQuery() {
			return this._validationQuery;
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
		proxyUrl += "/proxy/datasourceProxy.cfc";
		proxyUrl += "?method=setDerbyEmbedded";
		proxyUrl += "&returnformat=plain";
		
			proxyUrl += "&adminPassword=" + adminPassword;
			if(!adminUserId.equals("")){
				proxyUrl += "&adminUserId=" + adminUserId;
			}
		
		
		
			if(!getname().equals("")){
				proxyUrl += "&name=" + getname(); 
			} 
		
			if(!getdatabase().equals("")){
				proxyUrl += "&database=" + getdatabase(); 
			} 
		
			if(!getoriginaldsn().equals("")){
				proxyUrl += "&originaldsn=" + getoriginaldsn(); 
			} 
		
			if(!getdriver().equals("")){
				proxyUrl += "&driver=" + getdriver(); 
			} 
		
			if(!getclass().equals("")){
				proxyUrl += "&class=" + getclass(); 
			} 
		
			if(!getusername().equals("")){
				proxyUrl += "&username=" + getusername(); 
			} 
		
			if(!getpassword().equals("")){
				proxyUrl += "&password=" + getpassword(); 
			} 
		
			if(!getencryptpassword().equals("")){
				proxyUrl += "&encryptpassword=" + getencryptpassword(); 
			} 
		
			if(!getdescription().equals("")){
				proxyUrl += "&description=" + getdescription(); 
			} 
		
			if(!getargs().equals("")){
				proxyUrl += "&args=" + getargs(); 
			} 
		
			if(!getisnewdb().equals("")){
				proxyUrl += "&isnewdb=" + getisnewdb(); 
			} 
		
			if(!gettimeout().equals("")){
				proxyUrl += "&timeout=" + gettimeout(); 
			} 
		
			if(!getinterval().equals("")){
				proxyUrl += "&interval=" + getinterval(); 
			} 
		
			if(!getlogin_timeout().equals("")){
				proxyUrl += "&login_timeout=" + getlogin_timeout(); 
			} 
		
			if(!getbuffer().equals("")){
				proxyUrl += "&buffer=" + getbuffer(); 
			} 
		
			if(!getblob_buffer().equals("")){
				proxyUrl += "&blob_buffer=" + getblob_buffer(); 
			} 
		
			if(!getenablemaxconnections().equals("")){
				proxyUrl += "&enablemaxconnections=" + getenablemaxconnections(); 
			} 
		
			if(!getmaxconnections().equals("")){
				proxyUrl += "&maxconnections=" + getmaxconnections(); 
			} 
		
			if(!getpooling().equals("")){
				proxyUrl += "&pooling=" + getpooling(); 
			} 
		
			if(!getdisable().equals("")){
				proxyUrl += "&disable=" + getdisable(); 
			} 
		
			if(!getdisable_clob().equals("")){
				proxyUrl += "&disable_clob=" + getdisable_clob(); 
			} 
		
			if(!getdisable_blob().equals("")){
				proxyUrl += "&disable_blob=" + getdisable_blob(); 
			} 
		
			if(!getselect().equals("")){
				proxyUrl += "&select=" + getselect(); 
			} 
		
			if(!getcreate().equals("")){
				proxyUrl += "&create=" + getcreate(); 
			} 
		
			if(!getgrant().equals("")){
				proxyUrl += "&grant=" + getgrant(); 
			} 
		
			if(!getinsert().equals("")){
				proxyUrl += "&insert=" + getinsert(); 
			} 
		
			if(!getdrop().equals("")){
				proxyUrl += "&drop=" + getdrop(); 
			} 
		
			if(!getrevoke().equals("")){
				proxyUrl += "&revoke=" + getrevoke(); 
			} 
		
			if(!getupdate().equals("")){
				proxyUrl += "&update=" + getupdate(); 
			} 
		
			if(!getalter().equals("")){
				proxyUrl += "&alter=" + getalter(); 
			} 
		
			if(!getstoredproc().equals("")){
				proxyUrl += "&storedproc=" + getstoredproc(); 
			} 
		
			if(!getdelete().equals("")){
				proxyUrl += "&delete=" + getdelete(); 
			} 
		
			if(!getvalidationQuery().equals("")){
				proxyUrl += "&validationQuery=" + getvalidationQuery(); 
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
			

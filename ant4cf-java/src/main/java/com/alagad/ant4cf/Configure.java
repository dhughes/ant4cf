package com.alagad.ant4cf;

import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.Task;

public class Configure extends Task {
	
	private String ant4cfUrl; 
	private String adminPassword;
	private String adminUserId;
	private boolean debug = false;
	
	// The method executing the task
    public void execute() throws BuildException {
    	getProject().setProperty("ant4cfUrl", this.ant4cfUrl);
    	getProject().setProperty("adminPassword", this.adminPassword);
    	if(this.adminUserId != null){
    		getProject().setProperty("adminUserId", this.adminUserId);
    	}
    	getProject().setProperty("debug", String.valueOf(this.debug));
    }	
    
    public void setAnt4cfUrl(String ant4cfUrl){
		this.ant4cfUrl = ant4cfUrl;
	}

	public void setAdminPassword(String adminPassword){
		this.adminPassword = adminPassword;
	}

	public void setAdminUserId(String adminUserId){
		this.adminUserId = adminUserId;
	}
	
	public void setDebug(boolean debug){
		this.debug = debug;
	}
	
}

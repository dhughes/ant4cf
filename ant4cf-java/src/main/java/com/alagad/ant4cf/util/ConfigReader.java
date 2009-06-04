package com.alagad.ant4cf.util;

import org.apache.tools.ant.Project;

public class ConfigReader {

	private Project project; 
	
	public ConfigReader(Project project){
		this.project = project;
	} 

	public String getAnt4cfUrl(){
		return this.project.getProperty("ant4cfUrl");
	}
	
	public String getAdminPassword(){
		return this.project.getProperty("adminPassword");
	}
	
	public boolean getDebug(){
		return Boolean.parseBoolean(this.project.getProperty("debug"));
	}
	
	public String getAdminUserId(){
		if(this.project.getProperties().containsKey("adminUserId")){
			return this.project.getProperty("adminUserId");
		} else {
			return null;
		}
	}
    
	
}

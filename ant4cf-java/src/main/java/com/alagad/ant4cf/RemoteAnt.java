package com.alagad.ant4cf;


import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;

import org.apache.commons.codec.binary.Base64;
import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpStatus;
import org.apache.commons.httpclient.NameValuePair;
import org.apache.commons.httpclient.methods.PostMethod;
import org.apache.commons.httpclient.methods.multipart.FilePart;
import org.apache.commons.httpclient.methods.multipart.MultipartRequestEntity;
import org.apache.commons.httpclient.methods.multipart.Part;
import org.apache.commons.httpclient.methods.multipart.StringPart;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.Task;
import org.json.JSONException;
import org.json.JSONObject;

import com.alagad.ant4cf.util.ConfigReader;
import com.alagad.ant4cf.util.Util;

public class RemoteAnt extends Task {
	private String antfile;
	private String target;
	private String libdir = "antlib"; 
	private String[] properties;
	private ConfigReader config;
	private int timeout = 60;

	// The method executing the task
    public void execute() throws BuildException {
    	String targetDesc;
    	
    	if(this.target == null){
    		targetDesc = "default";
    	} else {
    		targetDesc = "'" + this.target + "'";
    	}
    	
    	config = new ConfigReader(getProject());
    	
    	if(this.target != null){
    		System.out.println("Preparing to run target '" + this.target + "' in '" + this.antfile + "' remotely via server at '" + this.config.getAnt4cfUrl() + "'.");
    	} else {
    		System.out.println("Preparing to run target the default target in '" + this.antfile + "' remotely via server at '" + this.config.getAnt4cfUrl() + "'.");
    	}
    	
    	// start a new session
		String sessionId;
		try{
			sessionId = startRemoteRun();
		} catch(Exception e){
			throw new BuildException(e.getMessage());
		}
		
		System.out.println("Uploading required libs.");	

		// get a list of libs we need to upload
		ArrayList<File> libs = getLibs();
		
		// upload each lib
		for(int x = 0 ; x < libs.size() ; x++){
			try{
				if(!useLib(sessionId, (File)libs.get(x))){
					uploadLib(sessionId, (File)libs.get(x));
				}
			} catch(Exception e){
				throw new BuildException(e.getMessage());
			}
		}

		System.out.println("Running target " + targetDesc + " remotely...");	
		System.out.println("************************************************");	

		// run the remote target
		try{
			runRemoteTarget(sessionId); 
			
			System.out.println("************************************************");
			System.out.println("Target '" + targetDesc + "' completed");
		} catch(Exception e){
			throw new BuildException(e.getMessage());
		}
	
    }
    
    private void runRemoteTarget(String sessionId) throws IOException, Exception{
    	HttpClient client = new HttpClient();
    	
    	String url = this.config.getAnt4cfUrl() + "/ant4cfService.cfc";
    	PostMethod post = new PostMethod(url);
        
    	NameValuePair[] data = {
            new NameValuePair("method", "runRemoteTarget"),
            new NameValuePair("target", this.target),
        	new NameValuePair("sessionId", sessionId),
        	new NameValuePair("debug", Boolean.toString(config.getDebug())),
        	new NameValuePair("properties", getProperties()),
    		new NameValuePair("timeout", String.valueOf(this.timeout))
        };

        if(config.getDebug()){
        	System.out.println("Service URL: " + url);
        	System.out.println("Service Arguments...");
        	for(int x = 0 ; x < data.length ; x++){
        		System.out.println(data[x].getName() + ": " + data[x].getValue());
        	}
        }
        
        post.setRequestBody(data);
        
        int status = client.executeMethod(post);
        
        if(status == 200){
	        InputStream in = post.getResponseBodyAsStream();
	        
	        // dump the response.
	        Util.dump(new InputStreamReader(in));
        } else {
        	throw new Exception("HTTP Error: " + status + ", Detail: " + Util.read(new InputStreamReader(post.getResponseBodyAsStream())));
        }

    	// disconnect
        post.releaseConnection();
    }
    
    private boolean useLib(String sessionId, File lib) throws IOException, Exception{
    	HttpClient client = new HttpClient();
    	boolean exists; 
    	
    	String url = this.config.getAnt4cfUrl() + "/ant4cfService.cfc";
    	PostMethod post = new PostMethod(url);
    	
        NameValuePair[] data = {
            new NameValuePair("method", "useLib"),
        	new NameValuePair("sessionId", sessionId),
        	new NameValuePair("libFile", lib.getName()),
        	new NameValuePair("libHash", getFileHash(lib))
        };
        
        if(config.getDebug()){
        	System.out.println("Service URL: " + url);
        	System.out.println("Service Arguments...");
        	for(int x = 0 ; x < data.length ; x++){
        		System.out.println(data[x].getName() + ": " + data[x].getValue());
        	}
        }

        post.setRequestBody(data);
        
        int status = client.executeMethod(post);
        
        if(status == 200){
	        InputStream in = post.getResponseBodyAsStream();
	        
	        // handle response.
	        exists = Boolean.parseBoolean(Util.read(new InputStreamReader(in)));
        } else {
        	throw new Exception("HTTP Error: " + status + ", Detail: " + Util.read(new InputStreamReader(post.getResponseBodyAsStream())));
        }
        

    	// disconnect
        post.releaseConnection();
        
        if(exists){
        	System.out.println("	Using cached " + lib.getName());
        }
        
        return exists;
    }
    
    private String getFileHash(File lib) throws IOException, NoSuchAlgorithmException{
    	byte[] data = Util.getBytesFromFile(lib);
    	MessageDigest digest = MessageDigest.getInstance("MD5");
    	byte[] md5 = digest.digest(data);
    	
    	return new String(Base64.encodeBase64(md5));
    }
    
      
    private void uploadLib(String sessionId, File lib) throws IOException{
    	HttpClient client = new HttpClient();
    	    	
    	String targetURL = this.config.getAnt4cfUrl() + "/ant4cfService.cfc";
 
    	PostMethod filePost = new PostMethod(targetURL);
    	
    	try{
	    	System.out.println("	Uploading " + lib.getName());
	    	Part[] parts = {
	    		new FilePart("lib", lib),
	    		new StringPart("method", "uploadLib"),
	    		new StringPart("sessionId", sessionId),
	    		new StringPart("timeout", String.valueOf(this.timeout))
	    	};
	    	

	        if(config.getDebug()){
	        	System.out.println("Service URL: " + targetURL);
	        	System.out.println("Service Arguments...");
	        	for(int x = 0 ; x < parts.length ; x++){
	        		System.out.println(parts[x].getName() + ": " + parts[x].toString());
	        	}
	        }
	    	
	    	filePost.setRequestEntity(
	    		new MultipartRequestEntity(parts, filePost.getParams())
	    	);
	    	    	
	    	client.getHttpConnectionManager().
	    	getParams().setConnectionTimeout(5000);
	    	
	    	int status = client.executeMethod(filePost);
	    	
	    	if (status == HttpStatus.SC_OK) {
	    		System.out.println("Upload complete");
	    	} else {
	    		System.out.println("Upload failed: " + HttpStatus.getStatusText(status));
	    	}

    	} catch(FileNotFoundException e) {
    		// do nothing - we already know this file exists.
    	} 

    	// disconnect
    	filePost.releaseConnection();
    }
    
    private ArrayList<File> getLibs(){
    	ArrayList<File> libs = new ArrayList<File>();
    	
    	// list the jars in the antlib directory
    	File directory = new File(this.libdir);
        
    	// convert to an arraylist
    	File[] files = directory.listFiles();
    	
    	// loop over the list (backwards) and remove anything that's not a jar
    	for(int x = 0; x < files.length ; x++){
    		String name = files[x].toString();
    		
    		if(name.length() >= 3 && name.substring(name.length()-3, name.length()).toLowerCase().equals("jar")){
    			// this is a jar!
    			libs.add(files[x]);
    		}
    	}
    	
    	return libs;    	
    }
    
    private String startRemoteRun() throws IOException, Exception{
    	HttpClient client = new HttpClient();
    	
    	String url = this.config.getAnt4cfUrl() + "/ant4cfService.cfc";
    	PostMethod post = new PostMethod(url);
    	
        NameValuePair[] data = getRemoteRunArguments();

        if(config.getDebug()){
        	System.out.println("Service URL: " + url);
        	System.out.println("Service Arguments...");
        	for(int x = 0 ; x < data.length ; x++){
        		System.out.println(data[x].getName() + ": " + data[x].getValue());
        	}
        }
        
        post.setRequestBody(data);
        
        int status = client.executeMethod(post);
        String sessionId;
        
        if(status == 200){
	        InputStream in = post.getResponseBodyAsStream();
	        
	        // handle response.
	        sessionId = Util.read(new InputStreamReader(in));
        } else {
        	throw new Exception("HTTP Error: " + status + ", Detail: " + Util.read(new InputStreamReader(post.getResponseBodyAsStream())));
        }

    	// disconnect
        post.releaseConnection();
        
        if(sessionId.equals("Failed")){
        	throw new Exception("Login to CF admin failed");
        }

        return sessionId;
    }
        
    private NameValuePair[] getRemoteRunArguments() throws IOException{
    	ArrayList<NameValuePair> args = new ArrayList<NameValuePair>();

    	String buildXml = Util.readFile(this.antfile);
    	
    	args.add(new NameValuePair("method", "startRemoteRun"));
    	args.add(new NameValuePair("buildXml", buildXml));
    	
    	args.add(new NameValuePair("adminPassword", this.config.getAdminPassword()));
    	if(this.config.getAdminUserId() != null){
    		args.add(new NameValuePair("adminUserId", this.config.getAdminUserId()));
    	}
    	
    	NameValuePair[] result = new NameValuePair[args.size()];
    	args.toArray(result);
    	
    	return result;
    }
    
    public void setAntfile(String antfile){
    	this.antfile = antfile;
    }
    
    public void setTarget(String target){
    	this.target = target;
    }

	/*
	public void setgetAnt4cfUrl()(String getAnt4cfUrl()){
		getAnt4cfUrl() = getAnt4cfUrl();
	}
	*/

	
	public void setProperties(String properties){
		this.properties = properties.split(",");
	}
	
	private String getProperties(){
		JSONObject properties = new JSONObject();
		
		for(int x = 0 ; x < this.properties.length ; x++){
			try{
				properties.put(this.properties[x], getProject().getProperty(this.properties[x]));
			} catch(JSONException e) {
				// do nothing
			}
		}
		
		return properties.toString();
	}

	/*
	public void setAdminPassword(String adminPassword){
		this.adminPassword = adminPassword;
	}

	public void setAdminUserId(String adminUserId){
		this.adminUserId = adminUserId;
	}
	*/
	
	public void setLibdir(String libdir){
		this.libdir = libdir;
	} 
	
	public void setTimeout(int timeout){
		this.timeout = timeout;
	} 
	
}
 
package com.alagad.cfant;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import org.apache.tools.ant.Task;

public class ProxyTask extends Task {
	
	public String getFromUrl(String url) throws Exception{
		URL loginUrl = new URL(url);
		
		BufferedReader in = new BufferedReader(new InputStreamReader(loginUrl.openStream()));

		String inputLine;
		String result = "";

		while ((inputLine = in.readLine()) != null){
			result += inputLine + "\r";
		}

		in.close();
		
		// check to see if there was an exception
		if(result.length() >= 13 && result.substring(0, 13).equals("**EXCEPTION**")){
			throw new Exception(result.substring(13));		
		}
		
		return result.trim();
	}
	
	
}

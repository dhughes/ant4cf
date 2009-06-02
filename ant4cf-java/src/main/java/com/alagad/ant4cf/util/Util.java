package com.alagad.ant4cf.util;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.Reader;

public class Util { 

	 public static byte[] getBytesFromFile(File file) throws IOException {
        InputStream is = new FileInputStream(file);
    
        // Get the size of the file
        long length = file.length(); 
    
        // You cannot create an array using a long type.
        // It needs to be an int type.
        // Before converting to an int type, check
        // to ensure that file is not larger than Integer.MAX_VALUE.
        if (length > Integer.MAX_VALUE) {
            // File is too large
        }
    
        // Create the byte array to hold the data
        byte[] bytes = new byte[(int)length];
    
        // Read in the bytes
        int offset = 0;
        int numRead = 0;
        while (offset < bytes.length
               && (numRead=is.read(bytes, offset, bytes.length-offset)) >= 0) {
            offset += numRead;
        }
    
        // Ensure all the bytes have been read in
        if (offset < bytes.length) {
            throw new IOException("Could not completely read file "+file.getName());
        }
    
        // Close the input stream and return bytes
        is.close();
        return bytes;
    }
	 
	public static String readFile(String path) throws IOException{
        return read(new FileReader(path));
    }

	public static String read(Reader reader) throws IOException{
    	StringBuilder contents = new StringBuilder();

		//use buffering, reading one line at a time
		//FileReader always assumes default encoding is OK!
		BufferedReader input =  new BufferedReader(reader);
		try {
			String line = null; //not declared within while loop
			/*
			* readLine is a bit quirky :
			* it returns the content of a line MINUS the newline.
			* it returns null only for the END of the stream.
			* it returns an empty String if two newlines appear in a row.
			*/
			while (( line = input.readLine()) != null){
				contents.append(line);
				contents.append(System.getProperty("line.separator"));
			}
		}
		finally {
			input.close();
		}
		
		return contents.toString().trim();
    }
    
	public static void dump(Reader reader) throws IOException{
    	//use buffering, reading one line at a time
		//FileReader always assumes default encoding is OK!
		BufferedReader input =  new BufferedReader(reader);
		try {
			String line = null; //not declared within while loop
			/*
			* readLine is a bit quirky :
			* it returns the content of a line MINUS the newline.
			* it returns null only for the END of the stream.
			* it returns an empty String if two newlines appear in a row.
			*/
			while (( line = input.readLine()) != null){
				System.out.println(line);
			}
		}
		finally {
			input.close();
		}
    }
}

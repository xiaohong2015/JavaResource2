package com.tools;

import java.io.File;

public class FileOperation
    {
	public static void deleteFile(String filename)
	    {
		java.io.File file = new File(filename);
		if (file.exists())
		    {
			file.delete();
		    }
	    }
    }

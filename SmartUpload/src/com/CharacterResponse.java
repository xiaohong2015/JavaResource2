package com;

import java.io.CharArrayWriter;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletResponseWrapper;

public class CharacterResponse extends HttpServletResponseWrapper {

	private CharArrayWriter output;
	
	public CharacterResponse(HttpServletResponse response) {
		super(response);
		this.output = new CharArrayWriter();
	}
	
	public PrintWriter getWriter() {
		return new PrintWriter(output);
	}
	
	public String toString() {
		return this.output.toString();
	}

}

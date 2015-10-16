package com;

import javax.servlet.http.HttpServletResponseWrapper;
import java.io.CharArrayWriter;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;

public class CharacterResponse extends HttpServletResponseWrapper {
    private CharArrayWriter output;

    public String toString() {
        return output.toString();
    }

    public CharacterResponse(HttpServletResponse response){
        super(response);
        this.output=new CharArrayWriter();
    }

    public PrintWriter getWriter(){
        return new PrintWriter(output);

    }


}

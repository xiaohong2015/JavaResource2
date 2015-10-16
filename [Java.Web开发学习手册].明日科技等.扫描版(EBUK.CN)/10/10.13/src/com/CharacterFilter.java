package com;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;

public class CharacterFilter extends HttpServlet implements Filter {

    public void init(FilterConfig filterConfig) throws ServletException {
    }

    public void doFilter(ServletRequest request, ServletResponse response,
                         FilterChain filterChain) throws ServletException,
            IOException {

  response.setCharacterEncoding("gb2312");

        PrintWriter out = response.getWriter();
        CharacterResponse wrapper = new CharacterResponse((HttpServletResponse)
                response);
        filterChain.doFilter(request, wrapper);

       String resStr = wrapper.toString();
     String newStr = "";
       if (resStr.indexOf("is") > 0) {
            newStr = resStr.replace("is", "**");
       }


      out.println(newStr);

    }




}

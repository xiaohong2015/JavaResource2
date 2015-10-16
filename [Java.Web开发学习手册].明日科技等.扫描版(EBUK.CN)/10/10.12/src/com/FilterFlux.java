package com;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.util.*;

public class FilterFlux extends HttpServlet implements Filter {

    private static int flux = 0;

    public void init(FilterConfig filterConfig) throws ServletException {

    }

    public synchronized void doFilter(ServletRequest request, ServletResponse response,
                         FilterChain filterChain) throws
            ServletException, IOException {
       this.flux++;
       request.setAttribute("flux",String.valueOf(flux));

       filterChain.doFilter(request, response);


    }

    public void destroy() {
    }
}

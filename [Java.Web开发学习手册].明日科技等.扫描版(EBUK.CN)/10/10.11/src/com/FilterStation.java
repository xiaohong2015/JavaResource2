package com;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.util.*;

public class FilterStation extends HttpServlet implements Filter {
    private FilterConfig filterConfig;

    public void init(FilterConfig filterConfig) throws ServletException {
        this.filterConfig = filterConfig;
    }


    public void doFilter(ServletRequest request, ServletResponse response,
                         FilterChain filterChain) throws ServletException,
            IOException {
HttpSession session=((HttpServletRequest)request).getSession();
        response.setCharacterEncoding("gb2312");
       if(session.getAttribute("user")==null){
       PrintWriter out=response.getWriter();
       out.print("<script language=javascript>alert('Äú»¹Ã»ÓÐµÇÂ¼£¡£¡£¡');window.location.href='../index.jsp';</script>");
       }else{
        filterChain.doFilter(request, response);
       }
    }

    public void destroy() {
    }
}

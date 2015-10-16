package com;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.util.*;

public class ShowCookie extends HttpServlet {


    public void doGet(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {
        response.setContentType("text/html; charset=GBK");
        Cookie[] cookies = request.getCookies();
        for (int i = 0; i < cookies.length; i++) {
            request.setAttribute("name", cookies[i].getName()); //获得名字
            request.setAttribute("value", cookies[i].getValue()); //获得值


        }

        RequestDispatcher dispatcher = request.getRequestDispatcher(
                "/index.jsp");
        dispatcher.forward(request, response);

    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {
        doGet(request, response);
    }


}

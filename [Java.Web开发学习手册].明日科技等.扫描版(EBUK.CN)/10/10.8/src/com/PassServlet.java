package com;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.util.*;

public class PassServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {
        request.setCharacterEncoding("gb2312");
        UserInfo userInfo = new UserInfo();
        userInfo.setAge(request.getParameter("age"));
        userInfo.setName(request.getParameter("name"));
        userInfo.setSex(request.getParameter("sex"));
        request.setAttribute("user",userInfo);
        this.getServletConfig().getServletContext().getRequestDispatcher("/showInfomation.jsp").forward(request,response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {
        doGet(request, response);
    }


}

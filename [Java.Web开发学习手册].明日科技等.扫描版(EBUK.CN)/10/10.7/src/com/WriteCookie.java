package com;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.util.*;

//写入Cookie
public class WriteCookie extends HttpServlet {


     public void doGet(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {
        response.setContentType("text/html; charset=GBK");
        Cookie cookie = new Cookie("name", request.getParameter("name")); // 生成一个有名和值的Cookie
        cookie.setMaxAge(60); //返回该cookie的最大寿命
        cookie.setPath("/"); //返回使用该Cookie的所有URL前缀
        response.addCookie(cookie);
        RequestDispatcher dispatcher = request.getRequestDispatcher(
                "/index.jsp");
        dispatcher.forward(request, response);

    }


    public void doPost(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {
        doGet(request, response);
    }


}

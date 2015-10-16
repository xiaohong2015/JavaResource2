package com;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.util.*;

//д��Cookie
public class WriteCookie extends HttpServlet {


     public void doGet(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {
        response.setContentType("text/html; charset=GBK");
        Cookie cookie = new Cookie("name", request.getParameter("name")); // ����һ��������ֵ��Cookie
        cookie.setMaxAge(60); //���ظ�cookie���������
        cookie.setPath("/"); //����ʹ�ø�Cookie������URLǰ׺
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

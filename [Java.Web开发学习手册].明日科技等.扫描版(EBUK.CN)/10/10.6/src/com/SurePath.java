package com;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;

public class SurePath extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {
        response.setContentType("text/html; charset=GBK");
        ServletContext context = this.getServletContext();
        PrintWriter out = response.getWriter();
        out.print("��ȡ��ǰ����������ʵ·����" + context.getRealPath("") + "");
    }




}

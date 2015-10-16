package com;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String username=new String(request.getParameter("username").getBytes("iso-8859-1"), "utf-8");   //此处需要进行转码，否则将产生中文乱码
		String pwd=new String(request.getParameter("PWD").getBytes("iso-8859-1"), "utf-8");
		DealModel dealModel=new DealModel();
		String result=dealModel.check(username, pwd);
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		System.out.println("返回结果："+result);
		PrintWriter out = response.getWriter();
		out.print(result);
		out.flush();
		out.close();
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request,response);
	}
}

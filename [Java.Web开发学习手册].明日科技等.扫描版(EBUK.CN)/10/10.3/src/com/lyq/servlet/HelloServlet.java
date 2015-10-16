package com.lyq.servlet;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
public class HelloServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	// ����POST����
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		// ��ȡname����ֵ
		String name = request.getParameter("name");
		// ��response�л�ȡPrintWriter����
		PrintWriter writer = response.getWriter();
		// �ж�name�Ƿ�Ϊ��
		if (name != null) {
			// ���name��Ϊ��,��ͨ��writer���name
			writer.write("Hello " + name + " !");
		}
		writer.flush();// ˢ��writer
		writer.close();// �ر�writer
	}
}

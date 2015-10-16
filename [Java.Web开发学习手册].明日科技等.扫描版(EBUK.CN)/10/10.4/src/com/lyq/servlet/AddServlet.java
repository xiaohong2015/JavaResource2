package com.lyq.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lyq.bean.User;

/**
 * Servlet implementation class AddServlet
 */
public class AddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@SuppressWarnings("unchecked")
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// ����request�ı����ʽ
		request.setCharacterEncoding("GB18030");
		// ��ȡ�û�����
		String name = request.getParameter("name");
		// ��ȡ�Ա�
		String sex = request.getParameter("sex");
		// ��ȡ��ͥסַ
		String add = request.getParameter("add");
		// ʵ����User
		User user = new User();
		// ��������ֵ
		user.setName(name);
		// ���Ա�ֵ
		user.setSex(sex);
		// �Լ�ͥסַ��ֵ
		user.setAdd(add);
		// ��ȡServletContext����
		ServletContext application = getServletContext();
		// ��ServletContext�л�ȡusers
		List<User> list = (List<User>) application.getAttribute("users");
		// �ж�List�Ƿ�Ϊnull
		if(list == null){
			// ʵ����list
			list = new ArrayList<User>();
		}
		// ��user��ӵ�List������
		list.add(user);
		// ��List������Application��Χ��
		application.setAttribute("users", list);
		// ����RequestDispatcher����
		RequestDispatcher dispatcher = request.getRequestDispatcher("manager.jsp");
		// ����ת����manager.jspҳ��
		dispatcher.forward(request, response);
	}

}

<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>

<%@page import="java.util.Enumeration"%><html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>����MySQL���ݿ�</title>
</head>
<body>
<%
	try {
		// �������ݿ�������ע�ᵽ����������
		Class.forName("com.mysql.jdbc.Driver");
		// ���ݿ������ַ���
		String url = "jdbc:mysql://localhost:3306/mysql";
		// ���ݿ��û���
		String username = "root";
		// ���ݿ�����
		String password = "111";
		// ����Connection����
		Connection conn = DriverManager.getConnection(url,username,password);
		// �ж� ���ݿ������Ƿ�Ϊ��
		if(conn != null){
			// ���������Ϣ
			out.println("���ݿ����ӳɹ���");
			// �ر����ݿ�����
			conn.close();
		}else{
			// ���������Ϣ
			out.println("���ݿ�����ʧ�ܣ�");
		}
	} catch (ClassNotFoundException e) {
		e.printStackTrace();
	} catch (SQLException e) {
		e.printStackTrace();
	}
%>
</body>
</html>
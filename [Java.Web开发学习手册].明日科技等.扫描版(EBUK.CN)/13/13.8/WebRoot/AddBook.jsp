<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>��ӽ��</title>
</head>
<body>
	<%request.setCharacterEncoding("GB18030"); %>
	<jsp:useBean id="book" class="com.lyq.bean.Book"></jsp:useBean>
	<jsp:setProperty property="*" name="book"/>
	<%
		try {
			// �������ݿ�������ע�ᵽ����������
			Class.forName("com.mysql.jdbc.Driver");
			// ���ݿ������ַ���
			String url = "jdbc:mysql://localhost:3306/db_database11";
			// ���ݿ��û���
			String username = "root";
			// ���ݿ�����
			String password = "111";
			// ����Connection����
			Connection conn = DriverManager.getConnection(url,username,password);
			// ���ͼ����Ϣ��SQL���
			String sql = "insert into tb_book(name,price,bookCount,author) values(?,?,?,?)";
			// ��ȡPreparedStatement
			PreparedStatement ps = conn.prepareStatement(sql);
			// ��SQL����еĵ�1��������ֵ
			ps.setString(1, book.getName());
			// ��SQL����еĵ�2��������ֵ
			ps.setDouble(2, book.getPrice());
			// ��SQL����еĵ�3��������ֵ
			ps.setInt(3,book.getBookCount());
			// ��SQL����еĵ�4��������ֵ
			ps.setString(4, book.getAuthor());
			// ִ�и��²�����������Ӱ�������
			int row = ps.executeUpdate();
			// �ж��Ƿ���³ɹ�
			if(row > 0){
				// ���³������Ϣ
				out.print("�ɹ������ " + row + "�����ݣ�");
			}
			// �ر�PreparedStatement���ͷ���Դ
			ps.close();
			// �ر�Connection���ͷ���Դ
			conn.close();
		} catch (Exception e) {
			out.print("ͼ����Ϣ���ʧ�ܣ�");
			e.printStackTrace();
		}
	%>
	<br>
	<a href="index.jsp">����</a>
</body>
</html>
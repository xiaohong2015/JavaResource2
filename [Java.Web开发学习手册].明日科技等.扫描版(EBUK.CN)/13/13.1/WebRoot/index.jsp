<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>

<%@page import="java.util.Enumeration"%><html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>连接MySQL数据库</title>
</head>
<body>
<%
	try {
		// 加载数据库驱动，注册到驱动管理器
		Class.forName("com.mysql.jdbc.Driver");
		// 数据库连接字符串
		String url = "jdbc:mysql://localhost:3306/mysql";
		// 数据库用户名
		String username = "root";
		// 数据库密码
		String password = "111";
		// 创建Connection连接
		Connection conn = DriverManager.getConnection(url,username,password);
		// 判断 数据库连接是否为空
		if(conn != null){
			// 输出连接信息
			out.println("数据库连接成功！");
			// 关闭数据库连接
			conn.close();
		}else{
			// 输出连接信息
			out.println("数据库连接失败！");
		}
	} catch (ClassNotFoundException e) {
		e.printStackTrace();
	} catch (SQLException e) {
		e.printStackTrace();
	}
%>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="java.util.List"%>
<%@page import="com.lyq.bean.User"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>�û���Ϣ����</title>
</head>
<body>
	<table align="center" border="1" width="400">
		<tr>
			<td align="center" colspan="3">
				<h2>�û���Ϣ����</h2>
			</td>
		</tr>
		<tr align="center" style="font-weight: bold;">
			<td>����</td>
			<td>�Ա�</td>
			<td>��ͥסַ</td>
		</tr>
		<%
			List<User> list = (List<User>)application.getAttribute("users");
			if(list != null){
				for(User user : list){
		%>
			<tr align="center">
				<td><%=user.getName()%></td>
				<td><%=user.getSex()%></td>
				<td><%=user.getAdd()%></td>
			</tr>
		<%
				}
			}
		%>
		<tr>
			<td align="center" colspan="3">
				<a href="index.jsp">�������</a>
			</td>
		</tr>
	</table>
</body>
</html>
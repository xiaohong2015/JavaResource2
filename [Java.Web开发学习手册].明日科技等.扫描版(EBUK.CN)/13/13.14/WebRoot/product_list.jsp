<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="java.util.List"%>
<%@page import="com.lyq.bean.Product"%><html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>������Ʒ��Ϣ</title>
<style type="text/css">
	td{font-size: 12px;}
	h2{margin: 0px}
</style>
</head>
<body>
<table align="center" width="450" border="1" height="180" bordercolor="white" bgcolor="black" cellpadding="1" cellspacing="1">
	<tr bgcolor="white">
		<td align="center" colspan="5">
			<h2>������Ʒ��Ϣ</h2>
		</td>
	</tr>
	<tr align="center" bgcolor="#e1ffc1" >
		<td><b>ID</b></td>
		<td><b>��Ʒ����</b></td>
		<td><b>�۸�</b></td>
		<td><b>����</b></td>
		<td><b>��λ</b></td>
	</tr>
	<%
		List<Product> list = (List<Product>)request.getAttribute("list");
		for(Product p : list){
	%>
	<tr align="center" bgcolor="white">
		<td><%=p.getId()%></td>
		<td><%=p.getName()%></td>
		<td><%=p.getPrice()%></td>
		<td><%=p.getNum()%></td>
		<td><%=p.getUnit()%></td>
	</tr>
	<%	
		}
	%>
	<tr>
		<td align="center" colspan="5" bgcolor="white">
			<%=request.getAttribute("bar")%>
		</td>
	</tr>
</table>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=gbk"
    pageEncoding="gbk"%>
<%
	String msg = (String)request.getAttribute("msg");	//�õ���ʾ��Ϣ
%>
<html>
  <head>
	<meta http-equiv="Content-Type" content="text/html; charset=gbk">
	<title>��Ϣ��ʾ</title>
  </head>
  <body bgcolor="#EBF5FD">
    <center><br/><br/><br/><br/><br/><br/>
	<h1>
	  <%= msg %>
	  <p/><center><a href="JavaScript:history.back()">
	  <img border="0" src="img/back.jpg"/></a>
	</h1>
	</center>
  </body>
</html>
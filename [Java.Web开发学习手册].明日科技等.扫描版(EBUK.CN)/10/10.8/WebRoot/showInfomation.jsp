<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.UserInfo"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>����JavaBean��Servlet��JSP��������</title>
</head>
<link href="css/style.css" rel="stylesheet" type="text/css">
<%
UserInfo user=(UserInfo)request.getAttribute("user");
%>
<body>
<div align="center">
<table width="324" height="225" border="0" cellpadding="0" cellspacing="0">
    <tr align="center">
      <td background="back.jpg"><br>
        <br>
	    �������ݳɹ�<br><br>
    <table width="268" border="1" cellpadding="0" cellspacing="0">
      <tr  align="center">
        <td width="63" height="30">������</td>
        <td width="199"><%=user.getName()%></td>
      </tr>
      <tr align="center">
        <td height="30">���䣺</td>
        <td><%=user.getAge()%></td>
      </tr>
      <tr align="center">
        <td height="30">�Ա�</td>
        <td><%=user.getSex()%></td>
      </tr>
    </table>
  
    <p><br>
    </p></td>
    </tr>
  </table>



</div>
</body>
</html>

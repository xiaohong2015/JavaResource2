<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ taglib prefix="fn" uri ="/WEB-INF/funcation.tld"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312"/>
<link href="css/style.css" type="text/css" rel="stylesheet" />
<title>�Զ��庯����Ӧ��</title>
</head>
<style type="text/css">
<!--
body {
	background-color: #FFCC00;
}
-->
</style>
<body>
<p align="center">�Զ��庯����Ӧ��</p>
<form name="form1" method="post" action="index.jsp">

<table width="300" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="272" align="center">  
	<input type="text" name="foo" value="${param.foo}">&nbsp;&nbsp;
    <input type="submit" name="Submit" value="�ύ">
  </td>
  </tr>
</table>
</form>



<table width="300" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr align="center">
    <td width="189" height="25">˵��</td>
    <td width="111">������</td>
  </tr>
  <tr align="center">
    <td height="25">����������ݷ������</td>
    <td>${fn:reverse(param.foo)}</td>
  </tr>
   <tr align="center">
    <td height="25">�����������ת��Ϊ��д��ĸ</td>
    <td>${fn:cape(param.foo)}</td>
  </tr>
</table>
</body>
</html>

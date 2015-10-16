<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ taglib prefix="fn" uri ="/WEB-INF/funcation.tld"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312"/>
<link href="css/style.css" type="text/css" rel="stylesheet" />
<title>自定义函数的应用</title>
</head>
<style type="text/css">
<!--
body {
	background-color: #FFCC00;
}
-->
</style>
<body>
<p align="center">自定义函数的应用</p>
<form name="form1" method="post" action="index.jsp">

<table width="300" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="272" align="center">  
	<input type="text" name="foo" value="${param.foo}">&nbsp;&nbsp;
    <input type="submit" name="Submit" value="提交">
  </td>
  </tr>
</table>
</form>



<table width="300" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr align="center">
    <td width="189" height="25">说明</td>
    <td width="111">输出结果</td>
  </tr>
  <tr align="center">
    <td height="25">将输入的内容反向输出</td>
    <td>${fn:reverse(param.foo)}</td>
  </tr>
   <tr align="center">
    <td height="25">将输入的内容转换为大写字母</td>
    <td>${fn:cape(param.foo)}</td>
  </tr>
</table>
</body>
</html>

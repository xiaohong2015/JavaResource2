<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>在Servlet中实现页面转发的操作</title>
<link href="css/style.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
body {
	background-color: #00CCCC;
}
-->
</style></head>

<body><div align="center"><br>
利用HttpServletRequest类的getRequestDispatcher()方法<br><br>
进行页面转发
<form name="form" method="post" action="forwardservlet">
  <input type="submit" name="Submit" value="页面转发">
</form>
</div>
</body>
</html>

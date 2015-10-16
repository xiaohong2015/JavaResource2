<%@ page language="java" contentType="text/html; charset=GB18030" pageEncoding="GB18030"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>根据是否登录显示不同的内容</title>
</head>
<body>
<c:choose>
	<c:when test="${empty param.username}">
	  <form name="form1" method="post" action="">
		用户名：
	      <input name="username" type="text" id="username">
	    <br>
	    <br>
	    <input type="submit" name="Submit" value="登录">
	  </form>
	</c:when>
	<c:otherwise>
		[${param.username }] 欢迎访问我公司网站！
	</c:otherwise>
</c:choose>
</body>
</html>

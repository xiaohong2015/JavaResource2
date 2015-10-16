<%@ page language="java" contentType="text/html; charset=GB18030" pageEncoding="GB18030"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>重定向页面并传递参数</title>
</head>
<body>
<c:redirect url="main.jsp">
	<c:param name="user" value="wgh"/>
</c:redirect>
</body>
</html>
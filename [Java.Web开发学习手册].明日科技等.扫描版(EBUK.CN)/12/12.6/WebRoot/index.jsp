<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>Ӧ��&lt;c:url&gt;��ǩ���ɴ�������URL��ַ</title>
</head>
<body>
<c:url var="path" value="register.jsp" scope="page">
	<c:param name="user" value="����"/>
	<c:param name="email" value="wgh717@sohu.com"/>
</c:url>
<a href="${pageScope.path }">�ύע��</a>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=GB18030" pageEncoding="GB18030"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.*" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>���˴�齱</title>
</head>
<body>
<%Random rnd=new Random();%>
<!-- ����ȡ���������ֱ��浽������ -->
<c:set var="luck">
	<%=rnd.nextInt(10)%>
</c:set>
<c:choose>
	<c:when test="${luck==6}">��ϲ�㣬����һ�Ƚ���</c:when>
	<c:when test="${luck==7}" >��ϲ�㣬���˶��Ƚ���</c:when>
	<c:when test="${luck==8}">��ϲ�㣬�������Ƚ���</c:when>
	<c:otherwise>лл���Ĳ��룡</c:otherwise>
</c:choose>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=GB18030" pageEncoding="GB18030"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>ʵ�ַ�ʱ�ʺ�</title>
</head>
<body>
<!-- ��ȡСʱ�����浽������ -->
<c:set var="hours">
	<%=new java.util.Date().getHours()%>
</c:set>
<!-- ��ȡ���Ӳ����浽������-->
<c:set var="second">
	<%=new java.util.Date().getMinutes()%>
</c:set>
<c:choose>
	<c:when test="${hours>1 && hours<6}">���Ϻã�</c:when>
	<c:when test="${hours>6 && hours<11}" >����ã�</c:when>
	<c:when test="${hours>11 && hours<17}">����ã�</c:when>
	<c:when test="${hours>17 && hours<24}">���Ϻã�</c:when>
</c:choose>
 ����ʱ���ǣ�${hours}:${second}
</body>
</html>

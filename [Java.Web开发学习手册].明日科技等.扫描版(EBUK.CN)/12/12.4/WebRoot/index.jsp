<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>Ӧ��&lt;c:catch&gt;��ǩ�����쳣��Ϣ</title>
</head>
<body>
<c:catch var="error">
	<jsp:useBean class="com.wgh.UserInfo" id="userInfo"/>
	<c:set target="${userInfo}" property="pwd">111</c:set>
</c:catch>
<c:out value="${error}"/>
</body>
</html>
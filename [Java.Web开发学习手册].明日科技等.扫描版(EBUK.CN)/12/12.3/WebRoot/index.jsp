<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>Ӧ��&lt;c:remove&gt;��ǩ�Ƴ�����</title>
</head>
<body>
<ul>
<li>����request��Χ�ڵı���username</li>
<br>
<c:set var="username" value="���տƼ�" scope="request"/>
username��ֵΪ��<c:out value="${username}"/>
<li>�Ƴ�request��Χ�ڵı���username</li>
<br>
<c:remove var="username" scope="request"/>
username��ֵΪ��<c:out value="${username}" default="��"/>
</ul>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>Ӧ��&lt;c:set&gt;��ǩ��Ӧ��</title>
</head>
<body>
<ul>
<li>����request��Χ�ڵı���username</li>
<br>
<c:set var="username" value="���տƼ�" scope="request"/>
<c:out value="username��ֵΪ��${username}"/>
<li>����UserInfo�����name����</li>
<jsp:useBean class="com.wgh.UserInfo" id="userInfo"/>
<c:set target="${userInfo}" property="name">wgh</c:set>
<br>
<c:out value="UserInfo��name����ֵΪ��${userInfo.name}"></c:out>
</ul>
</body>
</html>
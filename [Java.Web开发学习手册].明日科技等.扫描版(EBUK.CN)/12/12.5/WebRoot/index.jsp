<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>Ӧ��&lt;c:import&gt;��ǩ������վBanner</title>
</head>
<body style=" margin:0px;">
<c:set var="typeName" value="���н��� | �����ϸ� | ����DJ | ŷ������ | �ٶ����� | ������ | �����ϰ�"/>
<!-- ������վ��Banner -->
<c:import url="navigation.jsp" charEncoding="GB18030">
	<c:param name="typeList" value="${typeName}"/>
</c:import>

</body>
</html>
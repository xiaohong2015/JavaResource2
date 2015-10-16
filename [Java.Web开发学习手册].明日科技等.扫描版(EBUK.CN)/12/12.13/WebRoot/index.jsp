<%@ page language="java" contentType="text/html; charset=GB18030" pageEncoding="GB18030"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>应用&lt;c:forEach&gt;列举10以内全部奇数</title>
</head>
<body>

<b>10以内的全部奇数为：</b>
<c:forEach var="i" begin="1" end="10" step="2">
	${i}&nbsp;&nbsp;
</c:forEach>
</body>
</html>

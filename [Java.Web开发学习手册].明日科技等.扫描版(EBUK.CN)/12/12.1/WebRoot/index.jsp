<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>应用&lt;c:out&gt;标签输出字符串“水平线标记&lt;hr&gt;”</title>
</head>
<body>
escapeXml属性为true时：
<c:out value="水平线标记<hr>" escapeXml="true"></c:out>
<br>
escapeXml属性为false时：
<c:out value="水平线标记<hr>" escapeXml="false"></c:out>
</body>
</html>
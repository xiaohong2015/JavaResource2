<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>Ӧ��&lt;c:out&gt;��ǩ����ַ�����ˮƽ�߱��&lt;hr&gt;��</title>
</head>
<body>
escapeXml����Ϊtrueʱ��
<c:out value="ˮƽ�߱��<hr>" escapeXml="true"></c:out>
<br>
escapeXml����Ϊfalseʱ��
<c:out value="ˮƽ�߱��<hr>" escapeXml="false"></c:out>
</body>
</html>
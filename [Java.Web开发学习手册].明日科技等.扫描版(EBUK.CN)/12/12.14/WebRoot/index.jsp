<%@ page language="java" contentType="text/html; charset=GB18030" pageEncoding="GB18030"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>Ӧ��&lt;c:forTokens&gt;�ָ��ַ���</title>
</head>
<body>
<c:set var="sourceStr" value="Java Web�����򿪷��������䡢����ģ���ȫ��Java��ʵ����ȫ��ѧ�ֲᡢ����ģ���ȫ"/>
<b>ԭ�ַ�����</b>${sourceStr}
<br><b>�ָ����ַ�����</b><br>
<c:forTokens items="${sourceStr}" delims="������" var="item">
	${item}<br>
</c:forTokens>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=GB18030" pageEncoding="GB18030"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>�����Ƿ��¼��ʾ��ͬ������</title>
</head>
<body>
<c:if var="result" test="${empty param.username}">
  <form name="form1" method="post" action="">
	�û�����
      <input name="username" type="text" id="username">
    <br>
    <br>
    <input type="submit" name="Submit" value="��¼">
  </form>
</c:if>
<c:if test="${!result}">
	[${param.username }] ��ӭ�����ҹ�˾��վ��
</c:if>
</body>
</html>

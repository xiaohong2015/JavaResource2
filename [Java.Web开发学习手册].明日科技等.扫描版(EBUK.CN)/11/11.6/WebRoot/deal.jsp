<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<%@ taglib uri="/stringDeal" prefix="wghfn"%>
<%request.setCharacterEncoding("GB18030"); %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>显示结果</title>
</head>
<body>
内容为：<br>
${wghfn:shiftEnter(param.content)}
</body>
</html>
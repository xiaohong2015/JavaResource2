<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>JspSmartUpload</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
</head>

<body>
	<form action="${pageContext.request.contextPath}/servlet/UpServlet" method="POST" enctype="multipart/form-data">
		<input type="file" name="file" /> 
		<input type="submit" value="上传" />
		<input type="reset" value="重置" />
	</form>
	<br>
	<%File files = new File("F://temp");
	if(files.isDirectory()) {
		String[] fn = files.list();
		for(int i=0; i<fn.length; i++) { %>
			<a href="${pageContext.request.contextPath}/servlet/DownServlet?downfile=<%=fn[i]%>"><%=fn[i]%></a>
			<br>
		<%}
	}%>
</body>
</html>

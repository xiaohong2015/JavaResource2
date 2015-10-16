<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.io.File" %>
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

<title>SWFUpload</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<script type="text/javascript" src="page/SWFUpload/handlers.js"></script>
<script type="text/javascript">
	var upload;
	var flashUrl = "${pageContext.request.contextPath}/page/SWFUpload/swfupload.swf";
	var ImageUrl = "${pageContext.request.contextPath}/page/SWFUpload/images/select-files-CN.png";
	var url = "${pageContext.request.contextPath}/servlet/UpServlet2";
	var sizeLimit = "10 GB";
	var types = "*";
	var typesdesc = "web file";
	var uploadLimit = 20;
</script>
</head>
<body>
	<div class="flash" id="fsUploadProgress"></div>
	<div style="padding-left: 5px;">
		<span id="spanButtonPlaceholder"></span> <input id="btnCancel"
			type="button" value="取消" onclick="cancelQueue(upload);"
			disabled="disabled"
			style="margin-left: 2px; height: 22px; font-size: 8pt;" /> 
	</div>
	
	
	<%File files = new File("F://temp");
	if(files.isDirectory()) {
		String[] fn = files.list();
		for(int i=0; i<fn.length; i++) { %>
			<a href="${pageContext.request.contextPath}/servlet/DownServlet2?downfile=<%=fn[i]%>"><%=fn[i]%></a>
			<br>
		<%}
	}%>


</body>
</html>

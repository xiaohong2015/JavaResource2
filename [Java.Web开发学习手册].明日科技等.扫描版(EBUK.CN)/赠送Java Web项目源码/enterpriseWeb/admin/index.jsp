<%@ page contentType="text/html; charset=GBK" %>
<%@ page import="com.model.User" %>
<%@ page import="com.core.*" %>
<%
response.setHeader("Cache-Control","no-cache");
response.setHeader("Cache-Control","no-store");
response.setDateHeader("Expires",0);
response.setHeader("Pragma","no-cache");
if (!Crazyadept.UserIsOK(session,FinalConstants.STATUS_ADMIN)) {
	response.sendRedirect("../user_logon.jsp");
}
%>
<html>
<head>
<title>管理员控制台</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<frameset rows="*" cols="*,776,*" framespacing="1" frameborder="no" border="1" >
  <frame src="blank.jsp" name="blankFrame" scrolling="NO" noresize>
	<frameset rows="310,*" cols="*" framespacing="1" frameborder="no" border="1" >
	  <frame src="top.jsp" name="topFrame" scrolling="NO" noresize>
	  <frameset rows="*" cols="179,*" frameborder="no"  bordercolordark="#ffffff">
		<frame src="left.jsp" name="leftFrame" scrolling="NO" noresize>
		<frame src="main.jsp" name="mainFrame">
	  </frameset>
	</frameset>	
  <frame src="blank.jsp" name="blankFrame">	
</frameset>	
<noframes>
<body> </body>
</noframes>
</html>

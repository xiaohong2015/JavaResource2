<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<link href="css/style.css" type="text/css" rel="stylesheet">
<script src="js/validate.JS" language="javascript" type="text/javascript"></script>
<%@ taglib prefix="logic" uri="/WEB-INF/struts-logic.tld"%> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>新闻网后台-首页</title>
</head>

<body onLoad="clockon(bgclock);">

<jsp:include page="b_top.jsp"/>

<table width="918" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="100" align="right" valign="top" bgcolor="#FFFFFF">
<jsp:include page="b_left.jsp"/>
	</td>
    <td width="818" valign="top" background="images/b_right.jpg"><div align="center"><img src="images/b_mainPage.jpg" width="570" height="416">	</div></td>
  </tr>
</table>
<jsp:include page="b_botton.jsp"/>
</body>
</html>

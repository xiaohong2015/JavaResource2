<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>showCookie</title>
</head>
<link href="css/style.css" type="text/css" rel="stylesheet">
<body bgcolor="#669966"><div align="center"><br>
<form name="form1" method="post" action="writecookie">
  <input type="text" name="name">
  <input type="submit" name="sumbit" value="写入Cookie">
</form>


<form name="form4" method="post" action="showcookie">
 <input type="submit" name="sumbit" value="显示Cookie属性">
</form>
<%if(request.getAttribute("name")!=null){%>
<table width="299" border="1" cellpadding="0" cellspacing="0">
  <tr>
    <td width="108" height="20"><span class="word_white"><strong>Cookie名称</strong></span></td>
    <td width="185"><span class="word_white"><strong><%=request.getAttribute("name")%></strong></span></td>
  </tr>
  <tr>
    <td height="20"><span class="word_white"><strong>Cookie值</strong></span></td>
    <td><span class="word_white"><strong><%=request.getAttribute("value")%></strong></span></td>
  </tr>


</table>
<%}%>
</div>
</body>
</html>

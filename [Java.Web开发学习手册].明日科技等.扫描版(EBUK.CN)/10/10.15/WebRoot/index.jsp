<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>���ü���ʹ�������˻������¼</title>
</head>
<%

String login=(String)request.getAttribute("login");
if(login.equals("true")){
response.sendRedirect("show.htm");
}


%>
<body><div align="center">

 <table width="335" height="225">
   <tr>
     <td background="leftsearch.gif" align="center">
	  <form name="form1" method="post" action="show.htm">
   <input type="submit" name="Submit" value="��¼">
 </form>
	 
	 </td>
   </tr>
 </table>
</div>
</body>
</html>

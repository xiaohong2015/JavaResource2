<%@ page contentType="text/html; charset=GBK" language="java" %>
<%if(session.getAttribute("users")==null || "".equals(session.getAttribute("users"))){
	response.sendRedirect("index.jsp");
	
}
%>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<link href="css/css.css" rel="stylesheet" type="text/css">
<table width="1003" height="234" border="0" align="center" cellpadding="0" cellspacing="0" background="images/banner.jpg">
  <tr>
    <td align="center" class="text20">&nbsp;</td>
  </tr>
</table>

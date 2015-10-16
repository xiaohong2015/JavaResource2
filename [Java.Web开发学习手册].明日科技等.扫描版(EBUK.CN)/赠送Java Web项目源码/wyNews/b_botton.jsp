<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<%@ taglib prefix="logic" uri="/WEB-INF/struts-logic.tld"%>
<table width="100" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td><img src="images/b_bottom1.jpg" width="918" height="39"></td>
  </tr>
</table>


<table width="100" border="0" align="center" cellpadding="0" cellspacing="00">
  <tr>
    <td><img src="images/b_bottom.jpg" width="918" height="100"></td>
  </tr>
</table>
<logic:notPresent name="form" scope="session">
<script language='javascript'>alert('您已经与服务器断开，请重新登录');window.location.href='land_manager.jsp';</script>
</logic:notPresent>
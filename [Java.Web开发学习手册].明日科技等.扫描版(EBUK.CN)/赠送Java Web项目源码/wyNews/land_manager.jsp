<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ taglib prefix="html" uri="/WEB-INF/struts-html.tld"%>
<script src="js/validate.JS"></script>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="css/style.css" type="text/css" rel="stylesheet">
<title>新网网-后台登录页面</title>
<style type="text/css">
<!--
body {
	background-color: #d2d2d2;
}
-->
</style></head>

<body>
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td><table width="100" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td><img src="images/land_top.jpg" width="629" height="164"></td>
      </tr>
    </table>
      <table width="629" border="0" align="center" cellpadding="0" cellspacing="0">
	 
        <tr>
          <td width="271" valign="top" background="images/land_left.jpg"><table width="189" align="right">
		    <html:form action="managerAction.do?method=checkManagerAction" onsubmit="return checkEmpty(managerForm)">
            <tr>
              <td width="59" height="30"><font color="#FFFFFF">用户名：</font></td>
              <td width="118"><html:text property="account" title="请输入用户名"/></td>
            </tr>
            <tr>
              <td height="30"><font color="#FFFFFF">密&nbsp;&nbsp;码：</font></td>
              <td><html:password property="password" title="请输入密码"/></td>
            </tr>
            <tr>
              <td height="30" colspan="2"><html:submit style="background-image:url(images/land.gif);border:0;width:51;height:20" value="  "/>&nbsp;&nbsp;<html:reset style="background-image:url(images/reset.gif);border:0;width:52;height:20" value="  "/></td>
              </tr>
			    </html:form>
          </table></td>
          <td width="358"><img src="images/land_right.jpg" width="358" height="170"></td>
        </tr>
      </table></td>
  </tr>
</table>
</body>
</html>

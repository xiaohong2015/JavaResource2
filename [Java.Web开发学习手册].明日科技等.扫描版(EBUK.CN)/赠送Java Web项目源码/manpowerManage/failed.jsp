<%@ page contentType="text/html; charset=GBK" language="java" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>人力资源管理系统</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<link href="css/css.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.style2 {color: #BD1700}
-->
</style>
</head>
<body >
<table width="100%" height="615" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td align="center" height="100%"><table width="635" height="236" border="0" cellpadding="0" cellspacing="0" class="textB">
        <tr align="center">
          <td height="282" colspan="2" background="images/login_top.jpg" >&nbsp;</td>
        </tr>
        <tr align="center">
          <td width="18" height="120" background="images/login_left.jpg" class="tableBorder_lb" >&nbsp;</td>
          <td width="607" height="120" bgcolor="#FFFFFF" class="tableBorder_br">
		  	    <form name="usersForm" method="post" action="logon.do?action=logon">
		  
		  <table width="100%" height="31" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td height="31" colspan="4" align="center" >登录失败！</td>
          </tr>
        <tr>
          <td width="230" height="30" align="center" >用户名：<input name="username" type="text" class="input"></td>
          <td width="215" height="31" >密&nbsp;码：
            <input name="password" type="password" class="input" ></td>
          <td width="97" align="center" ><input type="image" name="imageField" src="images/login_btn.jpg"></td>
          <td width="76" ><a href="#" onClick="usersForm.reset();" class="link-red">[重写]</a></td>
        </tr>
          </table>
		  	    </form>
		  
		  </td>
        </tr>
    </table>
      <table width="635" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="135" height="50" align="right"><img src="images/logo_small.GIF" width="17" height="17"></td>
          <td width="500" align="left" class="word_green">&nbsp;&nbsp;吉林省明日科技有限公司&nbsp; 编程词典网：http://www.mrbccd.com</td>
        </tr>
      </table></td>
  </tr>
</table>
</body>
</html>
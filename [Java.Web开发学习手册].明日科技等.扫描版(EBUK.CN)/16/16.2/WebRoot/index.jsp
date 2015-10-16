<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title> 利用Ajax实现MVC模式</title>
<link href="Css/style.css" rel="stylesheet">
<script language="javascript" src="JS/fun.js"></script>
</head>

<body>

<table width="793" height="829" border="0" align="center" cellpadding="0" cellspacing="0" background="images/bg.jpg">
  <tr>
    <td valign="top"><table width="100%" height="309" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td width="3%" height="206">&nbsp;</td>
        <td width="20%">&nbsp;</td>
        <td width="77%">&nbsp;</td>
      </tr>
      <tr>
        <td height="103">&nbsp;</td>
        <td valign="top" id="login">
<form name="form1" action="" onSubmit="checkU(form1);return false">
			  <table width="100%"  border="0" cellpadding="0" cellspacing="0">
                <tr>
                  <td height="24">会员名
                    <input name="username" type="text" class="txt_grey" id="username" size="16"></td>
                </tr>
                <tr>
                  <td height="24">密&nbsp;&nbsp;码
                    <input name="PWD" type="password" class="txt_grey" id="PWD" size="16" onKeydown="if(event.keyCode==13) form1.submit();"></td>
                </tr>
                <tr>
                  <td height="31">
                    <input name="Button" type="button" class="btn_grey" value="注册">
                    &nbsp;
                    <input name="Submit2" type="submit" class="btn_grey" value="登录"> 
					<input name="Submit3" type="reset" class="btn_grey" value="重置"></td>
                </tr>
              </table>
		    </form>		
		</td>
        <td>&nbsp;</td>
      </tr>
    </table></td>
  </tr>
</table>
</body>
</html>

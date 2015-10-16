<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="css/style.css" rel="stylesheet" type="text/css">
<script language="javascript" type="">
function checkEmpty(){
if(document.form.name.value==""){
alert("请输入账号!!!")
document.form.name.focus();
return false;
}
if(document.form.password.value==""){
alert("请输入密码!!!")
document.form.password.focus();
return false;
}
}
</script>

<title>使用过滤器身份验证</title>
</head>

<body><div align="center">


<table width="333" height="285" cellpadding="0" cellspacing="0" background="image/background.jpg">
  <tr>
    <td align="center"><br>
	<form name="form" method="post" action="result.jsp" onSubmit="return checkEmpty()">
<table width="220"  border="0" align="center">
  <tr>
    <td width="59" height="25">用户名：</td>
    <td width="151" ><input name="name" type="text"></td>
  </tr>
  <tr>
    <td height="25">密&nbsp;&nbsp;码：</td>
    <td><input name="password" type="password"></td>
  </tr>
</table><br>

  <input type="submit" name="Submit" value="登录">
</form>


	</td>
  </tr>
</table>
</div>
</body>
</html>

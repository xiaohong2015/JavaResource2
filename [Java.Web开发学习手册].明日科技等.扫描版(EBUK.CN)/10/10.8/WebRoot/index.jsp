<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>利用JavaBean由Servlet向JSP传递数据</title>
<link href="css/style.css" rel="stylesheet" type="text/css">
</head>
<script language="javascript">
function checkEmpty(form){
for(i=0;i<form.length;i++){
if(form.elements[i].value==""){
alert("表单信息不能为空");
return false;
}
}
}
</script>

<body>
<div align="center">
  <table width="324" height="225" border="0" cellpadding="0" cellspacing="0">
    <tr align="center">
      <td background="back.jpg">
	  <br><br>利用JavaBean由Servlet向JSP传递数据
  <form name="form" method="post" action="passservlet" onSubmit="return checkEmpty(form)">
    <table width="268" border="1" cellpadding="0" cellspacing="0">
      <tr  align="center">
        <td width="63" height="30">姓名：</td>
        <td width="199"><input type="text" name="name"></td>
      </tr>
      <tr align="center">
        <td height="30">年龄：</td>
        <td><input type="text" name="age"></td>
      </tr>
      <tr align="center">
        <td height="30">性别：</td>
        <td><input type="text" name="sex"></td>
      </tr>
    </table><br>
    <input type="submit" name="Submit" value="提交">
  </form></td>
    </tr>
  </table>
</div>
</body>
</html>

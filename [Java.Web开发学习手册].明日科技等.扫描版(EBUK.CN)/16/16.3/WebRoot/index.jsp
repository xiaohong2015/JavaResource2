<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<html>
<head>
<title>检测用户名</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="CSS/style.css" rel="stylesheet">
<script language="javascript">
var http_request = false;
function createRequest(url) {
	//初始化对象并发出XMLHttpRequest请求
	http_request = false;
	if (window.XMLHttpRequest) { // Mozilla或其他除IE以外的浏览器
		http_request = new XMLHttpRequest();
		if (http_request.overrideMimeType) {
			http_request.overrideMimeType("text/xml");
		}
	} else if (window.ActiveXObject) { // IE浏览器
		try {
			http_request = new ActiveXObject("Msxml2.XMLHTTP");
		} catch (e) {
			try {
				http_request = new ActiveXObject("Microsoft.XMLHTTP");

		   } catch (e) {}
		}
	}
	if (!http_request) {
		alert("不能创建XMLHTTP实例!");
		return false;
	}
	http_request.onreadystatechange = alertContents;    //指定响应方法
	//发出HTTP请求
	http_request.open("GET", url, true);
	http_request.send(null);
}
function alertContents() {    //处理服务器返回的信息
	if (http_request.readyState == 4) {
		if (http_request.status == 200) {
			alert(http_request.responseText);
		} else {
			alert('您请求的页面发现错误');
		}
	}

}
</script>
<script language="javascript">
function checkName() {
	var username = form1.username.value;
	if(username=="") {
		window.alert("请添写用户名!");
		form1.username.focus();
		return false;
	}
	else {
		createRequest('checkName.jsp?username='+username);
	}
}
</script>
</head>
<body>
<table width="599"  border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="36" valign="top" bgcolor="#FFFFFF">&nbsp;</td>
    <td width="552" valign="top" bgcolor="#FFFFFF"><table width="100%"  border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td width="10" valign="top">&nbsp;</td>
          <td width="542" valign="top"><table width="100%" height="350"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td width="25" height="350" valign="top">&nbsp;</td>
              <td width="567" valign="top">
                <table width="100%"  border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="100%" height="5"></td>
                  </tr>
                  <tr valign="top">
                    <td height="41" background="Images/center_how.GIF"><table width="100%" height="29"  border="0" cellpadding="0" cellspacing="0">
                      <tr>
                        <td width="6%" height="7">&nbsp;</td>
                        <td width="94%">&nbsp;</td>
                      </tr>
                      <tr>
                        <td>&nbsp;</td>
                        <td>注册新用户</td>
                      </tr>
                    </table></td>
                  </tr>
                  <tr align="center" valign="top">
                    <td height="69">
				   <form name="form1" method="post" action="">
				     <table width="76%" height="295"  border="0" cellpadding="0" cellspacing="0">
                       <tr>
                         <td width="22%" align="center">用户名：</td>
                         <td width="78%"><input name="username" type="text" class="table" id="username">
                             <a href="#" onClick="checkName()">[检测用户名]</a>&nbsp;*</td>
                       </tr>
                       <tr>
                         <td align="center">密码：</td>
                         <td class="word"><input name="PWD1" type="password" class="table" id="PWD1">
                           *</td>
                       </tr>
                       <tr>
                         <td align="center">确认密码：</td>
                         <td class="word"><input name="PWD2" type="password" class="table" id="PWD2">
                           *</td>
                       </tr>
                       <tr>
                         <td align="center">生日：</td>
                         <td class="word"><input name="birthday" type="text" class="table" id="birthday">
                           （格式：1980-07-17）</td>
                       </tr>
                       <tr>
                         <td align="center">性别：</td>
                         <td><input name="sex" type="radio" value="男" checked>
                           男生　
                           <input type="radio" name="sex" value="女">
                           女生</td>
                       </tr>
                       <tr>
                         <td align="center">OICQ号码：</td>
                         <td><input name="OICQ" type="text" class="table" id="OICQ"></td>
                       </tr>
                       <tr>
                         <td align="center">个人主页：</td>
                         <td><input name="homepage" type="text" class="table" id="homepage" size="50"></td>
                       </tr>
                       <tr>
                         <td align="center">地址：</td>
                         <td><input name="address" type="text" class="table" id="address" size="50"></td>
                       </tr>
                       <tr>
                         <td align="center">邮政编码：</td>
                         <td><input name="postcode" type="text" class="table" id="postcode"></td>
                       </tr>
                       <tr>
                         <td align="center">Email：</td>
                         <td class="word"><input name="Email" type="text" class="table" id="Email" size="46">
                           *</td>
                       </tr>
                       <script language="javaScript">
		  function mycheck(){
		  	if(form1.username.value==""){
				alert("请输入用户名！");form1.username.focus();return;	}
			if(form1.PWD1.value==""){
				alert("请输入密码！");form1.PWD1.focus();return;}
		  	if(form1.PWD2.value==""){
				alert("请确认密码！");form1.PWD2.focus();return;}
		  	if(form1.PWD1.value!=form1.PWD2.value){
				alert("您两次输入的密码不一致，请重新输入！");
				form1.PWD1.value="";form1.PWD2.value="";form1.PWD1.focus();return;}
			if(form1.Email.value==""){
				alert("请输入Email地址！");form1.Email.focus();return;	}
			form1.submit();
		  }
		             </script>
                       <tr>
                         <td colspan="2" align="center"><input name="save" type="button" class="btn_grey" onClick="mycheck()" value="保存">
                              &nbsp;
                              <input name="re" type="reset" class="btn_grey" value="重置"></td>
                       </tr>
                     </table>
				   </form></td>
                  </tr>
                </table>
                </td>
            </tr>
          </table></td>
        </tr>
    </table></td>
    <td width="11" valign="top" bgcolor="#FFFFFF">&nbsp;</td>
  </tr>
</table>
</body>
</html>

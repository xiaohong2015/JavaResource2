<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<html>
<head>
<title>����û���</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="CSS/style.css" rel="stylesheet">
<script language="javascript">
var http_request = false;
function createRequest(url) {
	//��ʼ�����󲢷���XMLHttpRequest����
	http_request = false;
	if (window.XMLHttpRequest) { // Mozilla��������IE����������
		http_request = new XMLHttpRequest();
		if (http_request.overrideMimeType) {
			http_request.overrideMimeType("text/xml");
		}
	} else if (window.ActiveXObject) { // IE�����
		try {
			http_request = new ActiveXObject("Msxml2.XMLHTTP");
		} catch (e) {
			try {
				http_request = new ActiveXObject("Microsoft.XMLHTTP");

		   } catch (e) {}
		}
	}
	if (!http_request) {
		alert("���ܴ���XMLHTTPʵ��!");
		return false;
	}
	http_request.onreadystatechange = alertContents;    //ָ����Ӧ����
	//����HTTP����
	http_request.open("GET", url, true);
	http_request.send(null);
}
function alertContents() {    //������������ص���Ϣ
	if (http_request.readyState == 4) {
		if (http_request.status == 200) {
			alert(http_request.responseText);
		} else {
			alert('�������ҳ�淢�ִ���');
		}
	}

}
</script>
<script language="javascript">
function checkName() {
	var username = form1.username.value;
	if(username=="") {
		window.alert("����д�û���!");
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
                        <td>ע�����û�</td>
                      </tr>
                    </table></td>
                  </tr>
                  <tr align="center" valign="top">
                    <td height="69">
				   <form name="form1" method="post" action="">
				     <table width="76%" height="295"  border="0" cellpadding="0" cellspacing="0">
                       <tr>
                         <td width="22%" align="center">�û�����</td>
                         <td width="78%"><input name="username" type="text" class="table" id="username">
                             <a href="#" onClick="checkName()">[����û���]</a>&nbsp;*</td>
                       </tr>
                       <tr>
                         <td align="center">���룺</td>
                         <td class="word"><input name="PWD1" type="password" class="table" id="PWD1">
                           *</td>
                       </tr>
                       <tr>
                         <td align="center">ȷ�����룺</td>
                         <td class="word"><input name="PWD2" type="password" class="table" id="PWD2">
                           *</td>
                       </tr>
                       <tr>
                         <td align="center">���գ�</td>
                         <td class="word"><input name="birthday" type="text" class="table" id="birthday">
                           ����ʽ��1980-07-17��</td>
                       </tr>
                       <tr>
                         <td align="center">�Ա�</td>
                         <td><input name="sex" type="radio" value="��" checked>
                           ������
                           <input type="radio" name="sex" value="Ů">
                           Ů��</td>
                       </tr>
                       <tr>
                         <td align="center">OICQ���룺</td>
                         <td><input name="OICQ" type="text" class="table" id="OICQ"></td>
                       </tr>
                       <tr>
                         <td align="center">������ҳ��</td>
                         <td><input name="homepage" type="text" class="table" id="homepage" size="50"></td>
                       </tr>
                       <tr>
                         <td align="center">��ַ��</td>
                         <td><input name="address" type="text" class="table" id="address" size="50"></td>
                       </tr>
                       <tr>
                         <td align="center">�������룺</td>
                         <td><input name="postcode" type="text" class="table" id="postcode"></td>
                       </tr>
                       <tr>
                         <td align="center">Email��</td>
                         <td class="word"><input name="Email" type="text" class="table" id="Email" size="46">
                           *</td>
                       </tr>
                       <script language="javaScript">
		  function mycheck(){
		  	if(form1.username.value==""){
				alert("�������û�����");form1.username.focus();return;	}
			if(form1.PWD1.value==""){
				alert("���������룡");form1.PWD1.focus();return;}
		  	if(form1.PWD2.value==""){
				alert("��ȷ�����룡");form1.PWD2.focus();return;}
		  	if(form1.PWD1.value!=form1.PWD2.value){
				alert("��������������벻һ�£����������룡");
				form1.PWD1.value="";form1.PWD2.value="";form1.PWD1.focus();return;}
			if(form1.Email.value==""){
				alert("������Email��ַ��");form1.Email.focus();return;	}
			form1.submit();
		  }
		             </script>
                       <tr>
                         <td colspan="2" align="center"><input name="save" type="button" class="btn_grey" onClick="mycheck()" value="����">
                              &nbsp;
                              <input name="re" type="reset" class="btn_grey" value="����"></td>
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

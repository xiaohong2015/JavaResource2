<%@ page contentType="text/html; charset=GBK" language="java" %>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="com.bOS.bPRO_PersonManage.en.Users"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>������Դ����ϵͳ</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<link href="css/css.css" rel="stylesheet" type="text/css">
</head>
<script src="Js/js.js"></script>
<body>
<jsp:include page="top.jsp"/>
<table width="1003" border="0" align="center" cellpadding="0" cellspacing="0" bordercolorlight="#CCCCCC" bordercolordark="#FFFFFF"  >
  <tr>
    <td width="191" height="497" rowspan="2" valign="top" >&nbsp;</td>
    <td width="772" height="48" valign="top">
		<jsp:include page="navigation.jsp"/>
	
	</td>
    <td width="40" rowspan="2" valign="top">&nbsp;</td>
  </tr>
  <tr>
    <td height="249" valign="top">
	<table width="100%" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td height="431" valign="top" bgcolor="#C5DF7E">
<!------->		
		
   <br>
<table width="94%"  border="0" align="center" cellpadding="0" cellspacing="1" bordercolor="0" bordercolorlight="#CCCCCC" bordercolordark="#FFFFFF" bgcolor="#97B150" >
  <tr>
    <td height="22" colspan="2" align="center" class="word_yellow">-���Ա����Ϣ-</td>
  </tr>
  <form name="userForm" method="post" action="modifyuser.do?action=adduser" onSubmit="return userValidate();">
  <tr>
    <td width="33%" height="27" align="center" bgcolor="#E8FFA7" >Ա��������</td>
    <td height="27" align="left" bgcolor="#E8FFA7" ><input name="username" type="text" class="input"></td>
  </tr>
    <tr>
    <td width="33%" height="27" align="center" bgcolor="#E8FFA7" >�Ƿ����Ա��</td>
    <td width="67%" height="27" align="left" bgcolor="#E8FFA7" ><input name="isadminhelp" type="checkbox" onClick="javascript:adminChecked();" ></td>
	<input type="hidden"  name="isadmin" >
  </tr>
  <tr id="pwd" style="display:none">
    <td width="33%" height="27" align="center" bgcolor="#E8FFA7" >��¼���룺</td>
    <td height="27" align="left" bgcolor="#E8FFA7" ><input name="password" type="password" class="input"></td>
    </tr>
  <tr>
    <td width="33%" height="27" align="center" bgcolor="#E8FFA7" >��&nbsp;&nbsp;&nbsp;&nbsp;��</td>
    <td height="27" align="left" bgcolor="#E8FFA7" ><input name="sex" type="radio" value="1" checked>
      ��
        <input name="sex" type="radio" value="0">
      Ů</td>
  </tr>
  <tr>
    <td width="33%" height="27" align="center" bgcolor="#E8FFA7" >�������ڣ�</td>
    <td height="27" align="left" bgcolor="#E8FFA7" ><input name="birthday" type="text" class="input" ></td>
    </tr>
  <tr>
    <td height="27" align="center" bgcolor="#E8FFA7" >��Ա��飺</td>
    <td height="27" align="left" bgcolor="#E8FFA7" ><textarea name="content" cols="50" rows="6" class="input"></textarea></td>
  </tr>
  
  <tr>
    <td height="27" colspan="2" align="center" bgcolor="#E8FFA7" ><input name="Submit" type="submit" class="button" value="�ύ">
      &nbsp;&nbsp;
      <input name="Submit2" type="reset" class="button" value="����"></td>
  </tr>
  </form>
</table>		
		
<!-------------->		</td>
      </tr>
    </table>
    <jsp:include page="copyright.html"/></td>
  </tr>
</table>


</body>
</html>

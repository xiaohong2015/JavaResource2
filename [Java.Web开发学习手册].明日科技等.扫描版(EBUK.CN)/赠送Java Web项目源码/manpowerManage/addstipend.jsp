<%@ page contentType="text/html; charset=GBK" language="java" %>
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
<table width="94%" align="center" cellpadding="0" cellspacing="1" bordercolorlight="#CCCCCC" bordercolordark="#FFFFFF" bgcolor="#97B150" >
  <tr>
    <td height="22" colspan="4" align="center" ><strong class="word_yellow">-���н��-</strong></td>
  </tr>
  <form name="stipendForm" method="post" action="modifystipend.do?action=addstipend" onSubmit="return stipendValidate();" >
  <tr align="center">
    <td width="30%" height="27" bgcolor="#E8FFA7" >Ա��������</td>
    <td width="29%" height="27" align="left" bgcolor="#E8FFA7" ><input name="name" type="text" class="input"></td>
    <td width="18%" height="27" bgcolor="#E8FFA7" >����н��</td>
    <td width="23%" height="27" align="left" bgcolor="#E8FFA7" ><input type="text" name="basic" class="input"></td>
  </tr>
  <tr align="center">
    <td width="30%" height="27" bgcolor="#E8FFA7" >������</td>
    <td height="27" align="left" bgcolor="#E8FFA7" ><input type="text" name="eat" class="input"></td>
    <td height="27" bgcolor="#E8FFA7" >������</td>
    <td height="27" align="left" bgcolor="#E8FFA7" ><input type="text" name="house" class="input"></td>
  </tr>
  <tr align="center">
    <td width="30%" height="27" bgcolor="#E8FFA7" >ȫ�ڽ���</td>
    <td height="27" align="left" bgcolor="#E8FFA7" ><input type="text" name="duty" class="input"></td>
    <td height="27" bgcolor="#E8FFA7" >��˰��</td>
    <td height="27" align="left" bgcolor="#E8FFA7" ><input type="text" name="scot" class="input"></td>
  </tr>
  <tr align="center">
    <td width="30%" height="27" bgcolor="#E8FFA7" >���ⲹ����</td>
    <td height="27" align="left" bgcolor="#E8FFA7" ><input type="text" name="other" class="input"></td>
    <td height="27" align="center" bgcolor="#E8FFA7" >���</td>
    <td height="27" align="left" bgcolor="#E8FFA7" ><input type="text" name="punishment" class="input"></td>
  </tr>
  <tr align="center">
    <td width="30%" height="27" bgcolor="#E8FFA7" >����ʱ�䣺</td>
    <td height="27" align="left" bgcolor="#E8FFA7" ><input type="text" name="granttime" class="input"></td>
    <td height="27" colspan="2" align="left" bgcolor="#E8FFA7" >ע����Ǯ��λ��Ԫ/RMB��</td>
    </tr>
  <tr>
    <td height="27" colspan="4" align="center" bgcolor="#E8FFA7" ><input name="Submit" type="submit" class="button" value="�ύ">
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

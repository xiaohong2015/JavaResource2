<%@ page contentType="text/html; charset=GBK" language="java" %>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="com.bOS.bUtil.*"%>
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

<table width="94%"  border="0" align="center" cellpadding="0" cellspacing="1" bordercolorlight="#CCCCCC" bordercolordark="#FFFFFF" bgcolor="#97B150" >
  <tr>
    <td height="22" colspan="4" align="center" class="word_yellow" >-�޸�Ա����Ϣ-</td>
  </tr>
  <form name="userForm" method="post" action="modifyuser.do?action=updateuser" onSubmit="return userValidate_up();">
  <% Users u=(Users)request.getAttribute("user"); 
  	if(u!=null){
  %>
  <input type="hidden" name="id" value="<%=u.getId()%>">
  <tr>
    <td width="12%" height="22" align="center" bgcolor="#E8FFA7" >Ա��������</td>
    <td height="22" colspan="3" align="left" bgcolor="#E8FFA7" ><input name="username" type="text" class="input" value="<%=u.getUsername()%>" readonly="yes">
    ��ֻ����</td>
    </tr>
  <tr>
    <td width="12%" height="22" align="center" bgcolor="#E8FFA7" >�Ƿ����Ա��</td>
    <td height="22" colspan="3" align="left" bgcolor="#E8FFA7" ><input name="isadminhelp" type="checkbox" <%=new Byte("1").equals(u.getIsadmin())?"checked":""%> onClick="javascript:adminChecked();" value="<%=u.getIsadmin()%>"></td>
	<input type="hidden"  name="isadmin" value="<%=u.getIsadmin()%>">
  </tr>
  <tr id="pwd" <%if(u.getIsadmin()==0){%>style="display:none"<%}%>>
    <td width="12%" height="22" align="center" bgcolor="#E8FFA7" >���룺</td>
    <td width="28%" height="22" align="left" bgcolor="#E8FFA7" >ԭ���룺
      <input name="password_old" type="password" class="input" value=""></td>
    <td width="29%" align="left" bgcolor="#E8FFA7" >�����룺
      <input name="password" type="password" class="input" value=""></td>
    <td width="31%" align="left" bgcolor="#E8FFA7" >ȷ�������룺
      <input name="password_new" type="password" class="input" value="">
	<input type="hidden"  name="hpassword_old" value="<%=u.getPassword()%>">
	</td>
    </tr>
  <tr>
    <td width="12%" height="22" align="center" bgcolor="#E8FFA7" >��&nbsp;&nbsp;&nbsp;&nbsp;��</td>
    <td height="22" colspan="3" align="left" bgcolor="#E8FFA7" ><input name="sex" type="radio" value="1" <%=new Byte("1").equals(u.getSex())?"checked":""%>>
      ��
        <input name="sex" type="radio" value="0" <%=new Byte("1").equals(u.getSex())?"":"checked"%>>
      Ů</td>
  </tr>
  <tr>
    <td width="12%" height="22" align="center" bgcolor="#E8FFA7" >�������ڣ�</td>
    <td height="22" colspan="3" align="left" bgcolor="#E8FFA7" ><input name="birthday" type="text" class="input" value="<%=StringUtil.notNull(DateUtil.parseToString(u.getBirthday(),DateUtil.yyyyMMdd))%>"></td>
    </tr>
  <tr>
    <td height="22" align="center" bgcolor="#E8FFA7" >��Ա��飺</td>
    <td height="22" colspan="3" align="left" bgcolor="#E8FFA7" ><textarea name="content" cols="50" rows="6" class="input"><%=u.getContent()%></textarea></td>
  </tr>
  <%
  }else{
  %>
  <tr>
    <td height="22" colspan="4" align="center" bgcolor="#E8FFA7" >û�в鵽��Ա����Ϣ������</td>
    </tr>
  <%}%>
  <tr>
    <td height="22" colspan="4" align="center" bgcolor="#E8FFA7" ><input name="Submit" type="submit" class="button" value="�ύ">
      &nbsp;&nbsp;
      <input name="Submit2" type="reset" class="button" value="����">
      &nbsp;&nbsp;
      <input name="Submit3" type="button" class="button" value="����" onClick="history.back(-1);"></td>
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

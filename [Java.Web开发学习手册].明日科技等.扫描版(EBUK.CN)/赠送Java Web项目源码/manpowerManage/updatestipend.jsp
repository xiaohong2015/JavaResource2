<%@ page contentType="text/html; charset=GBK" language="java" %>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="com.bOS.bPRO_PersonManage.en.Stipend"%>
<%@ page import="com.bOS.bUtil.*"%>
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
    <td  height="22" colspan="4" align="center" class="word_yellow">-�޸�н��-</td>
  </tr>
  <%
  Stipend e=(Stipend)request.getAttribute("stipend");
  if(e!=null){
  %>
  <form name="stipendForm" method="post" action="modifystipend.do?action=updatestipend" onSubmit="return stipendValidate();" >
  <input type="hidden" name="id" value="<%=e.getId()%>">
  <tr align="center">
    <td height="27" bgcolor="#E8FFA7" >Ա��������</td>
    <td height="27" align="left" bgcolor="#E8FFA7" ><input name="name" type="text" class="input" value="<%=e.getName()%>"></td>
    <td height="27" bgcolor="#E8FFA7" >����н��</td>
    <td height="27" align="left" bgcolor="#E8FFA7" ><input name="basic" type="text" class="input" value="<%=e.getBasic()%>"></td>
  </tr>
  <tr align="center">
    <td height="27" bgcolor="#E8FFA7" >������</td>
    <td height="27" align="left" bgcolor="#E8FFA7" ><input name="eat" type="text" class="input" value="<%=e.getEat()%>"></td>
    <td height="27" bgcolor="#E8FFA7" >������</td>
    <td height="27" align="left" bgcolor="#E8FFA7" ><input name="house" type="text" class="input" value="<%=e.getHouse()%>"></td>
  </tr>
  <tr align="center">
    <td height="27" bgcolor="#E8FFA7" >ȫ�ڽ���</td>
    <td height="27" align="left" bgcolor="#E8FFA7" ><input name="duty" type="text" class="input" value="<%=e.getDuty()%>"></td>
    <td height="27" bgcolor="#E8FFA7" >��˰��</td>
    <td height="27" align="left" bgcolor="#E8FFA7" ><input name="scot" type="text" class="input" value="<%=e.getScot()%>"></td>
  </tr>
  <tr align="center">
    <td height="27" bgcolor="#E8FFA7" >���ⲹ����</td>
    <td height="27" align="left" bgcolor="#E8FFA7" ><input name="other" type="text" class="input" value="<%=e.getOther()%>"></td>
    <td height="27" align="center" bgcolor="#E8FFA7" >���</td>
    <td height="27" align="left" bgcolor="#E8FFA7" ><input name="punishment" type="text" class="input" value="<%=e.getPunishment()%>"></td>
  </tr>
  <tr align="center">
    <td height="27" bgcolor="#E8FFA7" >����ʱ�䣺</td>
    <td height="27" colspan="3" align="left" bgcolor="#E8FFA7" ><input name="granttime" type="text" class="input" value="<%=StringUtil.notNull(DateUtil.parseToString(e.getGranttime(),DateUtil.yyyyMMdd))%>"></td>
  </tr>
  <tr>
    <td height="27" colspan="4" align="center" bgcolor="#E8FFA7" ><input name="Submit" type="submit" class="button" value="�ύ">
      &nbsp;&nbsp;
      <input name="Submit2" type="reset" class="button" value="����">
      &nbsp;&nbsp;
      <input name="Submit3" type="button" class="button" value="����" onClick="history.back(-1);"></td>
  </tr>
  </form>
  <%}else{ %>
  <tr>
    <td height="27" colspan="4" align="center" bgcolor="#E8FFA7" >����Ϣ�����ڣ�����</td>
  </tr>
  <%}%>
</table>
		
		
<!-------------->		</td>
      </tr>
    </table>
    <jsp:include page="copyright.html"/></td>
  </tr>
</table>
</body>
</html>

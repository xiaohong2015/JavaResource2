<%@ page contentType="text/html; charset=GBK" language="java" %>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="com.bOS.bPRO_PersonManage.en.Job"%>
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
    <td height="22" colspan="4" align="center" class="word_yellow">-�޸�ӦƸ��Ϣ-</td>
  </tr>
  <form name="jobForm" method="post" action="modifyjob.do?action=updatejob" onSubmit="return jobValidate();" >
  <%
  Job j=(Job)request.getAttribute("job");
  if(j!=null){
  %>
  <input name="id" value="<%=j.getId()%>" type="hidden">
  <tr align="center">
    <td width="30%" height="27" bgcolor="#E8FFA7" >��&nbsp;&nbsp;&nbsp;&nbsp;����</td>
    <td width="29%" height="22" align="left" bgcolor="#E8FFA7" ><input name="name" type="text" class="input" value="<%=j.getName()%>"></td>
    <td width="18%" height="22" bgcolor="#E8FFA7" >��&nbsp;&nbsp;&nbsp;&nbsp;��</td>
    <td width="23%" height="22" align="left" bgcolor="#E8FFA7" ><input name="sex" type="radio" value="1" <%=new Byte("1").equals(j.getSex())?"checked":""%>>
      ��
        <input name="sex" type="radio" value="0" <%=new Byte("1").equals(j.getSex())?"":"checked"%>>
      Ů</td>
  </tr>
  <tr align="center">
    <td width="30%" height="27" bgcolor="#E8FFA7" >��&nbsp;&nbsp;&nbsp;&nbsp;�䣺</td>
    <td height="22" align="left" bgcolor="#E8FFA7" ><input type="text" name="age" class="input" value="<%=j.getAge()%>"></td>
    <td height="22" bgcolor="#E8FFA7" >ְ&nbsp;&nbsp;&nbsp;&nbsp;λ��</td>
    <td height="22" align="left" bgcolor="#E8FFA7" ><input name="job" type="text" class="input" value="<%=j.getJob()%>"></td>
  </tr>
  <tr align="center">
    <td width="30%" height="27" bgcolor="#E8FFA7" >��ѧרҵ��</td>
    <td height="22" align="left" bgcolor="#E8FFA7" ><input name="specialty" type="text" class="input" value="<%=j.getSpecialty()%>"></td>
    <td height="22" bgcolor="#E8FFA7" >�������飺</td>
    <td height="22" align="left" bgcolor="#E8FFA7" ><input name="experience" type="text" class="input" value="<%=j.getExperience()%>"></td>
  </tr>
  <tr align="center">
    <td width="30%" height="27" bgcolor="#E8FFA7" >ѧ&nbsp;&nbsp;&nbsp;&nbsp;����</td>
    <td height="22" align="left" bgcolor="#E8FFA7" ><input name="studyeffort" type="text" class="input" value="<%=j.getStudyeffort()%>"></td>
    <td height="22" bgcolor="#E8FFA7" >��ҵѧУ��</td>
    <td height="22" align="left" bgcolor="#E8FFA7" ><input name="school" type="text" class="input" value="<%=j.getSchool()%>"></td>
  </tr>
  <tr>
    <td width="30%" height="27" align="center" bgcolor="#E8FFA7" >��&nbsp;&nbsp;&nbsp;&nbsp;����</td>
    <td height="22" align="left" bgcolor="#E8FFA7" ><input name="tel" type="text" class="input" value="<%=j.getTel()%>"></td>
    <td height="22" align="center" bgcolor="#E8FFA7" >Email��</td>
    <td height="22" align="left" bgcolor="#E8FFA7" ><input name="email" type="text" class="input" value="<%=j.getEmail()%>"></td>
  </tr>
  <tr>
    <td width="30%" height="22" align="center" bgcolor="#E8FFA7" >��ϸ������</td>
    <td height="22" colspan="3" align="left" bgcolor="#E8FFA7" ><textarea name="content" cols="50" rows="6" class="input"><%=j.getContent()%></textarea></td>
    </tr>
  <%}else{ %>
  <tr>
    <td height="22" colspan="4" align="center" bgcolor="#E8FFA7" >����Ϣ�����ڣ�����</td>
  </tr>
  <%}%>
  <tr>
    <td height="27" colspan="4" align="center" bgcolor="#E8FFA7" ><input name="Submit" type="submit" class="button" value="�ύ">
      &nbsp;&nbsp;
      <input name="Submit2" type="reset" class="button" value="����">
      &nbsp;&nbsp; 
      <input name="Submit3" type="button" class="button" value="����" onClick="history.back(-1);"></td>
  </tr>
  </form>
  <tr>
    <td height="100%" colspan="4" align="center" bgcolor="#E8FFA7" >&nbsp;</td>
  </tr>
</table>	
		
<!-------------->		</td>
      </tr>
    </table>
    <jsp:include page="copyright.html"/></td>
  </tr>
</table>

</body>
</html>

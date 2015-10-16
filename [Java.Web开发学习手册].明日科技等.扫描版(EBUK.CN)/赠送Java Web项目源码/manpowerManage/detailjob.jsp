<%@ page contentType="text/html; charset=GBK" language="java" %>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="com.bOS.bPRO_PersonManage.en.Job"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>人力资源管理系统</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<link href="css/css.css" rel="stylesheet" type="text/css">
</head>
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
<table width="94%"  border="0" align="center" cellpadding="0" cellspacing="1" bordercolorlight="#CCCCCC" bordercolordark="#FFFFFF" bgcolor="#97B150" style="padding:5px;">
  <tr>
    <td height="22" colspan="4" align="center" ><strong class="word_yellow">-人才详细信息-</strong></td>
  </tr>
  <%
  Job j=(Job)request.getAttribute("job");
  if(j!=null){
  %>
  <tr align="center">
    <td width="30%" height="22" bgcolor="#E8FFA7" >姓&nbsp;&nbsp;&nbsp;&nbsp;名：</td>
    <td width="29%" height="22" align="left" bgcolor="#E8FFA7" ><%=j.getName()%></td>
    <td width="18%" height="22" bgcolor="#E8FFA7" >性&nbsp;&nbsp;&nbsp;&nbsp;别：</td>
    <td width="23%" height="22" align="left" bgcolor="#E8FFA7" ><%=new Byte("1").equals(j.getSex())?"男":"女"%></td>
  </tr>
  <tr align="center">
    <td width="30%" height="22" bgcolor="#E8FFA7" >年&nbsp;&nbsp;&nbsp;&nbsp;龄：</td>
    <td height="22" align="left" bgcolor="#E8FFA7" ><%=j.getAge()%></td>
    <td height="22" bgcolor="#E8FFA7" >职&nbsp;&nbsp;&nbsp;&nbsp;位：</td>
    <td height="22" align="left" bgcolor="#E8FFA7" ><%=j.getJob()%></td>
  </tr>
  <tr align="center">
    <td width="30%" height="22" bgcolor="#E8FFA7" >所学专业：</td>
    <td height="22" align="left" bgcolor="#E8FFA7" ><%=j.getSpecialty()%></td>
    <td height="22" bgcolor="#E8FFA7" >工作经验：</td>
    <td height="22" align="left" bgcolor="#E8FFA7" ><%=j.getExperience()%></td>
  </tr>
  <tr align="center">
    <td width="30%" height="22" bgcolor="#E8FFA7" >学&nbsp;&nbsp;&nbsp;&nbsp;历：</td>
    <td height="22" align="left" bgcolor="#E8FFA7" ><%=j.getStudyeffort()%></td>
    <td height="22" bgcolor="#E8FFA7" >毕业学校：</td>
    <td height="22" align="left" bgcolor="#E8FFA7" ><%=j.getSchool()%></td>
  </tr>
  <tr>
    <td width="30%" height="22" align="center" bgcolor="#E8FFA7" >电&nbsp;&nbsp;&nbsp;&nbsp;话：</td>
    <td height="22" align="left" bgcolor="#E8FFA7" ><%=j.getTel()%></td>
    <td height="22" align="center" bgcolor="#E8FFA7" >Email：</td>
    <td height="22" align="left" bgcolor="#E8FFA7" ><%=j.getEmail()%></td>
  </tr>
  <tr>
    <td width="30%" height="22" align="center" bgcolor="#E8FFA7" >详细经历：</td>
    <td height="22" colspan="3" align="left" bgcolor="#E8FFA7" ><%=j.getContent()%>&nbsp;</td>
  </tr>
  <tr>
    <td height="22" colspan="4" align="center" bgcolor="#E8FFA7" >
	<%if(j.getIsstock()!=null&&j.getIsstock().intValue()==0){%>
		<a href="updatejob.do?action=detailjob&id=<%=j.getId()%>">修改</a>&nbsp;&nbsp;
	<%}%><a href="#" onClick="javascript:history.back();">返回</a></td>
  </tr>
  <%}else{ %>
  <tr>
    <td height="22" colspan="4" align="center" bgcolor="#E8FFA7" >该信息不存在！！！</td>
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

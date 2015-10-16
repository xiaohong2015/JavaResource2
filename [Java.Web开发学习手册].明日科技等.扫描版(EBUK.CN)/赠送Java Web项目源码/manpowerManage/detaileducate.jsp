<%@ page contentType="text/html; charset=GBK" language="java" %>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="com.bOS.bPRO_PersonManage.en.Educate"%>
<%@ page import="com.bOS.bUtil.*"%>
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
<table width="94%"  border="0" align="center" cellpadding="0" cellspacing="1" bordercolorlight="#CCCCCC" bordercolordark="#FFFFFF" bgcolor="#97B150" style="padding:5pt;">
  <tr>
    <td height="22" colspan="4" align="center" ><strong class="word_yellow">
	-
	<%
	String educate=null;
	try{
		educate=request.getParameter("educate").toString();
	}catch(Exception e){
		educate="0";
	}
	if("1".equals(educate)){
		out.print("培训总结详细内容");
	  }else{
		out.print("培训详细计划");
	  }
	%>
	-</strong></td>
  </tr>
  <%
  Educate e=(Educate)request.getAttribute("educate");
  if(e!=null){
  %>
  <tr align="center">
    <td width="30%" height="22" bgcolor="#E8FFA7" >培训名称：</td>
    <td width="29%" height="22" align="left" bgcolor="#E8FFA7" ><%=e.getName()%></td>
    <td width="18%" height="22" bgcolor="#E8FFA7" >培训目的：</td>
    <td width="23%" height="22" align="left" bgcolor="#E8FFA7" ><%=e.getPurpose()%></td>
  </tr>
  <tr align="center">
    <td width="30%" height="22" bgcolor="#E8FFA7" >培训开始时间：</td>
    <td height="22" align="left" bgcolor="#E8FFA7" ><%=StringUtil.notNull(DateUtil.parseToString(e.getBegintime(),DateUtil.yyyyMMdd))%></td>
    <td height="22" bgcolor="#E8FFA7" >培训结束时间：</td>
    <td height="22" align="left" bgcolor="#E8FFA7" ><%=StringUtil.notNull(DateUtil.parseToString(e.getEndtime(),DateUtil.yyyyMMdd))%></td>
  </tr>
  <tr align="center">
    <td width="30%" height="22" bgcolor="#E8FFA7" >讲师：</td>
    <td height="22" align="left" bgcolor="#E8FFA7" ><%=e.getTeacher()%></td>
    <td height="22" bgcolor="#E8FFA7" >培训人员：</td>
    <td height="22" align="left" bgcolor="#E8FFA7" ><%=e.getStudent()%></td>
  </tr>
  <tr>
    <td width="30%" height="22" align="center" bgcolor="#E8FFA7" >培训材料：</td>
    <td height="22" colspan="3" align="left" bgcolor="#E8FFA7" ><%=e.getDatum()%>&nbsp;</td>
  </tr>
  <%if("1".equals(educate)){%>
  <tr>
    <td width="30%" height="22" align="center" bgcolor="#E8FFA7" >培训效果：</td>
    <td height="22" colspan="3" align="left" bgcolor="#E8FFA7" ><%=StringUtil.notNull(e.getEffect())%>&nbsp;</td>
  </tr>
  <tr>
    <td width="30%" height="22" align="center" bgcolor="#E8FFA7" >培训总结：</td>
    <td height="22" colspan="3" align="left" bgcolor="#E8FFA7" ><%=StringUtil.notNull(e.getSummarize())%>&nbsp;</td>
  </tr>
  <%}%>
  <tr>
    <td height="22" colspan="4" align="center" bgcolor="#E8FFA7" ><%if(!"1".equals(educate)){%><a href="updateeducate.do?action=detaileducate&id=<%=e.getId()%>">修改</a>&nbsp;&nbsp;<%}%><a href="#" onClick="javascript:history.back();">返回</a></td>
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

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
    <td height="22" colspan="4" align="center" class="word_yellow">-
	  <%
	String educate=null;
	try{
		educate=request.getParameter("educate").toString();
	}catch(Exception e){
		educate="0";
	}
	if("1".equals(educate)){
		out.print("培训总结");
	  }else{
		out.print("修改培训计划");
	  }
	%>
	-</td>
  </tr>
  <%
  Educate e=(Educate)request.getAttribute("educate");
  if(e!=null){
  %>
  <form name="educateForm" method="post" action="modifyeducate.do?action=updateeducate" onSubmit="return educateValidate();">
  <input type="hidden" name="id" value="<%=e.getId()%>">
  <input type="hidden" name="educate" value="<%=educate%>">
  <tr align="center">
    <td width="30%" height="22" bgcolor="#E8FFA7" >培训名称：</td>
    <td width="29%" height="22" align="left" bgcolor="#E8FFA7" ><input name="name" type="text" class="input" value="<%=e.getName()%>" <%=("1".equals(educate))?"disabled":""%>></td>
    <td width="18%" height="22" bgcolor="#E8FFA7" >培训目的：</td>
    <td width="23%" height="22" align="left" bgcolor="#E8FFA7" ><input name="purpose" type="text" class="input" value="<%=e.getPurpose()%>" <%=("1".equals(educate))?"disabled":""%>></td>
  </tr>
  <tr align="center">
    <td width="30%" height="22" bgcolor="#E8FFA7" >培训开始时间：</td>
    <td height="22" align="left" bgcolor="#E8FFA7" ><input name="begintime" type="text" class="input" <%=("1".equals(educate))?"disabled":""%> value="<%=StringUtil.notNull(DateUtil.parseToString(e.getBegintime(),DateUtil.yyyyMMdd))%>"></td>
    <td height="22" bgcolor="#E8FFA7" >培训结束时间：</td>
    <td height="22" align="left" bgcolor="#E8FFA7" ><input name="endtime" type="text" class="input" <%=("1".equals(educate))?"disabled":""%> value="<%=StringUtil.notNull(DateUtil.parseToString(e.getEndtime(),DateUtil.yyyyMMdd))%>"></td>
  </tr>
  <tr align="center">
    <td width="30%" height="22" bgcolor="#E8FFA7" >讲师：</td>
    <td height="22" align="left" bgcolor="#E8FFA7" ><input name="teacher" type="text" class="input" <%="1".equals(educate)?"disabled":""%> value="<%=e.getTeacher()%>"></td>
    <td height="22" bgcolor="#E8FFA7" >培训人员：</td>
    <td height="22" align="left" bgcolor="#E8FFA7" ><input name="student" type="text" class="input" <%="1".equals(educate)?"disabled":""%> value="<%=e.getStudent()%>"></td>
  </tr>
  <tr>
    <td width="30%" height="22" align="center" bgcolor="#E8FFA7" >培训材料：</td>
    <td height="22" colspan="3" align="left" bgcolor="#E8FFA7" ><textarea name="datum" cols="50" rows="6" class="input" <%="1".equals(educate)?"disabled":""%>><%=e.getDatum()%></textarea></td>
  </tr>
  <%if("1".equals(educate)){%>
  <tr align="center">
    <td width="30%" height="22" bgcolor="#E8FFA7" >培训效果：</td>
    <td height="22" colspan="3" align="left" bgcolor="#E8FFA7" ><input name="effect" type="text"  class="input" value="<%=StringUtil.notNull(e.getEffect())%>" size="50"></td>
  </tr>
  <tr align="center">
    <td width="30%" height="22" bgcolor="#E8FFA7" >培训总结：</td>
    <td height="22" colspan="3" align="left" bgcolor="#E8FFA7" ><textarea name="summarize" cols="50" rows="6"  class="input"><%=StringUtil.notNull(e.getSummarize())%></textarea></td>
  </tr>
  <%}%>
  <tr>
    <td height="22" colspan="4" align="center" bgcolor="#E8FFA7" ><input name="Submit" type="submit" class="button" value="提交">
      &nbsp;&nbsp;
      <input name="Submit2" type="reset" class="button" value="重置">
      &nbsp;&nbsp;
      <input name="Submit3" type="button" class="button" value="返回" onClick="history.back(-1);"></td>
  </tr>
  </form>
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

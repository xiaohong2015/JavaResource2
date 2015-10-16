<%@ page contentType="text/html; charset=GBK" language="java" %>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="com.bOS.bPRO_PersonManage.en.Institution"%>
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
    <td height="22" colspan="2" align="center" class="word_yellow">-修改奖惩登记-</td>
  </tr>
  <%
  Institution e=(Institution)request.getAttribute("institution");
  if(e!=null){
  %>
  <form name="institutionForm" method="post" action="modifyinstitution.do?action=updateinstitution" onSubmit="return institutionValidate()">
  <input type="hidden" name="id" value="<%=e.getId()%>">
  <tr align="center">
    <td width="30%" height="22" bgcolor="#E8FFA7" >奖惩名称：</td>
    <td height="22" align="left" bgcolor="#E8FFA7" ><input name="name" type="text" class="input" value="<%=e.getName()%>"></td>
    </tr>
  <tr align="center">
    <td width="30%" height="22" bgcolor="#E8FFA7" >奖惩原因：</td>
    <td height="22" align="left" bgcolor="#E8FFA7" ><input name="reason" type="text" class="input" value="<%=e.getReason()%>"></td>
    </tr>
  <tr align="center">
    <td width="30%" height="22" bgcolor="#E8FFA7" >奖惩说明：</td>
    <td height="22" align="left" bgcolor="#E8FFA7" ><textarea name="explain" cols="50" rows="6" class="input"><%=e.getExplain()%></textarea></td>
    </tr>
  <tr>
    <td height="22" colspan="2" align="center" bgcolor="#E8FFA7" ><input name="Submit" type="submit" class="button" value="提交">
      &nbsp;&nbsp;
      <input name="Submit2" type="reset" class="button" value="重置">
      &nbsp;&nbsp;
      <input name="Submit3" type="button" class="button" value="返回" onClick="history.back(-1);"></td>
  </tr>
  </form>
  <%}else{ %>
  <tr>
    <td height="22" colspan="2" align="center" bgcolor="#E8FFA7" >该信息不存在！！！</td>
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

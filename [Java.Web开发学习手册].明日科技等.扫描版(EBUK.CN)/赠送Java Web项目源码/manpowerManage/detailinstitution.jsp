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
    <td height="22" colspan="2" align="center" class="word_yellow">-奖惩制度详细信息-</td>
  </tr>
  <%
  Institution e=(Institution)request.getAttribute("institution");
  if(e!=null){
  %>
  <tr align="center">
    <td width="30%" height="22" bgcolor="#E8FFA7" >奖惩名称：</td>
    <td height="22" align="left" bgcolor="#E8FFA7" ><%=e.getName()%></td>
  </tr>
  <tr align="center">
    <td width="30%" height="22" bgcolor="#E8FFA7" >奖惩原因：</td>
    <td height="22" align="left" bgcolor="#E8FFA7" ><%=e.getReason()%></td>
  </tr>
  <tr align="center">
    <td width="30%" height="75" bgcolor="#E8FFA7" >奖惩说明：</td>
    <td height="75" align="left" valign="top" bgcolor="#E8FFA7" ><%=e.getExplain()%>&nbsp;</td>
  </tr>
  <tr>
    <td height="22" colspan="2" align="center" bgcolor="#E8FFA7" ><a href="updateinstitution.do?action=detailinstitution&id=<%=e.getId()%>">修改</a>&nbsp;&nbsp;<a href="#" onClick="javascript:history.back();">返回</a></td>
  </tr>
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

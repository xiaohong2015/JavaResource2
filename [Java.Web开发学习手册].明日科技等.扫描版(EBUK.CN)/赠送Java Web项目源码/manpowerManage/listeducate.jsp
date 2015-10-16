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
   <table width="94%"  border="0" align="center" cellpadding="0" cellspacing="1" bordercolor="#FFFFFF" bordercolorlight="#CCCCCC" bordercolordark="#FFFFFF" bgcolor="#97B14E" >
  <tr>
    <td height="22" colspan="6" align="center" bgcolor="#97B150" class="word_yellow">-
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
		out.print("培训计划");
	  }
	%>
	-</td>
  </tr>
  <tr class="tdhui">
    <td height="22" align="center" bgcolor="#E8FFA7" >培训名称</td>
    <td height="22" align="center" bgcolor="#E8FFA7" >讲师</td>
    <td height="22" align="center" bgcolor="#E8FFA7" >培训人员</td>
    <td height="22" align="center" bgcolor="#E8FFA7" >开始时间</td>
    <td height="22" align="center" bgcolor="#E8FFA7" >结束时间</td>
    <td height="22" align="center" bgcolor="#E8FFA7" >执行操作</td>
  </tr>
  <% List list=(List)request.getAttribute("list");
  	 if(list!=null&&list.size()>0){
	    Iterator it = list.iterator();
           while (it.hasNext()) {
                    Educate j = (Educate) it.next();

  %>
  <tr>
    <td height="22" align="center" bgcolor="#FFFFFF" ><%=j.getName()%></td>
    <td height="22" align="center" bgcolor="#FFFFFF" ><%=j.getTeacher()%></td>
    <td height="22" align="center" bgcolor="#FFFFFF" ><%=j.getStudent()%></td>
    <td height="22" align="center" bgcolor="#FFFFFF" ><%=StringUtil.notNull(DateUtil.parseToString(j.getBegintime(),DateUtil.yyyyMMdd))%></td>
    <td height="22" align="center" bgcolor="#FFFFFF" ><%=StringUtil.notNull(DateUtil.parseToString(j.getEndtime(),DateUtil.yyyyMMdd))%></td>
    <td height="22" align="center" bgcolor="#FFFFFF" ><a href="detaileducate.do?educate=<%=educate%>&action=detaileducate&id=<%=j.getId()%>">详细</a>&nbsp;&nbsp;<a href="modifyeducate.do?action=deleteeducate&educate=<%=educate%>&id=<%=j.getId()%>">删除</a>
      <%if(!"1".equals(educate)){%>&nbsp;&nbsp;<a href="updateeducate.do?educate=1&action=detaileducate&id=<%=j.getId()%>">培训完成</a><%}%></td>
  </tr>
  <%		}
   }else{
  %>
  <tr>
    <td height="22" colspan="6" align="center" bgcolor="#E8FFA7" >对不起，没有信息！！！</td>
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

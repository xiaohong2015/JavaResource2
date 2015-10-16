<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@page import="java.util.List"%>
<%@page import="com.actionForm.SortForm;"%>
<script src="js/validate.JS" language="javascript" type="text/javascript"></script>
<jsp:useBean id="objectDao" scope="request" class="com.dao.ObjectDao"/>

<html>


<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="css/style.css" type="text/css" rel="stylesheet">
<title>宇晨新闻网--新闻关键字查询</title>
</head>
<body onLoad="clockon(bgclock);">
<jsp:include page="f_top.jsp"/>
<table width="800" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="230" height="214" rowspan="2" valign="top">
	<jsp:include page="f_left.jsp"></jsp:include>
	  
   </td>
    <td width="570" height="787" valign="top" background="images/f_background.jpg">
      <img src="images/f_reach.jpg" width="586" height="136">
      <table width="533" align="center">
        <tr>
          <td height="26" bgcolor="7D7D7D" align="center"><font color="#FFFFFF"><b>| </b>新闻关键字查询</font></td>
        </tr>
      </table><br>
	
	<% List list=(List)request.getAttribute("list");
	for(int i=0;i<list.size();i++){
         com.actionForm.NewsForm form=(com.actionForm.NewsForm)list.get(i);
         String hql="from SortForm where id = '"+form.getSortId()+"'";
         SortForm sortForm=(SortForm)objectDao.queryFrom(hql);
         String fileroad="newsContent/"+form.getShowNews();
         
  %>
	 <table width="496" align="center" cellpadding="0" cellspacing="0">
       <tr>
         <td width="255" height="20"><a href="#" onclick="javasrcipt:window.open('<%=fileroad%>','','fullscreen=0,scrollbars=0');"><%=form.getTitle()%></a></td>
         <td width="85"><b>[<%=sortForm.getSmallSort()%>]</b></td>
         <td width="62">  <%if(form.getCreateTime().equals(com.tools.TimeShow.cuttentMonthDate())){%>
              <img src="images/new.gif"><%}else{%>
               <%=form.getCreateTime()%>
             <%}%></td>
       </tr>
     </table>
	 <table width="496" height="5" align="center" cellpadding="0" cellspacing="0">
       <tr>
         <td height="15"><hr></td>
       </tr>
     </table>
	 <%}%>    </td>
  </tr>
  <tr>
    <td valign="top" background="images/f_background.jpg"><img src="images/f_background1.jpg" width="586" height="19"></td>
  </tr>
</table>
<jsp:include page="f_botton.jsp"></jsp:include>
</body>
</html>

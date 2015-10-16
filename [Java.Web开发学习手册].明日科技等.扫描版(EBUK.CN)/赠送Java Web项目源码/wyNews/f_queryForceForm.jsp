<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@page import="java.util.List"%>
<%@page import="com.actionForm.ForceForm;"%>
<script src="js/validate.JS" language="javascript" type="text/javascript"></script>
<jsp:useBean id="objectDao" scope="request" class="com.dao.ObjectDao"/>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="css/style.css" type="text/css" rel="stylesheet">
<title>宇晨新闻网--焦点导读详细查询</title>
</head>

<%
ForceForm form=(ForceForm)request.getAttribute("form");
%>
<body onLoad="clockon(bgclock);">
<jsp:include page="f_top.jsp"/>

<table width="800" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="214" height="214" rowspan="2" valign="top"><jsp:include page="f_left.jsp"/></td>
    <td width="586" height="787" valign="top" background="images/f_background.jpg">	
	
	  <img src="images/f_force.jpg" width="586" height="127">
<table width="533" align="center">
        <tr>
          <td height="26" bgcolor="7D7D7D" align="center"><font color="#FFFFFF"><b>| </b><%=form.getTitle()%></font></td>
        </tr>
      </table><br>
	  
	    <table width="480" border="0" align="center" cellpadding="0" cellspacing="0">
     
         <tr>
           <td valign="top">          &nbsp;  &nbsp;     &nbsp;<%=form.getContent()%></td>
          </tr>
	      <tr>
           <td height="30" valign="middle" align="right"><%=form.getCreateTime()%></td>
          </tr>
      </table>
    
       <table width="480" border="0" align="center" cellpadding="0" cellspacing="0">
         <tr>
           <td height="33" align="right">
		   <a href="#" onClick="javasrcipt:history.go(-1);">返回</a>&nbsp;&nbsp;
          </td>
         </tr>
    </table>   </td>
  </tr>
  <tr>
    <td valign="top" background="images/f_background.jpg"><img src="images/f_background1.jpg" width="586" height="19"></td>
  </tr>
</table>
<jsp:include page="f_botton.jsp"></jsp:include>
</body>
</html>

<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@page import="java.util.List"%>
<%@page import="com.actionForm.ForceForm;"%>
<script src="js/validate.JS" language="javascript" type="text/javascript"></script>
<jsp:useBean id="objectDao" scope="request" class="com.dao.ObjectDao"/>
<jsp:useBean id="time" scope="request" class="com.tools.TimeShow"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="css/style.css" type="text/css" rel="stylesheet">
<title>宇晨新闻网--焦点导读全部查询</title>
</head>

<%
List list=(List)request.getAttribute("list");
int number=list.size();
//以下这段代码是计算多少页数
int pageNumber=number;
if(pageNumber%16==0){
pageNumber=pageNumber/16;
}else{
pageNumber=pageNumber/16+1;
}
//以下是计算当前页的页数
int count;
if(request.getParameter("count")==null){
count=0;
}else{
count=Integer.valueOf(request.getParameter("count"));
}
//以下显示多少条纪录
int start=count*16;//开始条数
int over=(count+1)*16;//结束条数
int lastCount=number-over;//还剩多少条记录
 if(lastCount<=0){
  over=number;
  }
%>
<body onLoad="clockon(bgclock);">
<jsp:include page="f_top.jsp"/>
<table width="800" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="230" height="214" rowspan="2" valign="top">
	<jsp:include page="f_left.jsp"></jsp:include>
	  
   </td>
    <td width="570" height="787" valign="top" background="images/f_background.jpg">
      <img src="images/f_force.jpg" width="586" height="127">
      <table width="533" align="center">
        <tr>
          <td height="26" bgcolor="7D7D7D" align="center"><font color="#FFFFFF"><b>| </b>焦点导读全部查看</font></td>
        </tr>
      </table><br>
	    <%
  for(int i=start;i<over;i++){
  ForceForm form=(ForceForm)list.get(i);
  %>
	    <table width="404" cellpadding="0" cellspacing="0" align="center">
       <tr valign="bottom">
         <td width="20" height="20" valign="middle" ></td>
    <td><a href="forceAction.do?method=queryForceOneAction&id=<%=form.getId()%>"><%=form.getTitle()%></a></td>

         <td width="154">     <%=form.getCreateTime()%>&nbsp;&nbsp;<%if(form.getCreateTime().equals(time.cuttentMonthDate())){%>
          <img src="images/new.gif"><%}%>       </td>
       </tr>
	      <tr>
         <td height="5" colspan="3"><hr>        </td>
    </tr>
     </table>
	
	    <%}%>
	 <table width="87%" border="0" align="center" cellpadding="0" cellspacing="0">
         <tr align="center">
           <td width="578" height="37" >
             <%for(int i=0;i<pageNumber;i++){%>
             <%if(count==i){%>
             [<font color="#FF0000"><b><%=i+1%></b></font>]
             <%}else{%>
    [<a href="forceAction.do?method=queryForceAction&count=<%=i%>"><b><%=i+1%></b></a>]
      <%}}%></td>
         </tr>
    </table>    </td>
  </tr>
  <tr>
    <td valign="top" background="images/f_background.jpg"><img src="images/f_background1.jpg" width="586" height="19"></td>
  </tr>
</table>
<jsp:include page="f_botton.jsp"></jsp:include>
</body>
</html>

<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@page import="java.util.List"%>
<%@page import="com.actionForm.SortForm;"%>
<script src="js/validate.JS" language="javascript" type="text/javascript"></script>
<jsp:useBean id="objectDao" scope="request" class="com.dao.ObjectDao"/>
<jsp:useBean id="time" scope="request" class="com.tools.TimeShow"/>
<html>


<%
String photo=request.getParameter("photo");
String sign=request.getParameter("sign");
sign=new String(sign.getBytes("ISO8859_1"),"gb2312");


/*************************************************************************/
int pageShow=17;
List list=(List)request.getAttribute("list");
int number=list.size();
//以下这段代码是计算多少页数
int pageNumber=number;
if(pageNumber%pageShow==0){
pageNumber=pageNumber/pageShow;
}else{
pageNumber=pageNumber/pageShow+1;
}
//以下是计算当前页的页数
int count;
if(request.getParameter("count")==null){
count=0;
}else{
count=Integer.valueOf(request.getParameter("count"));
}
//以下显示多少条纪录
int start=count*pageShow;//开始条数
int over=(count+1)*pageShow;//结束条数
int lastCount=number-over;//还剩多少条记录
 if(lastCount<=0){
  over=number;
  }
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="css/style.css" type="text/css" rel="stylesheet">
<title>宇晨新闻网--<%=sign%>查询</title>
</head>
<body onLoad="clockon(bgclock);">
<jsp:include page="f_top.jsp"/>
<table width="800" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="230" height="214" rowspan="2" valign="top">
	<jsp:include page="f_left.jsp"></jsp:include>
	  
   </td>
    <td width="570" height="787" valign="top" background="images/f_background.jpg">
      <img src="images/<%=photo%>">
      <table width="533" align="center">
        <tr>
          <td height="26" bgcolor="7D7D7D" align="center"><font color="#FFFFFF"><b>| </b><%=sign%>查询</font></td>
        </tr>
      </table><br>
	
	<%  for(int i=start;i<over;i++){
         com.actionForm.NewsForm form=(com.actionForm.NewsForm)list.get(i);
         String hql="from SortForm where id = '"+form.getSortId()+"'";
         SortForm sortForm=(SortForm)objectDao.queryFrom(hql);
         String fileroad="newsContent/"+form.getShowNews();
  
         
  %>
	 <table width="496" align="center" cellpadding="0" cellspacing="0">
       <tr>
         <td width="291" height="20">
         <a href="#" onclick="javasrcipt:window.open('<%=fileroad%>','','fullscreen=0,scrollbars=0');"><%=form.getTitle()%></a>
         
         
         
         
         </td>
         
         <td width="106"><b>[<%=sortForm.getSmallSort()%>]</b></td>
         <td width="97">  <%if(form.getCreateTime().equals(time.cuttentMonthDate())){%>
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
	 <%}%>
	 <table width="404" border="0" align="center" cellpadding="0" cellspacing="0">
         <tr align="center">
           <td width="578" height="37" >
             <%for(int i=0;i<pageNumber;i++){%>
             <%if(count==i){%>
             [<font color="#FF0000"><b><%=i+1%></b></font>]
             <%}else{%>
      [<a href="newsAction.do?method=front_queryNewsAction&sign=<%=sign%>&photo=<%=photo%>&count=<%=i%>"><b><%=i+1%></b></a>]
      <%}}%></td>
         </tr>
      </table> 
	
	
	</td>
  </tr>
  <tr>
    <td valign="top" background="images/f_background.jpg"><img src="images/f_background1.jpg" width="586" height="19"></td>
  </tr>
</table>
<jsp:include page="f_botton.jsp"></jsp:include>
</body>
</html>

<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<jsp:directive.page import="com.actionForm.NewsForm"/>
<jsp:directive.page import="com.dao.ObjectDao"/>
<jsp:directive.page import="com.tools.TimeShow"/>
<jsp:directive.page import="com.actionForm.SortForm"/>
<script src="js/validate.JS" language="javascript" type="text/javascript"></script>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="css/style.css" type="text/css" rel="stylesheet">
<title>宇晨新闻网--首页</title>
</head>
<%
ObjectDao objectDao=new ObjectDao();
String typeNews=null;
String hql="";
java.util.List list=null;
NewsForm newsForm=null;
int overnumber=4;
%>
<body onLoad="clockon(bgclock);">
<jsp:include page="f_top.jsp"></jsp:include>
<table width="800" height="815" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="214" height="214" rowspan="5" valign="top">
	<jsp:include page="f_left.jsp"/>

</td>
    <td colspan="2" valign="top"><table width="100" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td><img src="images/f_right1.jpg" width="586" height="15"></td>
  </tr>
</table>
   
    </td>
  </tr>
  <tr>
    <td width="295" valign="top">
    
    
    
    
    
    <table width="282" height="215" border="0" align="center" cellpadding="0" cellspacing="0" background="images/f_right2.jpg">
      <tr>
        <td width="25" height="98" valign="top"><br>
        </td>
        <td valign="top">
        <%
        typeNews="科学教育";
        hql="from NewsForm where bigSort = '"+typeNews+"' order by id desc";
        list=objectDao.queryList(hql);
            if(list.size()<5){
            overnumber=list.size();
        }        
        %>
          <table width="230">
            <tr>
              <td width="27" height="26">&nbsp;</td>
              <td width="191"><%=typeNews%></td>
            </tr>
        </table><br>
          <table width="230" border="0" cellpadding="0" cellspacing="0">
          <%
          for(int i=0;i<overnumber;i++){
              newsForm=(NewsForm)list.get(i);
              String fileroad="newsContent/"+newsForm.getShowNews();
              hql="from SortForm where id='"+newsForm.getSortId()+"'";
              SortForm sortForm=(SortForm)objectDao.queryFrom(hql);
              %>
            <tr>
              <td width="230" height="28">
              <a href="#" onclick="javasrcipt:window.open('<%=fileroad%>','','fullscreen=0,scrollbars=0');"><%=newsForm.getTitle()%></a>
             &#8212; <%=sortForm.getSmallSort() %>
               <%if(newsForm.getCreateTime().equals(TimeShow.cuttentMonthDate())){%>
              <img src="images/new.gif"><%}%>
              <hr></td>
            </tr> 
            <%}%>      
		  </table>
		  
		    <table width="230" border="0" cellpadding="0" cellspacing="0">
		     <tr>
			 <td height="29">
               <div align="right"><a href="newsAction.do?method=front_queryNewsAction&photo=f_scienceNews.jpg&sign=<%=typeNews%>" class="a7">更多内容>>></a></div>            </td></tr>
		   </table>
		  </td>
      </tr>
    </table>
    
    
    
    
    
    
    
    
    
    
    </td>
    <td width="291" valign="top"><table width="282" height="215" border="0" align="right" cellpadding="0" cellspacing="0" background="images/f_right2.jpg">
      <tr>
        <td width="25" height="98" valign="top"><br>
        </td>
        <td valign="top">
           <%
        typeNews="法制教育";
        hql="from NewsForm where bigSort = '"+typeNews+"' order by id desc";
        list=objectDao.queryList(hql);
        overnumber=4;
        if(list.size()<5){
            overnumber=list.size();
        }        
        %>
          <table width="230">
            <tr>
              <td width="27" height="26">&nbsp;</td>
              <td width="191"><%=typeNews%></td>
            </tr>
        </table><br>
          <table width="230" border="0" cellpadding="0" cellspacing="0">
          <%
          for(int i=0;i<overnumber;i++){
              newsForm=(NewsForm)list.get(i);
              String fileroad="newsContent/"+newsForm.getShowNews();
              hql="from SortForm where id='"+newsForm.getSortId()+"'";
              SortForm sortForm=(SortForm)objectDao.queryFrom(hql);
              %>
            <tr>
              <td width="230" height="28">
              <a href="#" onclick="javasrcipt:window.open('<%=fileroad%>','','fullscreen=0,scrollbars=0');"><%=newsForm.getTitle()%></a>
             &#8212; <%=sortForm.getSmallSort() %>
               <%if(newsForm.getCreateTime().equals(TimeShow.cuttentMonthDate())){%>
              <img src="images/new.gif"><%}%>
              <hr></td>
            </tr> 
            <%}%>      
		  </table>
		  
		    <table width="230" border="0" cellpadding="0" cellspacing="0">
		     <tr>
			 <td height="29">
               <div align="right"><a href="newsAction.do?method=front_queryNewsAction&photo=f_lawNews.jpg&sign=<%=typeNews%>" class="a7">更多内容>>></a></div>            </td></tr>
		   </table>
		   
		   
		   
		   </td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="113" valign="top"><table width="282" height="215" border="0" align="center" cellpadding="0" cellspacing="0" background="images/f_right4.jpg">
      <tr>
        <td width="25" height="98" valign="top"><br>
        </td>
        <td valign="top">
           <%
        typeNews="时政要闻";
        hql="from NewsForm where bigSort = '"+typeNews+"' order by id desc";
        list=objectDao.queryList(hql);
        overnumber=4;
        if(list.size()<5){
            overnumber=list.size();
        }        
        %>
          <table width="230">
            <tr>
              <td width="27" height="26">&nbsp;</td>
              <td width="191"><%=typeNews%></td>
            </tr>
        </table><br>
          <table width="230" border="0" cellpadding="0" cellspacing="0">
          <%
          for(int i=0;i<overnumber;i++){
              newsForm=(NewsForm)list.get(i);
              String fileroad="newsContent/"+newsForm.getShowNews();
              hql="from SortForm where id='"+newsForm.getSortId()+"'";
              SortForm sortForm=(SortForm)objectDao.queryFrom(hql);
              %>
            <tr>
              <td width="230" height="28">
              <a href="#" onclick="javasrcipt:window.open('<%=fileroad%>','','fullscreen=0,scrollbars=0');"><%=newsForm.getTitle()%></a>
             &#8212; <%=sortForm.getSmallSort() %>
               <%if(newsForm.getCreateTime().equals(TimeShow.cuttentMonthDate())){%>
              <img src="images/new.gif"><%}%>
              <hr></td>
            </tr> 
            <%}%>      
		  </table>
		  
		    <table width="230" border="0" cellpadding="0" cellspacing="0">
		     <tr>
			 <td height="29">
               <div align="right"><a href="newsAction.do?method=front_queryNewsAction&photo=f_politicsNews.jpg&sign=<%=typeNews%>" class="a8">更多内容>>></a></div>            </td></tr>
		   </table>
		   
		   </td>
      </tr>
    </table></td>
    <td height="113" valign="top"><table width="282" height="215" border="0" align="center" cellpadding="0" cellspacing="0" background="images/f_right4.jpg">
      <tr>
        <td width="25" height="98" valign="top"><br>
        </td>
        <td valign="top">
           <%
        typeNews="经济动向";
        hql="from NewsForm where bigSort = '"+typeNews+"' order by id desc";
        list=objectDao.queryList(hql);
        overnumber=4;
        if(list.size()<5){
            overnumber=list.size();
        }        
        %>
          <table width="230">
            <tr>
              <td width="27" height="26">&nbsp;</td>
              <td width="191"><%=typeNews%></td>
            </tr>
        </table><br>
          <table width="230" border="0" cellpadding="0" cellspacing="0">
          <%
          for(int i=0;i<overnumber;i++){
              newsForm=(NewsForm)list.get(i);
              String fileroad="newsContent/"+newsForm.getShowNews();
              hql="from SortForm where id='"+newsForm.getSortId()+"'";
              SortForm sortForm=(SortForm)objectDao.queryFrom(hql);
              %>
            <tr>
              <td width="230" height="28">
              <a href="#" onclick="javasrcipt:window.open('<%=fileroad%>','','fullscreen=0,scrollbars=0');"><%=newsForm.getTitle()%></a>
             &#8212; <%=sortForm.getSmallSort() %>
               <%if(newsForm.getCreateTime().equals(TimeShow.cuttentMonthDate())){%>
              <img src="images/new.gif"><%}%>
              <hr></td>
            </tr> 
            <%}%>      
		  </table>
		  
		    <table width="230" border="0" cellpadding="0" cellspacing="0">
		     <tr>
			 <td height="29">
               <div align="right"><a href="newsAction.do?method=front_queryNewsAction&photo=f_economyNews.jpg&sign=<%=typeNews%>" class="a8">更多内容>>></a></div>            </td></tr>
		   </table>
		   </td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="114" colspan="2" valign="middle"><img src="images/f_right3.jpg" width="586" height="101"></td>
  </tr>
  <tr>
    <td valign="bottom"><table width="282" height="215" border="0" align="center" cellpadding="0" cellspacing="0" background="images/f_right5.jpg">
      <tr>
        <td width="25" height="98" valign="top"><br>
        </td>
        <td valign="top">
          
		   <%
        typeNews="社会现象";
        hql="from NewsForm where bigSort = '"+typeNews+"' order by id desc";
        list=objectDao.queryList(hql);
        overnumber=4;
        if(list.size()<5){
            overnumber=list.size();
        }        
        %>
          <table width="230">
            <tr>
              <td width="27" height="26">&nbsp;</td>
              <td width="191"><%=typeNews%></td>
            </tr>
        </table>
          <table width="230" border="0" cellpadding="0" cellspacing="0">
          <%
          for(int i=0;i<overnumber;i++){
              newsForm=(NewsForm)list.get(i);
              String fileroad="newsContent/"+newsForm.getShowNews();
              hql="from SortForm where id='"+newsForm.getSortId()+"'";
              SortForm sortForm=(SortForm)objectDao.queryFrom(hql);
              %>
            <tr>
              <td width="230" height="28">
              <a href="#" onclick="javasrcipt:window.open('<%=fileroad%>','','fullscreen=0,scrollbars=0');"><%=newsForm.getTitle()%></a>
             &#8212; <%=sortForm.getSmallSort() %>
               <%if(newsForm.getCreateTime().equals(TimeShow.cuttentMonthDate())){%>
              <img src="images/new.gif"><%}%>
              <hr></td>
            </tr> 
            <%}%>      
		  </table>
		  
		    <table width="230" border="0" cellpadding="0" cellspacing="0">
		     <tr>
			 <td height="29">
               <div align="right"><a href="newsAction.do?method=front_queryNewsAction&photo=f_societyNews.jpg&sign=<%=typeNews%>" class="a9">更多内容>>></a></div>            </td></tr>
		   </table>
		  
		  
		  
		  
		  
		  </td>
      </tr>
    </table></td>
    <td valign="bottom"><table width="282" height="215" border="0" align="center" cellpadding="0" cellspacing="0" background="images/f_right5.jpg">
      <tr>
        <td width="25" height="98" valign="top"><br>
        </td>
        <td valign="top">
           <%
        typeNews="娱乐天地";
        hql="from NewsForm where bigSort = '"+typeNews+"' order by id desc";
        list=objectDao.queryList(hql);
        overnumber=4;
        if(list.size()<5){
            overnumber=list.size();
        }        
        %>
          <table width="230">
            <tr>
              <td width="27" height="26">&nbsp;</td>
              <td width="191"><%=typeNews%></td>
            </tr>
        </table>
          <table width="230" border="0" cellpadding="0" cellspacing="0">
          <%
          for(int i=0;i<overnumber;i++){
              newsForm=(NewsForm)list.get(i);
              String fileroad="newsContent/"+newsForm.getShowNews();
              hql="from SortForm where id='"+newsForm.getSortId()+"'";
              SortForm sortForm=(SortForm)objectDao.queryFrom(hql);
              %>
            <tr>
              <td width="230" height="28">
              <a href="#" onclick="javasrcipt:window.open('<%=fileroad%>','','fullscreen=0,scrollbars=0');"><%=newsForm.getTitle()%></a>
             &#8212; <%=sortForm.getSmallSort() %>
               <%if(newsForm.getCreateTime().equals(TimeShow.cuttentMonthDate())){%>
              <img src="images/new.gif"><%}%>
              <hr></td>
            </tr> 
            <%}%>      
		  </table>
		  
		    <table width="230" border="0" cellpadding="0" cellspacing="0">
		     <tr>
			 <td height="29">
               <div align="right"><a href="newsAction.do?method=front_queryNewsAction&photo=f_funNews.jpg&sign=<%=typeNews%>" class="a9">更多内容>>></a></div>            </td></tr>
		   </table></td>
      </tr>
    </table></td>
  </tr>
</table>
<jsp:include page="f_botton.jsp"></jsp:include>
</body>
</html>

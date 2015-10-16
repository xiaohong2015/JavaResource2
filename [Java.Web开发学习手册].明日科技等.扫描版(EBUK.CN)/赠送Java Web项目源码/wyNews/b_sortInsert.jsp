<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ taglib prefix="html"  uri="/WEB-INF/struts-html.tld"%> 
<link href="css/style.css" type="text/css" rel="stylesheet">
<script src="js/validate.JS" language="javascript" type="text/javascript"></script>
<%@ page import="java.util.List"%>
<jsp:useBean id="time" scope="page" class="com.tools.TimeShow"></jsp:useBean>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<jsp:useBean id="objectDao" scope="request" class="com.dao.ObjectDao"/>
<title>新闻网后台-新闻管理</title>
</head>
<%
String sortNews=new String(request.getParameter("bigSort").getBytes("ISO8859_1"),"gb2312");

%>
<body onLoad="clockon(bgclock);">
<jsp:include page="b_top.jsp"/>

<table width="918" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="100" align="right" valign="top" bgcolor="#FFFFFF">
	<jsp:include page="b_left.jsp"/>
	</td>
    <td width="818" valign="top" background="images/b_right.jpg" align="center">
	<table width="680" height="65" border="0" align="center" cellpadding="0" cellspacing="0" background="images/b_place.jpg">
      <tr>
        <td valign="top"><table width="659">
          <tr>
            <td width="49" height="54" valign="bottom">&nbsp;</td>
            <td width="491" valign="bottom">当前位置 &gt; 新闻管理 &gt; 新闻类别管理</td>
            <td width="103" valign="bottom"><div align="right"><a href="newsAction.do?method=queryNewsListAction&bigSort=<%=sortNews%>">返回新闻查看</a></div></td>
          </tr>
        </table></td>
      </tr>
    </table><br>
	<table width="643" height="24" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#CCCCCC">
      <tr>
        <td height="24"> &nbsp;&nbsp;&nbsp;<%=sortNews%>&nbsp;&nbsp;所属类别&nbsp;添加</td>
      </tr>
    </table>	
	<br>
	<html:form action="sortAction.do?method=insertSortAction" onsubmit="return checkEmpty(sortForm)">

	<table width="415" border="1" cellpadding="1" cellspacing="1" bordercolor="#FFFFFF" bgcolor="#E8E6E7">
      <tr>
        <td width="125" height="30"  align="center">类别名称</td>
        <td width="284" bgcolor="#FFFFFF">&nbsp;&nbsp;&nbsp;<html:text property="smallSort" size="40" title="请输入类别名称"/></td>
      </tr>
      <tr >
        <td height="30" align="center">创建时间</td>
        <td bgcolor="#FFFFFF">&nbsp;&nbsp;&nbsp;<%=time.cuttentMonthDate()%><html:hidden property="createTime" value="<%=time.cuttentMonthDate()%>"/><html:hidden property="bigSort" value="<%=sortNews%>"/></td>
      </tr>
    </table><br><br>
	  <html:submit value="添加"/>
	  &nbsp;&nbsp;&nbsp;
	 <html:reset value="重置"/>
	  &nbsp;&nbsp;&nbsp;
	 <html:button property="back" onclick="javascript:history.go(-1);" value="返回"/>

	 
      </html:form></td>
	
	
	
  </tr>
</table>
<jsp:include page="b_botton.jsp"/>






</body>
</html>

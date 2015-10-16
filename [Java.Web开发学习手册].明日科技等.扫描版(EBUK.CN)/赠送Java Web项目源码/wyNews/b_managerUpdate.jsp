<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@page import="com.actionForm.ManagerForm"%>
<link href="css/style.css" type="text/css" rel="stylesheet">
<script src="js/validate.JS" language="javascript" type="text/javascript"></script>
<%@ taglib prefix="html"  uri="/WEB-INF/struts-html.tld"%> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>新闻网后台-用户管理</title>
</head>
<%
ManagerForm manager=(ManagerForm)session.getAttribute("form");

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
        <td valign="top"><table width="519">
          <tr>
            <td width="50" height="54" valign="bottom">&nbsp;</td>
            <td width="457" valign="bottom">当前位置 &gt; 用户管理</td>
          </tr>
        </table></td>
      </tr>
    </table><br>
	<table width="643" height="24" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#CCCCCC">
      <tr>
        <td height="24"> &nbsp;&nbsp;&nbsp;修改用户</td>
      </tr>
    </table>	
	
		  <html:form action="managerAction.do?method=updateManagerAction" onsubmit="return checkEmpty(managerForm)">

	<table width="415" border="1" cellpadding="1" cellspacing="1" bordercolor="#FFFFFF" bgcolor="#E8E6E7">
      <tr bgcolor="#FFFFFF">
        <td width="75" height="30" align="center" bgcolor="#E8E6E7">用户名：</td>
        <td width="334">&nbsp;&nbsp;<html:text property="account" size="50" value="<%=manager.getAccount()%>"  onclick="alert('此文本框已设为只读，用户名称不能修改！！')" readonly="true"></html:text></td>

      </tr>
      <tr bgcolor="#FFFFFF">
        <td height="30" align="center" bgcolor="#E8E6E7">密&nbsp;&nbsp;码：</td>
        <td>&nbsp;                   
          <html:password property="password" size="50" title="输入用户登录密码"></html:password>
      </tr>
      <tr bgcolor="#FFFFFF">
        <td height="30" align="center" bgcolor="#E8E6E7">姓&nbsp;&nbsp;名：</td>
        <td>&nbsp; <html:text property="name" size="50" title="请输入用户姓名"></html:text><html:hidden  property="id" value="<%=String.valueOf(manager.getId())%>"/>
</td>
      </tr>
    </table>
	<br>

<html:submit value=" 修改 "/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<html:reset value=" 清除 "/>


	</html:form>
	<%if(request.getAttribute("result")!=null){
		out.println(request.getAttribute("result"));
	} %>
	</td>
  </tr>
</table>
	

</body>
</html>

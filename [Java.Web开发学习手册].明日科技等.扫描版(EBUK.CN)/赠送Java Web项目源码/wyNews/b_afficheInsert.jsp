<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<link href="css/style.css" type="text/css" rel="stylesheet">
<script src="js/validate.JS" language="javascript" type="text/javascript"></script>
<%@ page import="java.util.List"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>新闻网后台-公告管理</title>
</head>

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
            <td width="457" valign="bottom">当前位置 &gt; 公告管理</td>
          </tr>
        </table></td>
      </tr>
    </table><br>
	<table width="643" height="24" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#CCCCCC">
      <tr>
        <td height="24"> &nbsp;&nbsp;&nbsp;公告添加</td>
      </tr>
    </table>	
	<br>
<html:form action="afficheAction.do?method=insertAfficheAction" onsubmit="return checkEmpty(afficheForm)">

	<table width="415" border="1" cellpadding="1" cellspacing="1" bordercolor="#FFFFFF" bgcolor="#E8E6E7">
    
      <tr>
        <td width="73" height="275" align="center" valign="top"><br>
          公告内容</td>
        <td width="329" bgcolor="#FFFFFF">&nbsp;                   
          <html:textarea property="content" cols="42" rows="18" title="请输入公告内容"></html:textarea></td>
      </tr>
      <tr>
        <td height="30" align="center">创建时间</td>
        <td bgcolor="#FFFFFF">&nbsp;&nbsp;<%=com.tools.TimeShow.cuttentMonthDate()%><html:hidden property="createTime" value="<%=com.tools.TimeShow.cuttentMonthDate()%>"/></td>
      </tr>
    </table>
	<br>

<html:submit>添加
</html:submit>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<html:reset>清除
</html:reset>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<html:button property="back" onclick="javascript:history.go(-1);">返回
</html:button>
	</html:form>
	
	
	</td>
  </tr>
</table>
<jsp:include page="b_botton.jsp"/>


<%if(request.getAttribute("result")!=null){ %>
<script language='javascript'>alert('<%=request.getAttribute("result")%>');window.location.href='afficheAction.do?method=selectAfficheAction';</script>
<%}%>

</body>
</html>

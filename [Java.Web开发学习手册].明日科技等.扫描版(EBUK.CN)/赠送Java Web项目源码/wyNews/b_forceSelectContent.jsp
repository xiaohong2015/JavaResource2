<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<link href="css/style.css" type="text/css" rel="stylesheet">
<script src="js/validate.JS" language="javascript" type="text/javascript"></script>
<%@ page import="com.actionForm.ForceForm"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>��������̨-���㵼������</title>
</head>
<%ForceForm forceForm=(ForceForm)request.getAttribute("form"); %>
<body onLoad="clockon(bgclock);">
<jsp:include page="b_top.jsp"/>

<table width="918" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="100" align="right" valign="top" bgcolor="#FFFFFF">
<jsp:include page="b_left.jsp"/>
	</td>
    <td width="818" valign="top" background="images/b_right.jpg"><div align="center">
		<table width="680" height="65" border="0" align="center" cellpadding="0" cellspacing="0" background="images/b_place.jpg">
      <tr>
        <td valign="top"><table width="519">
          <tr>
            <td width="50" height="54" valign="bottom">&nbsp;</td>
            <td width="457" valign="bottom">��ǰλ�� &gt; ���㵼������</td>
          </tr>
        </table></td>
      </tr>
    </table><br>
	<table width="643" height="24" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#CCCCCC">
      <tr>
        <td height="24"> &nbsp;&nbsp;&nbsp;���㵼����ϸ�鿴</td>
      </tr>
    </table>
	<br>
	<table width="640" border="1" cellpadding="1" cellspacing="1" bordercolor="#FFFFFF" bgcolor="#E8E6E7">
      <tr>
        <td width="91" height="30"><div align="center">������Ŀ��</div></td>
        <td width="537" bgcolor="#FFFFFF">&nbsp;&nbsp;<%=forceForm.getTitle()%></td>
      </tr>
      <tr>
        <td height="178"><div align="center">�������ݣ�</div></td>
        <td bgcolor="#FFFFFF" valign="top">&nbsp;&nbsp;<%=forceForm.getContent()%></td>
      </tr>
      <tr>
        <td height="30"><div align="center">����ʱ�䣺</div></td>
        <td bgcolor="#FFFFFF">&nbsp;&nbsp;<%=forceForm.getTitle() %></td>
      </tr>
    </table>
	<table width="600" height="30">
      	<tr><td align="right"><a href="#" onclick="javasrcipt:history.back();">����</a></td></tr>
	                                
	</table>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
		</div></td>
  </tr>
</table>
<jsp:include page="b_botton.jsp"/>
</body>
</html>

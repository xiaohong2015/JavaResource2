<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<link href="css/style.css" type="text/css" rel="stylesheet">
<script src="js/validate.JS" language="javascript" type="text/javascript"></script>
<%@ page import="com.actionForm.ForceForm"%>
<%@ taglib prefix="html" uri="/WEB-INF/struts-html.tld"%> 
<%@ taglib prefix="logic" uri="/WEB-INF/struts-logic.tld"%> 

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>��������̨-���㵼������</title>
</head>

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
        <td height="24"> &nbsp;&nbsp;&nbsp;���㵼�����</td>
      </tr>
    </table>
<html:form action="forceAction.do?method=insertForceAction" onsubmit="return checkEmpty(forceForm)">
	<table width="640" border="1" cellpadding="1" cellspacing="1" bordercolor="#FFFFFF" bgcolor="#E8E6E7">
      <tr>
        <td width="91" height="30"><div align="center">������Ŀ��</div></td>
        <td width="537" bgcolor="#FFFFFF"><html:text property="title" title="�����뽹�㵼����Ŀ" size="90"/></td>
      </tr>
      <tr>
        <td height="178"><div align="center">�������ݣ�</div></td>
        <td bgcolor="#FFFFFF" valign="top"><html:textarea property="content" title="�����뽹�����Ҫ����" cols="90" rows="20"/></td>
      </tr>
      <tr>
        <td height="30"><div align="center">����ʱ�䣺</div></td>
        <td bgcolor="#FFFFFF"><%=com.tools.TimeShow.cuttentMonthDate()%><html:hidden property="createTime" value="<%=com.tools.TimeShow.cuttentMonthDate()%>"/></td>
      </tr>
    </table>
    <table height="50" width="620">
    <tr><td  align="right"><html:submit>���
</html:submit>&nbsp;&nbsp;&nbsp;
<html:reset>���
</html:reset>&nbsp;&nbsp;&nbsp;
<html:button property="back" onclick="javascript:history.go(-1);">����
</html:button></td></tr>
    
    </table>
    
    
    
    </html:form>
	</div></td>
  </tr>
</table>
<jsp:include page="b_botton.jsp"/>


<%if(request.getAttribute("result")!=null){ %>


<%String result=(String)request.getAttribute("result"); %>
<script language='javascript'>alert('<%=result%>');window.location.href='forceAction.do?method=selectForceAction';</script>

<%} %>



</body>
</html>

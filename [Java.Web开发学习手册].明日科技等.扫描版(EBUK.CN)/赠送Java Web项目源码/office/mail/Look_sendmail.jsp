<%@ page contentType="text/html; charset=gb2312" language="java" errorPage="" %>
<%@ taglib uri="struts-html" prefix="html" %>
<%@ taglib uri="struts-bean" prefix="bean" %>
<%@ taglib uri="struts-logic" prefix="logic" %>
<% String path=request.getContextPath(); %>
<html>
	<head>
		<html:base/>
		<title>�鿴���ʼ���</title>
	</head>
	<body bgcolor="#075B97">
	<center>
		<table width="965" border="0" cellpadding="0" cellspacing="0">
				<tr><td colspan="4"><jsp:include page="/top.jsp"/></td></tr>
				<tr bgcolor="#EDEEFF">
					<td width="13" background="<%=path%>/image/left.jpg"></td>
					<td align="center" valign="top" bgcolor="#EDEEFF"><jsp:include page="/side.jsp"/></td>
					<td width="720" align="center" valign="top"  bgcolor="#E8F1F6">
        				<br><br>
      					<table width="90%" border="5" cellspacing="0" cellpadding="5" bordercolor="#F0F0F0" bordercolorlight="#E8F1F6" bordercolordark="#1687AF" rules="none" bgcolor="white">
	        				<tr>
          						<td width="31%" height="25" align="left">&nbsp;</td>
          						<td width="47%" align="right">
                 					<logic:greaterEqual value="1" name="logonuser" property="userable">
                    				<a href="<%=request.getContextPath()%>/mail/mail_add.do">[�������ʼ�]</a>
                 					</logic:greaterEqual>
          						</td>
          						<td width="21%" align="right"><b>�ʼ�����</b>&nbsp;</td>
        					</tr>
      					</table>
      					<table width="90%" border="5" cellspacing="0" cellpadding="5" bordercolor="#F0F0F0" bordercolorlight="#1687AF" bordercolordark="#E8F1F6" rules="none" bgcolor="white">
        					<tr><td height="20" colspan="4">���ʼ���</td></tr>
        					<tr align="center" bgcolor="#DFE5F5">
          						<td width="35%" height="25">����</td>
          						<td width="30%" height="25">�ռ���</td>
          						<td width="20%" height="25">����ʱ��</td>
          						<td width="15%" height="25">����</td>
        					</tr>
        					<logic:present name="sendmaillist">
        					<logic:iterate id="mailsigle" name="sendmaillist">
        					<tr height="40">
          						<td align="center"><a href="<%=request.getContextPath()%>/mail/mail_look_sigle.do?id=<bean:write name='mailsigle' property='mailid'/>&from=send"><bean:write name="mailsigle" property="subject"/></a></td>
          						<td align="center"><bean:write name="mailsigle" property="geter"/></td>
          						<td align="center"><bean:write name="mailsigle" property="stime"/></td>
          						<td align="center">
             						<logic:greaterEqual value="1" name="logonuser" property="userable">
               						<a href="<%=request.getContextPath()%>/mail/mail_del.do?id=<bean:write name='mailsigle' property='mailid'/>&from=send&page=<%=session.getAttribute("currentpage")%>" onclick="javascript:return(confirm('ȷ��Ҫɾ���ü�¼��?'))">[ɾ��]</a>
             						</logic:greaterEqual>
             						<logic:equal value="0" name="logonuser" property="userable">��Ȩ��</logic:equal>
          						</td>
        					</tr>
		       				</logic:iterate>
        					</logic:present>
        					<logic:empty name="sendmaillist">
          					<tr><td colspan=5 align=center><li><b>û�м�¼��ʾ��</b></li></td></tr>
        					</logic:empty>
      					</table>
      					<jsp:include page="/page.jsp"/> 
   					</td>
   					<td width="13" background="<%=path%>/image/right.jpg"></td>
  				</tr>
				<tr><td colspan="4"><jsp:include page="/end.jsp"/></td></tr>
			</table>
		</center>
	</body>
</html>
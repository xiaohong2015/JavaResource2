<%@ page contentType="text/html; charset=gb2312" language="java" errorPage="" %>
<%@ taglib uri="struts-html" prefix="html" %>
<%@ taglib uri="struts-bean" prefix="bean" %>
<%@ taglib uri="struts-logic" prefix="logic" %>
<% String path=request.getContextPath(); %>
<html>
	<head>
		<html:base/>
		<title>������ļ���</title>
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
      					<table width="90%"  border="0">
       						<tr valign="bottom">
          						<td width="30%" height="25" align="left" style="border:0"><font color="red"><html:errors/></font></td>
          						<td width="40%" align="right">
                 					<logic:greaterEqual value="1" name="logonuser" property="userable">
                    				<a href="<%=request.getContextPath()%>/text/text_add.do?addtype=link">[�½�����]</a>
                 					</logic:greaterEqual>
          						</td>
          						<td width="20%" align="center">��/���Ĺ���&nbsp;</td>
       						 </tr>
      					</table>
      					<table width="90%" border="5" cellspacing="0" cellpadding="5" bordercolor="#F0F0F0" bordercolorlight="#1687AF" bordercolordark="#E8F1F6" rules="none" bgcolor="white">
       						<tr><td height="30" colspan="5">���ļ���</td></tr>
        					<tr align="center"  bgcolor="#B9D9E9">
					          	<td width="8%">״̬</td>
          						<td width="24%">��������</td>
          						<td width="25%">������</td>
         					 	<td width="25%">����ʱ��</td>
          						<td width="8%">����</td>
        					</tr>
        					<logic:present name="gettextlist">
        					<logic:iterate id="textsigle" name="gettextlist">
        					<tr height="40">
          						<td align="center">
             						<logic:equal value="1" name="textsigle" property="mark"><b>δ��</b></logic:equal>
             						<logic:equal value="0" name="textsigle" property="mark">�Ѷ�</logic:equal>
          						</td>
          						<td align="center"><logic:equal value="1" name="textsigle" property="mark"><b></logic:equal><a href="<%=request.getContextPath()%>/text/text_sigle_look.do?id=<bean:write name='textsigle' property='textid'/>&from=get"><bean:write name="textsigle" property="subject"/></a></td>
          						<td align="center"><logic:equal value="1" name="textsigle" property="mark"><b></logic:equal><bean:write name="textsigle" property="sender"/></td>
          						<td align="center"><logic:equal value="1" name="textsigle" property="mark"><b></logic:equal><bean:write name="textsigle" property="sendtime"/></td>
          						<td align="center">
             						<logic:greaterEqual value="1" name="logonuser" property="userable">
               						<a href="<%=request.getContextPath()%>/text/text_del.do?id=<bean:write name='textsigle' property='textid'/>&from=get&page=<%=session.getAttribute("currentpage")%>" onclick="javascript:return(confirm('ȷ��Ҫɾ���ü�¼��?'))">[ɾ��]</a>
             						</logic:greaterEqual>
             						<logic:equal value="0" name="logonuser" property="userable">��Ȩ��</logic:equal>
          						</td>
        					</tr>
						    </logic:iterate>
        					</logic:present>
        					<logic:empty name="gettextlist">
          					<tr><td colspan="5" align="center"><li><b>û�м�¼��ʾ��</b></li></td></tr>
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

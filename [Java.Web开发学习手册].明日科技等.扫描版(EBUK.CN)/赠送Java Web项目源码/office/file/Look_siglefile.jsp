<%@ page contentType="text/html; charset=gb2312" language="java" errorPage="" %>
<%@ taglib uri="struts-html" prefix="html" %>
<%@ taglib uri="struts-logic" prefix="logic" %>
<% String path=request.getContextPath(); %>
<html>
	<head>
		<html:base/>
		<title>����ļ���ϸ����</title>
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
					    <table width="90%" border="5" cellspacing="0" cellpadding="5" bordercolor="#F0F0F0" bordercolorlight="#1687AF" bordercolordark="#E8F1F6" rules="none" bgcolor="white">
        					<tr><td height="25" align="center">�鿴�ļ���Ϣ</td></tr>
        					<tr>
          						<td align="center" valign="middle">
            						<table width="100%"  border="1" cellspacing="0" cellpadding="0" bordercolor="lightgrey" bordercolorlight="lightgrey" bordercolordark="white">
             							<logic:notPresent name="filelist">
               							<tr><td bgcolor="#B9D9E9" align="center" height="50">����ʧ�ܣ�</td></tr>
             							</logic:notPresent>
             							<logic:present name="filelist">
              							<logic:iterate id="filesigle" name="filelist">
               							<logic:equal value="<%=request.getParameter("id")%>" name="filesigle" property="fileid" >
	                					<tr valign="middle">
                							<td width="23%" height="30" align="right" valign="middle" bgcolor="#B9D9E9">�ļ���:&nbsp;</td>
                							<td height="30">&nbsp;<html:text name="filesigle" property="filename" style="border:0;" readonly="true"/></td>
              							</tr>
              							<tr valign="middle">
                							<td height="30" align="right" valign="middle" bgcolor="#B9D9E9">�ϴ���:&nbsp;</td>
                							<td height="30" align="left">&nbsp;<html:text name="filesigle" property="fileuper" style="border:0" readonly="true"/></td>
              							</tr>
              							<tr valign="middle">
                							<td height="30" align="right" valign="middle" bgcolor="#B9D9E9">�ļ���С:&nbsp;</td>
                							<td height="30" align="left">&nbsp;<html:text name="filesigle" property="filesize" style="border:0" readonly="true"/></td>
              							</tr>
              							<tr valign="middle">
                							<td height="30" align="right" valign="middle" bgcolor="#B9D9E9">�ϴ�ʱ��:&nbsp;</td>
                							<td height="30" align="left">&nbsp;<html:text name="filesigle" property="fileuptime" style="border:0" readonly="true"/></td>
              							</tr>
              							<tr valign="middle">
                							<td height="73" align="right" valign="middle" bgcolor="#B9D9E9">�ļ�����:&nbsp;</td>
                							<td height="73" align="left">&nbsp;<html:text name="filesigle" property="fileinfo" style="border:0" readonly="true"/></td>
              							</tr>
              							</logic:equal>
             							</logic:iterate>
            							</logic:present>
          							</table>
         						</td>
        					</tr>
      					</table>
      					<table><tr height="30"><td align="center"><a href="<%=request.getContextPath()%>/file/file_look.do?page=<%=session.getAttribute("currentpage")%>">[����]</a></td></tr></table>
					</td>
					<td width="13" background="<%=path%>/image/right.jpg"></td>
				</tr>
				<tr><td colspan="4"><jsp:include page="/end.jsp"/></td></tr>
			</table>
		</center>
	</body>
</html>
<%@ page contentType="text/html; charset=gb2312" language="java" errorPage="" %>
<%@ taglib uri="struts-html" prefix="html" %>
<% String path=request.getContextPath(); %>
<html>
	<head>
		<html:base/>
		<title>�鿴������ϸ����</title>
	</head>
	<body bgcolor="#075B97">
	<center>
		<table width="965" border="0" cellpadding="0" cellspacing="0">
				<tr><td colspan="4"><jsp:include page="/top.jsp"/></td></tr>
				<tr>
					<td width="13" background="<%=path%>/image/left.jpg"></td>
					<td align="center" valign="top" bgcolor="#F1FAFF"><jsp:include page="/side.jsp"/></td>
					<td width="715" align="center" valign="top"  bgcolor="#E8F1F6">
        				<br><br>
				      	<table><tr><td><html:errors/></td></tr></table>
      					<html:form action="/meet/meet_sigle_look.do">
        				<table width="80%" border="1" cellspacing="0" bordercolor="lightgrey" bordercolorlight="lightgrey" bordercolordark="white" bgcolor="white" rules="all">
          					<tr valign="middle"><td height="25" align="center">�鿴������Ϣ</td></tr>
          					<tr valign="middle"><td height="25" align="left" bgcolor="#B9D9E9"><b>������Ϣ:</b></td></tr>
          					<tr valign="middle">
            					<td align="center">
              						<table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
                						<tr height="25">
                  							<td width="30%" align="center">ʱ&nbsp;&nbsp;&nbsp;&nbsp;�䣺</td>
                  							<td width="70%" align="left">&nbsp;<html:text property="time" size="40" style="border:0" readonly="true"/></td>
                						</tr>
                						<tr height="25">	
                  							<td align="center">�� �� �ˣ�</td>
                  							<td align="left">&nbsp;<html:text property="speaker" size="40" style="border:0" readonly="true"/></td>
                						</tr>
                						<tr height="25">
                  							<td align="center">�� ϯ �ˣ�</td>
                  							<td align="left">&nbsp;<html:text property="listener" size="40" style="border:0" readonly="true"/></td>
                						</tr>
                						<tr height="25">
                  							<td align="center">����ص㣺</td>
                  							<td align="left">&nbsp;<html:text property="address" size="67" style="border:0" readonly="true"/></td>
                						</tr>
                						<tr height="25">
                  							<td align="center">��&nbsp;&nbsp;&nbsp;&nbsp;�⣺</td>
                  							<td align="left">&nbsp;<html:text property="subject" size="67" style="border:0" readonly="true"/></td>
                						</tr>
            						</table>
            					</td>
          					</tr>
          					<tr><td height="25" bgcolor="#B9D9E9"><b>��������:</b></td></tr>
          					<tr><td align="center"><html:textarea property="content" cols="78" rows="10" readonly="true" style="border:0"/></td></tr>
          				</table>
        				</html:form>
        				<a href="<%=request.getContextPath()%>/meet/meet_look.do?page=<%=session.getAttribute("currentpage")%>">[����]</a>
        			</td>
        			<td width="13" background="<%=path%>/image/right.jpg"></td>
				</tr>
				<tr><td colspan="4"><jsp:include page="/end.jsp"/></td></tr>
			</table>
		</center>
	</body>
</html>
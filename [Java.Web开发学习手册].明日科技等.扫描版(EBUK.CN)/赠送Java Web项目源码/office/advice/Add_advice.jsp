<%@ page contentType="text/html; charset=gb2312" language="java" errorPage="" %>
<%@ taglib uri="struts-html" prefix="html" %>
<% String path=request.getContextPath(); %>
<html>
	<head>
		<html:base/>
		<title>���ͽ���</title>
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
          				<table><tr><td align=center><html:errors/></td></tr></table>
          				<table width="80%" border="1" cellspacing="0" cellpadding="2" bordercolor="lightgrey" bordercolorlight="lightgrey" bordercolordark="white">
            				<html:form action="/advice/advice_add.do?addtype=add" focus="subject">
            				<tr align="center" bgcolor="#B9D9E9">
              					<td height="25" colspan="2"><strong>���ͽ���</strong></td>
            				</tr>
            				<tr>
              					<td width="18%" height="25" align="right" bgcolor="#B9D9E9">���⣺</td>
              					<td width="82%" height="30">&nbsp;<html:text property="subject" size="50" maxlength="25"/></td>
            				</tr>
            				<tr>
              					<td rowspan="2" align="right" bgcolor="#B9D9E9">���ݣ�</td>
           						<td align="left" valign="baseline">&nbsp;<html:textarea property="content" cols="60" rows="10"/></td>
            				</tr>
            				<tr>
              					<td height="30" align="center" valign="middle">
                   					<html:submit value="����"/>
                   					<html:reset value="����"/>
              					</td>
            				</tr>
            				</html:form>
          				</table>
					</td>
					<td width="13" background="<%=path%>/image/right.jpg"></td>
				</tr>
				<tr><td colspan="4"><jsp:include page="/end.jsp"/></td></tr>
			</table>
		</center>
	</body>
</html>
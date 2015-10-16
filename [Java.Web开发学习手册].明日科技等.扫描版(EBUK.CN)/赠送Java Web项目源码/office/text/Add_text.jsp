<%@ page contentType="text/html; charset=gb2312" language="java" errorPage="" %>
<%@ taglib uri="struts-html" prefix="html" %>
<% String path=request.getContextPath(); %>
<html>
	<head>
		<html:base/>
		<title>新建公文</title>
	</head>
	<body bgcolor="#075B97">
	<center>
		<table width="965" border="0" cellpadding="0" cellspacing="0">
				<tr><td colspan="4"><jsp:include page="/top.jsp"/></td></tr>
				<tr bgcolor="#EDEEFF">
					<td width="14" background="<%=path%>/image/left.jpg"></td>
					<td align="center" valign="top" bgcolor="#EDEEFF"><jsp:include page="/side.jsp"/></td>
					<td width="727" align="center" valign="top"  bgcolor="#E8F1F6">
        				<br><br>
        				<table border="1" cellspacing="0" cellpadding="2"  bordercolor="lightgrey" bordercolorlight="lightgrey" bordercolordark="white">
          					<tr align="center" bgcolor="#B9D9E9">
            					<td height="25" colspan="2"><b>新建发文</b></td>
          					</tr>
          					<html:form action="/text/text_add.do?addtype=add" focus="geter">
          					<tr>
            					<td height="25" align="right" bgcolor="#B9D9E9">收文人：</td>
            					<td height="30">&nbsp;<html:text property="geter" size="40" maxlength="10"/>&nbsp;最大长度为10个字符!</td>
          					</tr>
          					<tr>
            					<td width="32%" height="25" align="right" bgcolor="#B9D9E9"> 主题：</td>
            					<td width="68%" height="30">&nbsp;<html:text property="subject" size="40" maxlength="25"/>&nbsp;最大长度为25个字符!</td>
          					</tr>
          					<tr>
            					<td rowspan="2" align="right" bgcolor="#B9D9E9">内容：</td>
            					<td align="left">&nbsp;<html:textarea property="content" rows="7" cols="50"/></td>
          					</tr>
          					<tr>
            					<td height="30" align="center" valign="middle"><html:submit value="提交"/>&nbsp;<html:reset value="重置"/></td>
          					</tr>
        					</html:form>
        				</table>
        				<table><tr><td><html:errors/></td></tr></table>
					</td>
					<td width="13" background="<%=path%>/image/right.jpg"></td>
				</tr>
  				<tr><td colspan="4"><jsp:include page="/end.jsp"/></td></tr>
			</table>
		</center>
	</body>
</html>

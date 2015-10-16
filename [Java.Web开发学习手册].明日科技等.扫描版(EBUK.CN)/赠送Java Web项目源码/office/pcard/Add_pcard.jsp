<%@ page contentType="text/html; charset=gb2312" language="java" errorPage="" %>
<%@ taglib uri="struts-html" prefix="html" %>
<%@ taglib uri="struts-bean" prefix="bean" %>
<%@ taglib uri="struts-logic" prefix="logic" %>
<% String path=request.getContextPath(); %>
<html>
	<head>
		<html:base/>
		<title>发布公告</title>
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
  						<table width="80%" border="1" cellspacing="0" cellpadding="2" bordercolor="lightgrey" bordercolorlight="lightgrey" bordercolordark="white">
      						<tr align="center" bgcolor="#B9D9E9">
        						<td height="25" colspan="2"><strong>添加新公告</strong></td>
      						</tr>
      						<html:form action="/pcard/pcard_add?addtype=add" focus="subject">
      						<tr height="30">
        						<td width="30%" align="right" bgcolor="#B9D9E9"> 主题：</td>
        						<td width="50%"><html:text property="subject" size="50" maxlength="25"/>&nbsp;最长为25个字符!</td>
      						</tr>
      						<tr>
        						<td rowspan="2" align="right" bgcolor="#B9D9E9">内容：</td>
        						<td align="left" valign="baseline">
            						<html:textarea property="content" cols="56" rows="8"/>
        						</td>
      						</tr>
      						<tr>
        						<td height="30" align="center" valign="middle">
            						<html:submit value="添加公告"/>
            						<html:reset  value="重新填写"/>
        						</td>
      						</tr>
     						</html:form>
					    </table>
    					<table><tr><td align="center"><html:errors/></td></tr></table>
   					</td>
   					<td width="13" background="<%=path%>/image/right.jpg"></td>
  				</tr>
				<tr><td colspan="4"><jsp:include page="/end.jsp"/></td></tr>
			</table>
		</center>
	</body>
</html>
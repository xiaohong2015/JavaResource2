<%@ page contentType="text/html; charset=gb2312" language="java" errorPage="" %>
<%@ taglib uri="struts-html" prefix="html" %>
<%@ taglib uri="struts-bean" prefix="bean" %>
<%@ taglib uri="struts-logic" prefix="logic" %>
<% String path=request.getContextPath(); %>
<html>
	<head>
		<html:base/>
		<title>查看个人信息</title>
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
          				<table><tr><td><html:errors/></td></tr></table>
          				<html:form action="/person/person_myself_update.do?updatetype=link">
          				<table width="90%" border="5" cellspacing="0" cellpadding="5" bordercolor="#F0F0F0" bordercolorlight="#1687AF" bordercolordark="#E8F1F6" rules="none" bgcolor="white">
            				<tr><td height="25" align="center">查看个人信息</td></tr>
            				<tr>
              					<td height="278" align="center" valign="middle">
                					<table width="100%"  border="1" cellspacing="0" cellpadding="0" bordercolor="lightgrey" bordercolorlight="lightgrey" bordercolordark="white">
                  						<tr valign="middle">
                    						<td width="23%" height="30" align="right" valign="middle" bgcolor="#B9D9E9">用户名:&nbsp;</td>
                    						<td colspan="5" align="left">&nbsp;<html:text property="username" style="border:0" readonly="true" size="40"/></td>
                  						</tr>
                  						<tr valign="middle">
                    						<td height="30" align="right" valign="middle" bgcolor="#B9D9E9">姓名:&nbsp;</td>
                    						<td colspan="5" align="left">&nbsp;<html:text property="usertruename" style="border:0" size="10" readonly="true"/></td>
                  						</tr>
                  						<tr valign="middle">
                    						<td height="30" align="right" valign="middle" bgcolor="#B9D9E9">性别:&nbsp;</td>
                    						<td width="19%" align="left">&nbsp;<html:text property="usersex" style="border:0" size="5" readonly="true"/></td>
                    						<td width="14%" align="center" bgcolor="#B9D9E9">权限:</td>
                    						<td colspan="3" align="left"><logic:equal value="0" name="logonform" property="userable">&nbsp;游客</logic:equal>
                                                 <logic:equal value="1" name="logonform" property="userable">&nbsp;普通管理员</logic:equal>
                                                 <logic:equal value="2" name="logonform" property="userable">&nbsp;系统管理员</logic:equal>
                    						</td>
                  						</tr>
                  						<tr valign="middle">
                    						<td height="30" align="right" valign="middle" bgcolor="#B9D9E9">职务:&nbsp;</td>
                    						<td align="left">&nbsp;<html:text property="userjob" style="border:0" size="10" readonly="true"/></td>
                    						<td align="center" bgcolor="#B9D9E9">部门:</td>
                    						<td width="14%" align="left">&nbsp;<html:text property="userbranch" style="border:0" size="10" readonly="true"/></td>
                    						<td width="13%" align="center" bgcolor="#B9D9E9">称号:</td>
                    						<td width="17%" align="left">&nbsp;<logic:equal value="0" name="logonform" property="usergood">普通员工</logic:equal>
                    							<logic:equal value="1" name="logonform" property="usergood">优秀员工</logic:equal>
                    						</td>
                  						</tr>
                  						<tr valign="middle">
                    						<td height="30" align="right" valign="middle" bgcolor="#B9D9E9">电话:&nbsp;</td>
                    						<td colspan="5" align="left">&nbsp;<html:text property="usertel" style="border:0" size="30" readonly="true"/></td>
                  						</tr>
                  						<tr valign="middle">
                    						<td height="30" align="right" valign="middle" bgcolor="#B9D9E9">E-mail:&nbsp;</td>
                    						<td colspan="5" align="left">&nbsp;<html:text property="useremail" style="border:0" size="30" readonly="true"/></td>
                  						</tr>
                  						<tr valign="middle">
                    						<td height="30" align="right" valign="middle" bgcolor="#B9D9E9">地址:&nbsp;</td>
                    						<td colspan="5" align="left">&nbsp;<html:text property="useraddress" style="border:0" size="66" readonly="true"/></td>
                  						</tr>
                  						<tr valign="middle">
                    						<td height="30" align="right" valign="middle" bgcolor="#B9D9E9">访问次数:&nbsp;</td>
                    						<td colspan="5" align="left">&nbsp;<html:text property="useraccesstimes" style="border:0" size="66" readonly="true"/></td>
                  						</tr>
                  						<tr valign="middle">
                    						<td height="30" align="right" valign="middle" bgcolor="#B9D9E9">创建时间:&nbsp;</td>
                    						<td colspan="5" align="left">&nbsp;<html:text property="userfoundtime" style="border:0" size="66" readonly="true"/></td>
                  						</tr>
                  						<tr height="35" align="center">
                    						<td colspan=6><html:submit value="修改个人信息"/></td>
                  						</tr>
              						</table> 
              					</td>
            				</tr>
          				</table>
          				</html:form>
					</td>
					<td width="13" background="<%=path%>/image/right.jpg"></td>
				</tr>
				<tr><td colspan="4"><jsp:include page="/end.jsp"/></td></tr>
			</table>
		</center>
	</body>
</html>
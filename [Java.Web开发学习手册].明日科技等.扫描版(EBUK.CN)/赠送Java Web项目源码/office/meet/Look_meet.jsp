<%@ page contentType="text/html; charset=gb2312" language="java" errorPage="" %>
<%@ taglib uri="struts-html" prefix="html" %>
<%@ taglib uri="struts-bean" prefix="bean" %>
<%@ taglib uri="struts-logic" prefix="logic" %>
<% String path=request.getContextPath(); %>
<html>
	<head>
		<html:base/>
		<title>查看会议记录</title>
	</head>
	<body bgcolor="#075B97">
	<center>
		<table width="965" border="0" cellpadding="0" cellspacing="0">
				<tr><td colspan="4"><jsp:include page="/top.jsp"/></td></tr>
				<tr bgcolor="#EDEEFF">
					<td width="13" background="<%=path%>/image/left.jpg"></td>
					<td align="center" valign="top" bgcolor="#EDEEFF"><jsp:include page="/side.jsp"/></td>
					<td width="725" align="center" valign="top"  bgcolor="#E8F1F6">
        				<br><br>
      					<table width="90%"  border="0">
        					<tr valign="bottom">
          						<td width="31%" height="25" align="left" style="border:0"><font color="red"><html:errors/></font></td>
          						<td width="47%" align="right">
            	      				<logic:greaterEqual value="1" name="logonuser" property="userable">
        	              			<html:link page="/meet/meet_add.do?addtype=link">[添加会议记录]</html:link>            
    	              				</logic:greaterEqual>
	          					</td>
          						<td width="21%" align="right"><strong>会议信息管理&nbsp;&nbsp;</strong></td>
        					</tr>
        				</table>
			      		<table width="90%" border="5" cellspacing="0" cellpadding="5" bordercolor="#F0F0F0" bordercolorlight="#1687AF" bordercolordark="#E8F1F6" rules="none" bgcolor="white">
        					<tr><td height="30" colspan="4">浏览会议信息</td></tr>
       						<tr align="center" bgcolor="#B9D9E9">
          						<td width="31%" height="25">会议主题</td>
						        <td width="20%" height="25">主持人</td>
						        <td width="32%" height="25">会议时间</td>
						        <td width="8%" height="25">操作</td>
					        </tr>
        					<logic:present name="meetlist">
         					<logic:iterate id="meetsigle" name="meetlist">
           					<tr height="40">
             					<td align="center"><html:link page="/meet/meet_sigle_look.do" paramId="id" paramName="meetsigle" paramProperty="meetid"><bean:write name="meetsigle" property="subject"/></html:link></td>
             					<td align="center"><bean:write name="meetsigle" property="speaker"/></td>
             					<td align="center"><bean:write name="meetsigle" property="time"/></td>
             					<td align="center">
              						<logic:greaterEqual value="1" name="logonuser" property="userable">
		               				<a href="<%=request.getContextPath()%>/meet/meet_del.do?id=<bean:write name='meetsigle' property='meetid'/>&page=<%=session.getAttribute("currentpage")%>" onclick="javascript:return(confirm('确定要删除该记录吗?'))">[删除]</a>
        	      					</logic:greaterEqual>
            	  					<logic:equal value="0" name="logonuser" property="userable">无权限</logic:equal>
				           </tr>
				           </logic:iterate>
				           </logic:present>
				           <logic:empty name="meetlist">
				           <tr><td colspan="4" align="center"><li><b>没有记录显示!</b></li></td></tr>
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
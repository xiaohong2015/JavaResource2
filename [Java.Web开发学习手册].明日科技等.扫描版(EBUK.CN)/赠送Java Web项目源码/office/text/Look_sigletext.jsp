<%@ page contentType="text/html; charset=gb2312" language="java" errorPage="" %>
<%@ taglib uri="struts-html" prefix="html" %>
<%@ taglib uri="struts-bean" prefix="bean" %>
<%@ taglib uri="struts-logic" prefix="logic"%>
<%
  String path=request.getContextPath();
  String title="";   
  String hrefpath="";
  String action=request.getParameter("from");
  if(action==null||action.equals(""))
	  action="get";
  pageContext.setAttribute("action",action);
  if(action.equals("send")){
	  title="�鿴�������еķ���!";
	  hrefpath="/text/text_look_send.do";
  }
  if(action.equals("get")){
	  title="�鿴�ռ����еķ���!";
	  hrefpath="/text/text_look_get.do";
  }
%>
<html>
	<head>
		<html:base/>
		<title>���������ϸ��Ϣ</title>
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
        				<table width="90%" border="1" cellspacing="0"  bordercolor="lightgrey" bordercolorlight="lightgrey" bordercolordark="white" bgcolor="white">
          					<tr align="center" bgcolor="#B9D9E9"><td height="30" colspan="2"><b><%=title %></td></tr>
          						<html:form action="/text/text_sigle_look.do">
          						<tr height="40">
            						<td width="25%" align="right" bgcolor="#B9D9E9">�������⣺</td>
            						<td><html:text property="subject" style="border:0" readonly="true"/></td>
          						</tr>
          						<tr height="40">
           							<logic:equal value="get" name="action">
            						<td width="30%" align="right" bgcolor="#B9D9E9">�� �� �ˣ�</td>
            						<td width="68%" height="30"><html:text property="sender" style="border:0" size="45" readonly="true"/></td>
           							</logic:equal> 
           							<logic:equal value="send" name="action">
            						<td align="right" bgcolor="#B9D9E9">�� �� �ˣ�</td>
            						<td><html:text property="geter" style="border:0" size="45" readonly="true"/></td>
           							</logic:equal>
          						</tr>
          						<tr height="40">
            						<td align="right" bgcolor="#B9D9E9">����ʱ�䣺</td>
            						<td align="left"><html:text property="sendtime" style="border:0" readonly="true"/></td>
          						</tr>
          						<tr height="40">
            						<td rowspan="2" align="right" bgcolor="#B9D9E9">�������ݣ�</td>
            						<td align="left"><html:textarea property="content" style="border:0" rows="10" cols="60" readonly="true"/></td>
          						</tr>
          						</html:form>
        					</table>
        					<br><a href="<%=request.getContextPath()%><%=hrefpath%>?page=<%=session.getAttribute("currentpage")%>">[����]</a>
						</td>  			
						<td width="13" background="<%=path%>/image/right.jpg"></td>		
  					</tr>
  					<tr><td colspan="4"><jsp:include page="/end.jsp"/></td></tr>
				</table>
			</center>
		</body>
</html>

<%@ page contentType="text/html; charset=gb2312" language="java" errorPage="" %>
<%@ taglib uri="struts-html" prefix="html" %>
<%@ taglib uri="struts-bean" prefix="bean" %>
<%@ taglib uri="struts-logic" prefix="logic" %>
<% String path=request.getContextPath(); %>
<html>
	<head>
		<html:base/>
		<title>�鿴����</title>
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
        				<table width="90%" border="5" cellspacing="0" cellpadding="5" bordercolor="#1687AF" bordercolorlight="#E8F1F6" bordercolordark="#1687AF" rules="none" bgcolor="white">
          					<tr bgcolor="white">
            					<td width="65%" height="25" align="right">&nbsp;
                   					<logic:greaterEqual value="1" name="logonuser" property="userable">
                    				<a href="<%=request.getContextPath()%>/advice/advice_add.do?addtype=link">[���ͽ���]&nbsp;</a>
                   					</logic:greaterEqual>
            					</td>
            					<td width="15%" align="right"><strong>��������&nbsp;&nbsp;</strong></td>
          					</tr>
        				</table>
        				<table width="90%" border="5" cellspacing="0" cellpadding="5" bordercolor="#1687AF" bordercolorlight="#1687AF" bordercolordark="#E8F1F6" rules="none" bgcolor="white">
          					<tr align="left">
            					<td>��������</td>
           						<html:form action="/advice/advice_look" focus="subsqlvalue">
            					<td colspan="3" align="center">
            						����������<html:text property="subsqlvalue" size="35"/>
                					���ͣ�
                					<html:select property="subsql">
                  						<html:options collection="advicetypelist" property="value" labelProperty="label"/>
                					</html:select>
                					<html:submit value="����"/>
            					</td>
            					</html:form>
          					</tr>
          					<tr align="center" bgcolor="#B9D9E9" height="25">
              					<td width="18%">��������</td>
              					<td width="22%">������</td>
              					<td width="24%">����ʱ��</td>
              					<td width="15%">����</td>
          					</tr>
          					<logic:present name="advicelist">
           					<logic:iterate id="advicesigle" name="advicelist"> 
             				<tr height="40">
              					<td align="center"><html:link page="/advice/advice_look_sigle.do" paramId="id" paramName="advicesigle" paramProperty="adviceid"><bean:write name="advicesigle" property="subject"/></html:link></td>
              					<td align="center"><bean:write name="advicesigle" property="sender"/></td>
              					<td align="center"><bean:write name="advicesigle" property="stime"/></td>
              					<td align="center">
               						<logic:greaterEqual value="1" name="logonuser" property="userable">
                					<a href="<%=request.getContextPath()%>/advice/advice_del.do?id=<bean:write name='advicesigle' property='adviceid'/>&page=<%=session.getAttribute("currentpage")%>" onclick="return(confirm('ȷ��Ҫɾ���ü�¼��?'))">[ɾ��]</a>                
               						</logic:greaterEqual>
               						<logic:equal value="0" name="logonuser" property="userable">��Ȩ��</logic:equal>
              					</td>
             				</tr>
           					</logic:iterate>
          					</logic:present>
          					<logic:empty name="advicelist">
             				<tr><td align="center" colspan="4"><li><b>û�м�¼��ʾ!</b></li></td></tr>          
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
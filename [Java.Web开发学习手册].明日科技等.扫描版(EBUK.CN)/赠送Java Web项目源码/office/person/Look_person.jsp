<%@ page contentType="text/html; charset=gb2312" language="java" errorPage="" %>
<%@ taglib uri="struts-html" prefix="html" %>
<%@ taglib uri="struts-bean" prefix="bean" %>
<%@ taglib uri="struts-logic" prefix="logic" %>
<% String path=request.getContextPath(); %>
<html>
	<head>
		<html:base/>
		<title>���Ա��</title>
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
      					<table width="90%" border="5" cellspacing="0" cellpadding="5" bordercolor="#F0F0F0" bordercolorlight="#E8F1F6" bordercolordark="#1687AF" rules="none" bgcolor="white">
        					<tr bgcolor="white">
          						<td width="31%" height="25" align="left">&nbsp;</td>
          						<td width="24%" align="center"><a href="<%=request.getContextPath()%>/person/person_myself_update.do?updatetype=link">[�޸ĸ�����Ϣ]</a></td>
          						<td width="24%" align="center"><a href="<%=request.getContextPath()%>/person/person_add.do?addtype=link">[�����Ա��]</a></td>
          						<td width="21%" align="right"><strong>������Դ����&nbsp;&nbsp;</strong></td>
        					</tr>
      					</table>
			      		<table width="90%" border="5" cellspacing="0" cellpadding="5" bordercolor="#F0F0F0" bordercolorlight="#1687AF" bordercolordark="#E8F1F6" rules="none" bgcolor="white">
        					<html:form action="person/person_look.do" focus="subsqlvalue">
          					<tr height="20">
            					<td>���Ա����Ϣ</td>
            					<td colspan="5" align="center">��������:
              						<html:text property="subsqlvalue" size="35"/>&nbsp;���ͣ�
              						<html:select property="subsql">
                						<html:options collection="personsearchtypelist" property="value" labelProperty="label"/>
              						</html:select>
              						<html:submit value="����"/>
            					</td>
        					</tr>
        					</html:form>
           					<tr height="25" align="center" bgcolor="#B9D9E9">
            					<td width="23%" height="25">�û���</td>
            					<td width="15%">Ȩ��</td>
            					<td width="19%">����</td>
            					<td width="19%" height="25">ְ��</td>
            					<td colspan="2">����</td>
           					</tr>
         					<logic:present name="personlist">
          					<logic:iterate id="usersigle" name="personlist">
           					<tr align="center" height="30">
            					<td><html:link page="/person/person_sigle_look.do" paramId="id" paramName="usersigle" paramProperty="userid"><bean:write name="usersigle" property="username"/></html:link></td>
            					<td>
               						<logic:equal value="2" name="usersigle" property="userable">ϵͳ����Ա</logic:equal>
               						<logic:equal value="1" name="usersigle" property="userable">��ͨ����Ա</logic:equal>
            	   					<logic:equal value="0" name="usersigle" property="userable">�ο�</logic:equal>
            					</td>
            					<td><bean:write name="usersigle" property="userbranch"/></td>
            					<td><bean:write name="usersigle" property="userjob"/></td>
            					<td><a href="<%=request.getContextPath()%>/person/person_update.do?id=<bean:write name="usersigle" property="userid"/>&updatetype=link">[�޸�]</a></td>
            					<td><a href="<%=request.getContextPath()%>/person/person_del.do?id=<bean:write name='usersigle' property='userid'/>&page=<%=session.getAttribute("currentpage")%>" onclick="return(confirm('ȷ��Ҫɾ���ü�¼��?'))" >[ɾ��]</a></td>               
           					</tr>
          					</logic:iterate>
         					</logic:present>
         					<logic:empty name="personlist">
          						<tr><td colspan=6 align=center><b><li>û�м�¼��ʾ!</li></b></td></tr>
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
<%@ page contentType="text/html; charset=gb2312" language="java" errorPage="" %>
<%@ taglib uri="struts-html" prefix="html" %>
<%@ taglib uri="struts-bean" prefix="bean" %>
<%@ taglib uri="struts-logic" prefix="logic" %>
<%
  	session.setAttribute("username","yxq");
	String path=request.getContextPath();
%>
<html>
	<head>
		<html:base/>
		<title>�鿴�����ļ�</title>
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
        				<table width="90%" border="5" cellspacing="0" cellpadding="5" bordercolor="#E8F1F6" bordercolorlight="#E8F1F6" bordercolordark="#1687AF" rules="none" bgcolor="white">
          					<tr>
          						<td height="25" width="70%"><html:errors/></td>
					        	<logic:greaterEqual value="1" name="logonuser" property="userable">
            					<td align="right"><logic:greaterEqual value="1" name="logonuser" property="userable"><html:link page="/file/file_up.do?uptype=link">[�ϴ��ļ�]</html:link></logic:greaterEqual></td>
          						</logic:greaterEqual>
            					<td align="right"><strong>�ļ�����&nbsp;&nbsp;</strong></td>
          					</tr>
        				</table>
        				<table width="90%" border="5" cellspacing="0" cellpadding="0" bordercolor="#1687AF" bordercolorlight="#1687AF" bordercolordark="#E8F1F6" rules="none" bgcolor="white">
          					<tr height="30"><td colspan="6">����ļ�</td></tr>
          					<tr align="center" bgcolor="#B9D9E9" height="40">
            					<td width="20%">�ļ���</td>
            					<td width="10%">�ϴ���</td>
            					<td width="15%">�ļ���С</td>
					            <td width="13%">�ϴ�ʱ��</td>
            					<td width="7%">����</td>
            					<td width="23%">����</td>
          					</tr>
          					<logic:present name="filelist">
           					<logic:iterate id="filesigle" name="filelist">
           					<html:form action="/file/file_del.do">
            				<html:hidden name="filesigle" property="fileid"/>
            				<input type="hidden" name="page" value="<%=session.getAttribute("currentpage")%>">
           					<tr height="40">
            					<td height="30" align="center" title="�鿴��ϸ��Ϣ"><a href="<%=request.getContextPath()%>/file/Look_siglefile.jsp?id=<bean:write name='filesigle' property='fileid'/>"><html:text name="filesigle" property="filename" size="25" style="border:0;cursor:hand" readonly="true" /></a></td>
            					<td height="30" align="center"><bean:write name="filesigle" property="fileuper"/></td>
            					<td align="center"><bean:write name="filesigle" property="filesize"/></td>
            					<td height="30" align="center"><bean:write name="filesigle" property="fileuptime"/></td>
            					<td align="center"><a href="<%=request.getContextPath()%>/file/file_download.do?id=<bean:write name='filesigle' property='fileid'/>&filename=<bean:write name='filesigle' property='filename'/>">����</a></td>
            					<td height="30" align="center" width="8%">
             						<logic:equal value="0" name="logonuser" property="userable">��Ȩ��</logic:equal>
             						<logic:greaterEqual value="1" name="logonuser" property="userable">
             						<html:submit value="ɾ��" onclick="return(confirm('ȷ��Ҫɾ���ü�¼��?'))"/>&nbsp;<html:checkbox name="filesigle" property="delete" value="true">&nbsp;ɾ�������ļ�!</html:checkbox>
              						</logic:greaterEqual>
            					</td>
	          				</tr>
    	      				</html:form>
        	  				</logic:iterate>
         					</logic:present>
         					<logic:empty name="filelist">
          					<tr><td colspan="6" align="center"><li><b>û�м�¼��ʾ!</b></li></td></tr>
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
<%@ page contentType="text/html; charset=gb2312" language="java" errorPage="" %>
<%@ taglib uri="struts-html" prefix="html" %>
<%@ taglib uri="struts-bean" prefix="bean" %>
<%@ taglib uri="struts-logic" prefix="logic" %>
<%@ taglib uri="office" prefix="office" %>
<% String contentPath=request.getContextPath(); %>

<html>
	<head><title>������</title></head>
	<body>
	<table width="224" cellspacing="0" cellpadding="0" bordercolor="#7CADD6" bgcolor="#F2FBFF">
		<!-- ��ʾ��¼�û���Ϣ -->
		<tr height="30">
			<td style="text-indent:5">
				<img src="<%=contentPath%>/image/welcome.jpg"> ��ӭ��¼!
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="<%=request.getContextPath()%>/person/person_myself_look.do">[������Ϣ]</a>
			</td>
		</tr>
		<tr>
			<td align="center">
				<table background="<%=request.getContextPath()%>/image/myinfo.jpg" width="214" height="100"  border="0" cellspacing="0" cellpadding="0">
      				<logic:present name="logonuser">
       				<tr height="5"><td colspan="2"></td></tr>
       				<tr>
        				<td height="20" width="40%" align="right">�� ӭ ����</td>
	        			<td height="20"><bean:write name="logonuser" property="username"/></td>
    	   			</tr>
       				<tr bordercolor="#CCCCCC">
        				<td height="20" align="right">��&nbsp;&nbsp;&nbsp;&nbsp;�ݣ�</td>
        				<td height="20">
        					<logic:equal value="2" name="logonuser" property="userable">ϵͳ����Ա</logic:equal>
	                       	<logic:equal value="1" name="logonuser" property="userable">��ͨ����Ա</logic:equal>
    	                    <logic:equal value="0" name="logonuser" property="userable">�ο�</logic:equal>
        				</td>     
       				</tr>
       				<tr bordercolor="#CCCCCC">
	        			<td height="20" align="right"><nobr>ְ&nbsp;&nbsp;&nbsp;&nbsp;��</nobr></td>
				        <td height="20"><bean:write name="logonuser" property="userjob"/></td>
				    </tr>
       				<tr bordercolor="#CCCCCC">
        				<td height="20" align="right"><font color="black"><nobr>���ʴ�����</nobr></td>
        				<td height="20"><bean:write name="logonuser" property="useraccesstimes"/> ��</td>
	       			</tr>
    	   			<tr height="5"><td colspan="2"></td></tr>
      				</logic:present>
				    <logic:notPresent name="logonuser">
      				<tr>
       					<td height="70" align="center">
	       					<logic:equal value="exit" parameter="type">���Ѿ���ȫ�˳�����ر��������</logic:equal>
    	   					<logic:notEqual value="exit" parameter="type"> �Ƿ���¼��<a href="<%=request.getContextPath()%>/index.jsp">[��������¼]��</a></logic:notEqual>
       					</td>
      				</tr>
      				</logic:notPresent>
	    		</table>
   			</td>
	  	</tr>
	  	<!-- ��ʾ���ܲ˵� -->  
  		<tr><td height="30" style="text-indent:5"><img src="<%=contentPath%>/image/whatdo.jpg"> ������ʲô��</td></tr>
  		<tr><td align="center"><office:Menu/></td></tr>
	  	<tr height="5"><td></td></tr>
	</table>
	</body>
</html>

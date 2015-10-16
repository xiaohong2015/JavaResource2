<%@ page  contentType="text/html;charset=GBK" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
	<head>
		<title>EditDepart.jsp</title>
		<link href="images/style.css" rel="stylesheet" type="text/css"/>
		<link href="images/editdepartstyle.css" rel="stylesheet" type="text/css"/>
		<script language="JavaScript" src="images/manage.js"></script>
	</head>
	<body>
		<div id="contain">
		<s:form onsubmit="return editdepartcheck();" theme="simple" action="editDepartSave" method="post">
		<table>
			<caption>������ϸ��Ϣ</caption>
			<tr>
				<td class="tdtitle">���ű��</td>
				<td class="tddata"><s:property value="departId"/></td>
				<td class="tdtitle">��������</td>
				<td><s:textfield name="departName" id="departName"/></td>
			</tr>
			<tr>
				<td class="tdtitle">��ְ����</td>
				<td class="tddata"><s:property value="departNum"/></td>
				<td  class="tdtitle"></td>
				<td class="tddata"></td>
			</tr>
		</table>
		<fieldset>
			<legend>��������</legend>
			<s:textarea name="departDescrip" cols="80" rows="19" id="departDescrip"></s:textarea>
		</fieldset><br>
		<s:submit value="�����޸�"/>
		</s:form>
	</div>
	<s:if test="(read==false)">
	<script language="JavaScript">
	
		window.onload=alertResult;
		
		function alertResult()
		{
			alert("<s:property value="result"/>");
		}
		
	</script>
	</s:if>
	</body>
</html>
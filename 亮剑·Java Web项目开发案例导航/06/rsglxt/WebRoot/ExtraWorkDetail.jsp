<%@ page  contentType="text/html;charset=GBK" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
	<head>
		<title>ExtraWorkDetail.jsp</title>
		<link href="images/style.css" rel="stylesheet" type="text/css"/>
		<link href="images/editdepartstyle.css" rel="stylesheet" type="text/css"/>
	</head>
	<body>
		<div id="contain">
		<s:form theme="simple">
		<table>
			<caption>�Ӱ���ϸ��Ϣ</caption>
			<tr>
				<td class="tdtitle">ְ�����</td>
				<td class="tddata"><s:property value="extraWork.impId"/></td>
				<td class="tdtitle">ְ������</td>
				<td class="tddata"><s:property value="extraWork.impName"/></td>
			</tr>
			<tr>
				<td class="tdtitle">��������</td>
				<td class="tddata"><s:property value="extraWork.departName"/></td>
				<td  class="tdtitle">�Ӱ�����</td>
				<td class="tddata"><s:property value="extraWork.workTime"/></td>
			</tr>
		</table>
		<fieldset>
			<legend>�Ӱ�ԭ��</legend>
			<s:property value="extraWork.executes"/>
		</fieldset><br>
		</s:form>
	</div>
	</body>
</html>
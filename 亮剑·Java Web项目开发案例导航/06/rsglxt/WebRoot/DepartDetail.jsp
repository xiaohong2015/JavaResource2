<%@ page contentType="text/html; charset=GBK" language="java"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<html>
	<head>
		<title>������ϸ��Ϣ</title>
		<link href="images/style.css" rel="stylesheet" type="text/css"/>
		<link href="images/departDetail.css" rel="stylesheet" type="text/css"/>
	</head>
	<body>
	<div id="contain">
		<table>
			<caption>������ϸ��Ϣ</caption>
			<tr>
				<td class="tdtitle">���ű��</td>
				<td class="tddata"><s:property value="department.departId"/></td>
				<td class="tdtitle">��������</td>
				
				<td class="tddata"><s:property value="department.departName"/></td>
			</tr>
			<tr>
				<td class="tdtitle">��ְ����</td>
				<td class="tddata"><a href="departImp.action?departId=<s:property value="departId"/>" target="_blank" alt="����鿴��ϸְ����Ϣ"><s:property value="department.departNum"/></a></td>
				<td  class="tdtitle"></td>
				<td class="tddata"></td>
			</tr>
		</table>
		<fieldset>
			<legend>��������</legend>
			<p><s:property value="department.departDescrip"/></p>
		</fieldset>
	</div>
	</body>
</html>
<%@ page contentType="text/html; charset=GBK" language="java"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<html>
	<head><meta http-equiv="Content-Type" content="text/html; charset=GBK"/>
		<title><s:text name="mainmanage.title"/></title>
		<link href="images/style.css" rel="stylesheet" type="text/css"/>
		<link href="images/qingjiadetail.css" rel="stylesheet" type="text/css"/>
	</head>
	<body>
	<div id="container">
		<table>
			<caption>�����ϸ��Ϣ</caption>
			<tr>
				<td>ְ�����:</td>
				<td><s:property value="holsinfo.impId"/></td>
				<td>ְ������:</td>
				<td><s:property value="holsinfo.impName"/></td>
			</tr>
			<tr>
				<td>����ʱ��:</td>
				<td><s:property value="holsinfo.applyTime"/></td>
				<td>����:</td>
				<td><s:property value="holsinfo.holdays"/></td>
			</tr>
			<tr>
				<td>��ʼʱ��:</td>
				<td><s:property value="holsinfo.startTime"/></td>
				<td>����ʱ��:</td>
				<td><s:property value="holsinfo.endTime"/></td>
			</tr>
		</table>
		<fieldset>
			<legend>���ԭ��:</legend>
			<p><s:property value="holsinfo.executes"/></p>
		</fieldset>
	</div>
	</body>
</html>
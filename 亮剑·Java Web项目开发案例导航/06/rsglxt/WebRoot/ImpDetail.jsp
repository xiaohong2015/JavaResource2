<%@ page contentType="text/html; charset=GBK" language="java"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<html>
	<head>
		<title>ְ����ϸ��Ϣ</title>
		<link href="images/style.css" rel="stylesheet" type="text/css"/>
		<link href="images/impdetail.css" rel="stylesheet" type="text/css"/>
		<script language="JavaScript" src="images/manage.js"></script>
	</head>
	<body>
	<div id="container1">
		<div id="infohead"><s:property value="imp.impName"/>����ϸ��Ϣ</div>
		<div id="pic">
			<div style="height:175;width:200px;">
			<img id="personpic" src="<s:property value="imp.impPic"/>" onload="changePic('personpic');">
			</div>
			
			<span><s:property value="imp.impName"/>��ͷ��</span>
		</div>
	
		<div id="info">
			<table>
				<tr class="evenrow">
					<td>ְ����ţ�</td>
					<td><s:property value="imp.impId"/></td>
				</tr>
				<tr class="oddrow">
					<td>ְ��������</td>
					<td><s:property value="imp.impName"/></td>
				</tr>
				<tr class="evenrow">
					<td>ְ���Ա�</td>
					<td><s:property value="imp.impGender"/></td>
				</tr>
				<tr class="oddrow">
					<td>�������ڣ�</td>
					<td><s:property value="imp.impBirth"/></td>
				</tr>
				<tr class="evenrow">
					<td>�������䣺</td>
					<td><s:property value="imp.impEmail"/></td>
				</tr>
				<tr class="oddrow">
				 	<td>���˵绰��</td>
					<td><s:property value="imp.impTel"/></td>
				</tr>
				<tr class="evenrow">
					<td>�������ţ�</td>
					<td><s:property value="imp.departName"/></td>
				</tr>
				<tr class="oddrow">
					<td>ְ  λ��</td>
					<td><s:property value="imp.impRoll"/></td>
				</tr>
				<tr class="evenrow">
					<td>н  �ʣ�</td>
					<td><s:property value="imp.impSalary"/></td>
				</tr>
			</table>
		</div>
		<div style="clear:both;"></div>
		<div id="jianli">
			<fieldset>
				<legend>���˼���</legend>
				
				<p><s:property value="imp.impBio"/></p>
			</fieldset>
		</div>
	</div>
	</body>
</html>
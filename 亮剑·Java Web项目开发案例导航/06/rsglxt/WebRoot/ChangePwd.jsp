<%@ page contentType="text/html; charset=GBK" language="java"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<html>
	<head><meta http-equiv="Content-Type" content="text/html; charset=GBK"/>
		<title><s:text name="mainmanage.title"/></title>
		<link href="images/style.css" rel="stylesheet" type="text/css"/>
		<link href="images/mainstyle.css" rel="stylesheet" type="text/css"/>
		<link href="images/departListstyle.css" rel="stylesheet" type="text/css"/>
		<script language="JavaScript" src="images/manage.js"></script>
		<s:head/>
	</head>
	<body>
	<div id="container">
		<div id="tophead">
			<s:include value="Top.jsp"/>
		</div>
		<div id="leftcontent">
			<s:include value="LeftTree2.jsp"/>
		</div>
		<div id="maincontent">
		<s:form theme="simple" action="changePwd" onsubmit="return changepwd();">
			<table cellSpacing=0 cellPadding=0 width=620 align=center border=0 style="margin-top:35px;">
				<tr bgColor="#edf2fc" height=24>
					<td colspan="3">&nbsp;<font color="#2d5bbb" size=""><b>�޸�����</b></td>
				</tr>
				<tr>
					<td style="width:200px;color:#404040;font-size:14px;" bgcolor="white" align="right">
						<FONT color=#d11b00>*</FONT>&nbsp;���ľ�����:
					</td>
					<td align="left" style="width:205px">
						<s:password name="oldpwd" id="oldpwd" cssStyle="width:200px;border-color:#edf2fc"/>
					</td>
					<td align="left"><font color="red" size="2" style="display:none" id="oldpass">*�����벻��Ϊ��</td>
				</tr>
				<tr>
					<td style="width:200px;color:#404040;font-size:14px;" bgcolor="white" align="right">
						<FONT color=#d11b00>*</FONT>&nbsp;����������:
					</td>
					<td align="left" style="width:205px">
						<s:password name="newpwd" id="newpwd" cssStyle="width:200px;border-color:#edf2fc"/>
					</td>
					<td align="left"><font color="red" size="2" style="display:none" id="newpass">*�����벻��Ϊ��</font></td>
				</tr>
				<tr>
					<td style="width:200px;color:#404040;font-size:14px;" bgcolor="white" align="right">
						<FONT color=#d11b00>*</FONT>&nbsp;�ٴ�����������:
					</td>
					<td align="left" style="width:205px">
						<s:password name="renewpwd" id="renewpwd" cssStyle="width:200px;border-color:#edf2fc"/>
					</td>
					<td align="left"><font color="red" size="2" style="display:none" id="repass">*���ٴ�����������</td>
				</tr>
				<tr bgColor="#edf2fc" height=30>
					<td colspan="3" align="center">
						<s:submit value="ȷ  ��" cssStyle="width:80px;height:23px;CURSOR:hand;"/>
						&nbsp;&nbsp
						<s:reset value="��  ��" cssStyle="width:80px;height:23px;CURSOR:hand;"/>
						&nbsp;&nbsp&nbsp;&nbsp
					</td>
				</tr>
			</table>
		</s:form>
		<script language="JavaScript">
			var result="<s:property value="result"/>";
			if(result!="")
			{
				alert(result);
			}
		</script>
		</div>
		
	</div>
	
	</body>
</html>
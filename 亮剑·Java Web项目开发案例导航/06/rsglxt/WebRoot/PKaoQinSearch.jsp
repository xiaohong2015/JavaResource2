<%@ page contentType="text/html; charset=GBK" language="java"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<html>
	<head><meta http-equiv="Content-Type" content="text/html; charset=GBK"/>
		<title><s:text name="mainmanage.title"/></title>
		<link href="images/style.css" rel="stylesheet" type="text/css"/>
		<link href="images/mainstyle.css" rel="stylesheet" type="text/css"/>
		<link href="images/departListstyle.css" rel="stylesheet" type="text/css"/>
		<link href="images/impdetail.css" rel="stylesheet" type="text/css"/>
		<script language="JavaScript">
		function mymouseout(id,styleclass)
		{
			document.getElementById(id).className=styleclass;
		}
		</script>
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
		<s:form theme="simple" action="pKaoQin">
			<table>
				<tr>
					<td>��ѡ��ʱ���<s:datetimepicker name="from_day" toggleType="explode" value="today"/></td>
					<td>��<s:datetimepicker name="to_day" toggleType="explode" value="today"/><s:submit value="ȷ��"/></td>
				</tr>
			</table>
		</s:form>
		</div>
	</div>
	</body>
</html>
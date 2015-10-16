<%@ page contentType="text/html; charset=GBK" language="java"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<html>
	<head><meta http-equiv="Content-Type" content="text/html; charset=GBK"/>
		<title><s:text name="mainmanage.title"/></title>
		<link href="images/style.css" rel="stylesheet" type="text/css"/>
		<link href="images/mainstyle.css" rel="stylesheet" type="text/css"/>
		<link href="images/qiandao.css" rel="stylesheet" type="text/css"/>
		<s:head/>
	</head>
	<body>
	<div id="container">
		<div id="tophead">
			<s:include value="Top.jsp"/>
		</div>
		<div id="leftcontent">
			<s:include value="LeftTree.jsp"/>
		</div>
		<div id="maincontent">
			<s:form theme="simple" method="post" action="comSalaryOp">
				<span class="choseinfo">��ѡ���·ݣ�</span>
				<s:datetimepicker name="salaryMonth" toggleType="explode" value="today" displayFormat="yyyy-MM"/>
				<s:submit value="���ɹ��ʱ�" cssClass="shengcheng"/>
				<s:fielderror cssClass="fielderr"/>
			</s:form>
			
		</div>
	</div>
		<script language="JavaScript">
					result="<s:property value="result"/>";
					if(result!="")
					{
						alert(result);
					}
		</script>
	</body>
</html>
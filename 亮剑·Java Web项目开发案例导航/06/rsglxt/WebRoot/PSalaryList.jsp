<%@ page contentType="text/html; charset=GBK" language="java"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<html>
	<head><meta http-equiv="Content-Type" content="text/html; charset=GBK"/>
		<title><s:text name="mainmanage.title"/></title>
		<link href="images/style.css" rel="stylesheet" type="text/css"/>
		<link href="images/mainstyle.css" rel="stylesheet" type="text/css"/>
		<link href="images/departListstyle.css" rel="stylesheet" type="text/css"/>
		<script language="JavaScript">
		function mymouseout(id,styleclass)
		{
			document.getElementById(id).className=styleclass;
		}
		function checkmax1()
		{
			var total=<s:property value="maxPage"/>
			var page=document.getElementById("aimpage").value;
			if(page>total)
			{
				alert("�������ҳ��");
				
				return false;
			}
			else
			{
				return true;
			}
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
			<table border="1" bgcolor="#e2e2e2" cellspacing="1" align="center" width="100%">
				<caption><h4>н���б�</h4></caption>
				<tr class="headerClass">
					<th>ְ�����</th>
					<th>��������</th>
					<th>��</th>
					<th>��</th>
					<th>����н��</th>
					<th>�Ӱ��</th>
					<th>��ٷ�</th>
					<th>ȱ�ڷ�</th>
					<th>�ܼ�</th>
					<th>״̬</th>
				</tr>
				<s:iterator id="salaryList" value="salaryList" status="salary">
					<tr id="salary<s:property value="#salary.index"/>"
						<s:if test="#salary.odd">class="oddRow"</s:if>
						<s:else>class="evenRow"</s:else>
						onmouseover="this.className='selectedRow';" 
						onmouseout="mymouseout('salary<s:property value='#salary.index'/>',
						<s:if test='#salary.odd'>'oddRow'</s:if>
						<s:else>'evenRow'</s:else>);" 
						>
						<td><s:property value="impId"/></td>
						<td><s:property value="impName"/></td>
						<td><s:property value="opyear"/></td>
						<td><s:property value="opmonth"/></td>
						
						<td><s:property value="sBase"/></td>
						<td><s:property value="sExtra"/></td>
						<td><s:property value="sHoliday"/></td>
						<td><s:property value="sAbsence"/></td>
						
						<td><s:property value="sTotal"/></td>
						<td><s:property value="sState==0?'δ����':'�ѷ���'"/></td>
						
					</tr>
				</s:iterator>
			</table>
		
		
			<table border="0" align="center" width="100%px" cellspacing="0" cellpadding="0">
				<tr>
					<td><span class="gongye"><s:text name="impleeyList.gong"/><s:property value="maxPage"/><s:text name="impleeyList.ye"/></span></td>
					<td><span class="gongye"><s:property value="totalMessage"/><s:text name="impleeyList.jilushu"/></span></td>
					<td style="width:100px;">
					<s:form action="pSalaryList" >
						<s:select name="pageSpan" 
						list="spanList" listKey="key" listValue="value" onchange="this.form.submit();"/>
					</s:form>
					</td>
					<td style="width:60px;">
						<span style="font-size:14px;">
						<s:if test="currenPage>1">
							<a href="pSalaryList.action?currenPage=<s:property value="currenPage-1"/>"><s:text name="impleeyList.shangye"/></a>
						</s:if>
						</span>
					</td>
					<td style="width:60px;">
						<span style="font-size:14px;">
						<s:if test="currenPage<maxPage">
						<a href="pSalaryList.action?currenPage=<s:property value="currenPage+1"/>"><s:text name="impleeyList.xiaye"/></a>
						</s:if>
						</span>
					</td>
					<td>
						<span class="gongye">
						<s:form action="pSalaryList" onsubmit="return checkmax1();" theme="simple">
						<s:text name="impleeyList.tiaozhuan"/><s:textfield id="aimpage" name="currenPage" onmouseover="this.select();" cssClass="yeinput"/><s:text name="impleeyList.ye"/>
						<s:submit value="%{getText(\"impleeyList.queding\")}" cssClass="queding"/>
						</s:form>
						</span>
					</td>
				</tr>
			</table>
		</div>
	</div>
	</body>
</html>
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
				<caption><h4>�������б�</h4></caption>
				<tr class="headerClass">
					<th>ְ�����</th>
					<th>����</th>
					<th>����</th>
					<th>����ʱ��</th>
					<th>��ʼʱ��</th>
					<th>��ֹʱ��</th>
					<th>ԭ��</th>
					<th>״̬</th>
					<th>^_^</th>
				</tr>
				<s:iterator id="applyList" value="applyList" status="apply">
					<tr id="apply<s:property value="#apply.index"/>"
						<s:if test="#apply.odd">class="oddRow"</s:if>
						<s:else>class="evenRow"</s:else>
						onmouseover="this.className='selectedRow';" 
						onmouseout="mymouseout('apply<s:property value='#apply.index'/>',
						<s:if test='#apply.odd'>'oddRow'</s:if>
						<s:else>'evenRow'</s:else>);" 
						>
						<td><s:property value="impId"/></td>
						<td><s:property value="impName"/></td>
						<td><s:property value="departName"/></td>
						<td><s:property value="applyTime"/></td>
						
						<td><s:property value="startTime"/></td>
						<td><s:property value="endTime"/></td>
						<td><s:property value="executes"/></td>
						<td>
							<s:property value="holsState==0?'δ����':''"/>
							<s:property value="holsState==1?'ͬ��':''"/>
							<s:property value="holsState==2?'����':''"/>
							<s:property value="holsState==3?'�ܾ�':''"/>
						</td>
						
						<td>
						
						
							<a href="cheXiaoApply.action?currenPage=<s:property value="currenPage"/>&type=2&endTime=<s:property value="endTime"/>&oImpId=<s:property value="impId"/>&startTime=<s:property value="startTime"/>"><s:property value="holsState==0?'����':''"/></a>
							<s:property value="holsState!=0?'---':''"/>
						</td>
				
					</tr>
				</s:iterator>
			</table>
		
		
			<table border="0" align="center" width="100%px" cellspacing="0" cellpadding="0">
				<tr>
					<td><span class="gongye"><s:text name="impleeyList.gong"/><s:property value="maxPage"/><s:text name="impleeyList.ye"/></span></td>
					<td><span class="gongye"><s:property value="totalMessage"/><s:text name="impleeyList.jilushu"/></span></td>
					<td style="width:100px;">
					<s:form action="appSearch" >
						<s:select name="pageSpan" 
						list="spanList" listKey="key" listValue="value" onchange="this.form.submit();"/>
					</s:form>
					</td>
					<td style="width:60px;">
						<span style="font-size:14px;">
						<s:if test="currenPage>1">
							<a href="appSearch.action?currenPage=<s:property value="currenPage-1"/>&departId=<s:property value="departId"/>"><s:text name="impleeyList.shangye"/></a>
						</s:if>
						</span>
					</td>
					<td style="width:60px;">
						<span style="font-size:14px;">
						<s:if test="currenPage<maxPage">
						<a href="appSearch.action?currenPage=<s:property value="currenPage+1"/>&departId=<s:property value="departId"/>"><s:text name="impleeyList.xiaye"/></a>
						</s:if>
						</span>
					</td>
					<td>
						<span class="gongye">
						<s:form action="appSearch" onsubmit="return checkmax1();" theme="simple">
						<s:textfield name="departId" cssStyle="display:none"/>
						<s:text name="impleeyList.tiaozhuan"/><s:textfield name="currenPage" id="aimpage" onmouseover="this.select();" cssClass="yeinput"/><s:text name="impleeyList.ye"/>
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
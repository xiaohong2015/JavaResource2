<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<html>
	<head>
		<title><s:text name="mainmanage.title"/></title>
		<link href="images/style.css" rel="stylesheet" type="text/css"/>
		<link href="images/mainstyle.css" rel="stylesheet" type="text/css"/>
		<link href="images/impListstyle.css" rel="stylesheet" type="text/css"/>
		<script language="JavaScript">
		function mymouseout(id,styleclass)
		{
			document.getElementById(id).className=styleclass;
		}
		</script>
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
		<s:form theme="simple" >
		<table width="100%" style="color:#404040;font-size:14px;text-align:center;" >
			<tr>
				<td>
					����:<s:select name="departId" label="" labelposition="left" list="departList" listKey="key" listValue="value"/>
				</td>
				<td>
					ְ�����:<s:textfield name="impId" cssStyle="width:70px;"/>
				</td>
				<td>
				ְ������:<s:textfield name="impName" cssStyle="width:70px;"/>
				</td>
				<td>
				н��:<s:textfield name="downSalary" cssStyle="width:60px;"/>��<s:textfield name="upSalary" cssStyle="width:60px;"/>
				</td>
				<td>
					<s:submit value="ȷ��"/>
				</td>
			</tr>
		</table>
		</s:form>
			<s:if test="impList.size()!=0">
				
				<table border="1" bgcolor="#e2e2e2" cellspacing="1" align="center" width="770px">
				
					<tr class="headerClass">
						<th>���</th>
						<th>����</th>
						<th>�Ա�</th>
						<th>��������</th>
						<th>��������</th>
						<th>ְλ</th>
						<th>����н��</th>
						<th>�绰</th>
						<th>��ϸ��Ϣ</th>
						<th>^_^</th>
					</tr>
					<s:iterator id="impList" value="impList" status="imp">
						<tr id="imp<s:property value="#imp.index"/>"
							<s:if test="#imp.odd">class="oddRow"</s:if>
							<s:else>class="evenRow"</s:else>
							onmouseover="this.className='selectedRow';" 
							onmouseout="mymouseout('imp<s:property value='#imp.index'/>',
							<s:if test='#imp.odd'>'oddRow'</s:if>
							<s:else>'evenRow'</s:else>);" 
							>
							<td><s:property value="impId"/></td>
							<td><s:property value="impName"/></td>
							<td><s:property value="impGender"/></td>
							<td><s:property value="impBirth"/></td>
							<td><s:property value="departName"/></td>
							<td><s:property value="impRoll"/></td>
							<td><s:property value="impSalary"/></td>
							<td><s:property value="impTel"/></td>
							<td><a href="impDetail.action?impId=<s:property value="impId"/>" target="_blank">�鿴</a></td>
							<td>
								<a href="editImpbase.action?editImpId=<s:property value="impId"/>" target="_blank">�༭</a>/<a href="delImp.action?delImpId=<s:property value="impId"/>">ɾ��</a>
							</td>
						</tr>
					</s:iterator>
				</table>
				
				<div id="buttomop">
				<div class="info">
				<span class="totalpage"><s:text name="impleeyList.gong"/><s:property value="maxPage"/><s:text name="impleeyList.ye"/></span>
				<span class="totalnum"><s:property value="totalMessage"/><s:text name="impleeyList.jilushu"/></span>
				</div>
				<div class="pageop">
				<s:form action="searchImp" >
				<s:select name="pageSpan" id="pagespan"
				list="spanList" listKey="key" listValue="value" onchange="this.form.submit();"/>
				</s:form>
				<span class="shangye">
					<s:if test="currenPage>1">
						<a href="searchImp.action?currenPage=<s:property value="currenPage-1"/>"><s:text name="impleeyList.shangye"/></a>
					</s:if>
				</span>
				<span class="xiaye">
				<s:if test="currenPage<maxPage">
					<a href="searchImp.action?currenPage=<s:property value="currenPage+1"/>"><s:text name="impleeyList.xiaye"/></a>
				</s:if>
				</span>
				<s:form action="searchImp" theme="simple">
					<span class="tiaozhuan"><s:text name="impleeyList.tiaozhuan"/></span>
					<s:textfield name="currenPage" cssClass="yefield" onmouseover="this.select();"/><span class="ye"><s:text name="impleeyList.ye"/></span>
					<s:submit value="%{getText(\"impleeyList.queding\")}" cssClass="queding"/>
					
				</s:form>
				
				</div>
			
				</div>	
				
			</s:if>
			<s:else>
				<p>û����Ӧ��ְ����Ϣ</p>
			</s:else>
			
		</div>
	</div>	
	</body>
</html>
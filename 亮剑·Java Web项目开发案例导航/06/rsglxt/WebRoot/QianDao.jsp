<%@ page contentType="text/html; charset=GBK" language="java"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<html>
	<head><meta http-equiv="Content-Type" content="text/html; charset=GBK"/>
		<title><s:text name="mainmanage.title"/></title>
		<link href="images/style.css" rel="stylesheet" type="text/css"/>
		<link href="images/mainstyle.css" rel="stylesheet" type="text/css"/>
		<link href="images/qiandao.css" rel="stylesheet" type="text/css"/>
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
			
			<div>
			<s:form action="qianDao2" theme="simple">
				<span style="font-size:14px;color:#404040">������ְ���ţ�</span>
				<s:textfield name="impId" cssStyle="height:20px;"/>
				<s:submit value="ǩ��" cssClass="tiaozhuan"/>
			</s:form>
				<table border="1" bgcolor="#e2e2e2" cellspacing="1" align="center" width="770px">
				<caption><h4>ְ��ǩ����</h4></caption>
					<tr class="headerClass">
						<th>ְ�����</th>
						<th>ְ������</th>
						<th>��������</th>
						<th>����</th>
						<th>״̬</th>
						<th>^_^</th>
					</tr>
					<s:iterator id="qianDaoList" value="qianDaoList" status="qiandaorecord">
						<tr id="qiandaorecord<s:property value="#qiandaorecord.index"/>"
							<s:if test="#qiandaorecord.odd">class="oddRow"</s:if>
							<s:else>class="evenRow"</s:else>
							onmouseover="this.className='selectedRow';" 
							onmouseout="mymouseout('qiandaorecord<s:property value='#qiandaorecord.index'/>',
							<s:if test='#qiandaorecord.odd'>'oddRow'</s:if>
							<s:else>'evenRow'</s:else>);" 
							>
							<td><s:property value="impId"/></td>
							<td><s:property value="impName"/></td>
							<td><s:property value="departName"/></td>
							<td><s:property value="date"/></td>
							<td><s:property value="state==0?'ȱ��':(state==1?'��ְ':'���')"/></td>
							<td>
								<a href="qianDao2.action?impId=<s:property value="impId"/>"><s:property value="state==0?'ǩ��':''"/></a>
								<s:property value="state!=0?'---':''"/>
							</td>
						</tr>
					</s:iterator>
				</table>
				<div>
				<s:form theme="simple" action="qianDao">	
					<table width="770px">
						<td style="width:400px;font-size:14px;color:#404040">��<s:property value="maxPage"/>ҳ
						<s:property value="totalMessage"/>����¼</td>
						<td>
						<s:form action="qianDao" >
						<s:select name="pageSpan" 
						list="spanList" listKey="key" listValue="value" onchange="this.form.submit();"/>
						</s:form>
						</td>
						<td style="width:400px;font-size:14px;">
							<s:if test="currenPage>1">
								<a href="qianDao.action?currenPage=<s:property value="currenPage-1"/>">��һҳ</a>
							</s:if>
						</td>
						<td style="width:400px;font-size:14px;">
							<s:if test="currenPage<maxPage">
							<a href="qianDao.action?currenPage=<s:property value="currenPage+1"/>">��һҳ</a>
							</s:if>
						</td>
						<td style="width:400px;font-size:14px;color:#404040">
							��ת����<s:textfield name="currenPage" cssStyle="width:20px;height:20px;" onmouseover="this.select();"/>ҳ
							<s:submit value="��ת" cssClass="tiaozhuan"/>
						</td>
					</table>
				</s:form>	
				</div>
				<s:if test="read==false">
					<script language="JavaScript">
					alert("<s:property value="result"/>");
					</script>
				</s:if>
			</div>
		</div>
	</div>
	</body>
</html>
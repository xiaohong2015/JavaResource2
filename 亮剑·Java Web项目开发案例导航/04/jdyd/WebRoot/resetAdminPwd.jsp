<%@page contentType="text/html;charset=GBK"%>
<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<f:view> 
 <html>
  <head>
    <title>A10�Ƶ�Ԥ�����Ļ�ӭ��</title>
    <link rel="stylesheet" type="text/css" href="script/main.css"/>
    <link rel="stylesheet" type="text/css" href="script/style.css"/>
    <script language="JavaScript" src="script/resetAdminPwd.js"></script>
  </head>
  <body>
  	<div class="MainBox">
	  	<%@ include file="adminTop.jsp" %>
	  	<span style="margin-left:5px;margin-bottom:0px;">
	  		<h:outputText value="��ҳ >> ��������"></h:outputText>
	  		
	  	</span>
		<h:panelGroup rendered="#{ALBean.aid!=null&&ALBean.super}">
	  		<h:form id="resetPwd" onsubmit="return checkResetPwd();">
			  	<table class="RegBox" align="center" border="0" width="520" style="margin-top:40;"
			  	 cellpadding="0" cellspacing="0">
			  		<caption style="font-size:18px;margin-bottom:20px;">���ù���Ա����</caption>			  		
			  		<tr>
			  			<td align="right"><h:outputText value="����Ա����"/></td>
			  			<td width="180">
			  				<h:inputText id="aname" value="#{RPBean.aname}" styleClass="input"/>			  				
			  			</td>
			  			<td><h:outputText value=" Ҫ��������Ĺ���Ա��"/></td>
			  		</tr>
			  		<tr>
			  			<td align="right"><h:outputText value="�����룺"/></td>
			  			<td>
			  				<h:inputSecret id="pwd" value="#{RPBean.newPwd}" styleClass="input"/>			  				
			  			</td>
			  			<td><h:outputText value=" ����ù���Ա��������"/></td>
			  		</tr>
			  		<tr>
			  			<td align="right"><h:outputText value="ȷ�����룺"/></td>
			  			<td>
			  				<h:inputSecret id="rePwd" value="#{RPBean.reNewPwd}" styleClass="input"/>			  				
			  			</td>
			  			<td align="left"><h:outputText value=" �ٴ���������"/></td>
			  		</tr>
			  		<tr>
			  			<td>&nbsp;</td>
			  			<td align="center">
				  			<h:commandButton value="�ύ" styleClass="button" action="#{RPBean.reset}"/>
							&nbsp;<h:commandButton value="����" styleClass="button" type="reset"/>							
						</td>
						<td>&nbsp;<h:outputText value="#{RPBean.message}" style="color:red;vertical-align:middle;"/></td>
			  		</tr>
			  	</table>
		  	</h:form>
	  	</h:panelGroup>

  	</div>
  	</body>
 </html>
 </f:view>
 

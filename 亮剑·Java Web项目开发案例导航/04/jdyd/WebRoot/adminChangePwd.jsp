<%@page contentType="text/html;charset=GBK"%>
<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<f:view> 
 <html>
  <head>
    <title>A10�Ƶ�Ԥ�����Ļ�ӭ��</title>
    <link rel="stylesheet" type="text/css" href="script/main.css"/>
    <link rel="stylesheet" type="text/css" href="script/style.css"/>
    <script language="JavaScript" src="script/adminChangePwd.js"></script>
  </head>
  <body>
  	<div class="MainBox">
	  	<%@ include file="adminTop.jsp" %>	  	
	  	<span style="margin-left:5px;">
	  		<h:outputText value="��ҳ >> �޸�����"></h:outputText>	  	
	  	</span>
	  	<h:panelGroup rendered="#{ALBean.aid!=null}">
	  		<h:form id="adminChangePwd" onsubmit="return checkAdminChangePwd();">
			  	<table class="RegBox" align="center" border="0" width="500" style="margin-top:40;"
			  	 cellpadding="0" cellspacing="0">
			  		<caption style="font-size:18px;margin-bottom:20px;">�޸�����</caption>			  		
			  		<tr>
			  			<td align="right"><h:outputText value="�����룺"/></td>
			  			<td>
			  				<h:inputSecret id="oldPwd" value="#{ACPBean.oldPwd}" styleClass="input"/>
			  				<h:outputText value=" ������Ҫ���ĵ�ǰ����"/>
			  			</td>
			  		</tr>
			  		<tr>
			  			<td align="right"><h:outputText value="�����룺"/></td>
			  			<td>
			  				<h:inputSecret id="newPwd" value="#{ACPBean.newPwd}" styleClass="input"/>
			  				<h:outputText value=" ����������������"/>
			  			</td>
			  		</tr>
			  		<tr>
			  			<td align="right"><h:outputText value="ȷ�������룺"/></td>
			  			<td>
			  				<h:inputSecret id="reNewPwd" value="#{ACPBean.reNewPwd}" styleClass="input"/>
			  				<h:outputText value=" ���ٴ���������������"/>
			  			</td>
			  		</tr>			  		
			  		<tr>
			  			<td></td>
			  			<td>
				  			<h:commandButton value="�޸�" styleClass="button" action="#{ACPBean.changePwd}"/>
							&nbsp;<h:commandButton value="����" styleClass="button" type="reset"/>
							<h:outputText value="#{ACPBean.message}" style="color:red;vertical-align:middle;"/>
						</td>
			  		</tr>
			  	</table>
		  	</h:form>
	  	</h:panelGroup>
  	</div>
  	</body>
 </html>
 </f:view>
<%@page contentType="text/html;charset=GBK"%>
<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<f:view> 
 <html>
  <head>
    <title>A10�Ƶ�Ԥ�����Ļ�ӭ��</title>
    <link rel="stylesheet" type="text/css" href="script/main.css"/>
    <script language="JavaScript" src="script/adminLogin.js"></script>
  </head>
  <body>
  	<div class="MainBox">
	  	<%@ include file="adminTop.jsp" %>	  	
	  	<span style="margin-left:5px;">
	  		<h:outputText value="��ҳ >> �����¼"></h:outputText>	  	
	  	</span>
	  	<h:panelGroup rendered="#{ALBean.aid!=null}">
		  	<div style="margin-top:100;text-align:center;">
		  		<h:outputText value="#{ALBean.aname}����ӭ����Ԥ����������" />
		  	</div>
	  	</h:panelGroup>
	  	<h:panelGroup rendered="#{ALBean.aid==null}">
	  		<h:form id="adminLogin" onsubmit="return checkAdminLogin();">
			  	<table class="RegBox" align="center" border="0" width="520" style="margin-top:40;">
			  		<caption style="font-size:18px;margin-bottom:20px;">�����¼</caption>
			  		<tr>
			  			<td align="right" width="150"><h:outputText value="������֤�룺"/></td>
			       		<td>
			       			<h:inputText id="yzm" value="#{ALBean.valCode}" styleClass="yzm" />
			       			<a href="javascript:reloadImage();" title="�����壿�����һ��^_^" tabindex="100">
			       				<h:graphicImage value="/yzm.jsp" id="pic" style="vertical-align:middle;border:0"/>
							</a>
							<a href="javascript:reloadImage();" tabindex="200">
				 				<font color="#bc2931" size="2" face="����" title="�����ִ�Сд">�������������ͼƬ</font>
				 			</a>
			       		</td>
			  		</tr>
			  		<tr>
			  			<td align="right"><h:outputText value="����Ա����"/></td>
			  			<td>
			  				<h:inputText id="aname" value="#{ALBean.aname}" styleClass="input"/>
			  				<h:outputText value=" ������Ҫ��¼�Ĺ���Ա��"/>
			  			</td>
			  		</tr>
			  		<tr>
			  			<td align="right"><h:outputText value="����Ա���룺"/></td>
			  			<td>
			  				<h:inputSecret id="apwd" value="#{ALBean.apwd}" styleClass="input"/>
			  				<h:outputText value=" ��������������"/>
			  			</td>
			  		</tr>
			  		<tr>
			  			<td align="center" colspan="2">
				  			<h:commandButton value="��¼" styleClass="button" action="#{ALBean.loginAdmin}"/>
							&nbsp;<h:commandButton value="����" styleClass="button" type="reset"/>
							<h:outputText value="#{ALBean.message}" style="color:red;vertical-align:middle;"/>
						</td>
			  		</tr>
			  	</table>
		  	</h:form>
	  	</h:panelGroup>
  	</div>
  	</body>
 </html>
 </f:view>
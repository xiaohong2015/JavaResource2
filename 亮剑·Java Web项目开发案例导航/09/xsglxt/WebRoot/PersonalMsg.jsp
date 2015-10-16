<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core" %>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html" %>
<html>
	<head>
		<title>PersonalMsg.jsp</title>
		<link style="text/css" rel="stylesheet" href="images/style.css">
	</head>
	<body>
		<f:view>
			<h:outputLink value="Login.jsp" target="_parent" rendered="#{!LoginBean.login}">
				<h:outputText value="���ȵ�¼"/>
			</h:outputLink>
			<h:panelGrid styleClass="panel" rendered="#{LoginBean.login}">
			<h:outputText value="������Ϣ��" styleClass="tablehead"/>
			<h:panelGrid columns="2" columnClasses="evenColumn,oddColumn" styleClass="panelstyle">
				<h:outputText value="ѧ��:"/>	<h:outputText value="#{PersonalMsgBean.sno}"/>
				<h:outputText value="����:"/>	<h:outputText value="#{PersonalMsgBean.sname}"/>
				<h:outputText value="�Ա�:"/>	<h:outputText value="#{PersonalMsgBean.sgender}"/>
				<h:outputText value="��������:"/><h:outputText value="#{PersonalMsgBean.birth}"/>
				<h:outputText value="����:"/>	<h:outputText value="#{PersonalMsgBean.nativeplace}"/>
				<h:outputText value="ѧԺ:"/>	<h:outputText value="#{PersonalMsgBean.coll}"/>
				<h:outputText value="רҵ:"/>	<h:outputText value="#{PersonalMsgBean.dept}"/>
				<h:outputText value="�༶:"/>	<h:outputText value="#{PersonalMsgBean.classes}"/>
				<h:outputText value="������ò:"/><h:outputText value="#{PersonalMsgBean.mianmao}"/>
				<h:outputText value="��ѧʱ��:"/><h:outputText value="#{PersonalMsgBean.comedate}"/>
			</h:panelGrid>
			</h:panelGrid>
		</f:view>
	</body>
</html>
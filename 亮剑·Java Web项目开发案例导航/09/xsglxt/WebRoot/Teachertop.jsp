<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core" %>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html" %>
<html>
	<head>
		<title>Teachertop.jsp</title>
		<link type="text/css" rel="stylesheet" href="images/style.css">
	</head>
	<body><f:view><h:panelGrid columns="1" styleClass="top">
	<h:panelGroup >
	<h:graphicImage value="images/baina.gif" styleClass="pic"/><!-- �����ⲿͼƬ -->
		<h:outputText value="#{AddStuBean.coll}" /><h:outputText value="ѧ������ϵͳ" />
	</h:panelGroup></h:panelGrid></f:view> </body>
</html>
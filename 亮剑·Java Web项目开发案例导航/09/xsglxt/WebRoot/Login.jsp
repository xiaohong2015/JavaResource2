<%@ page contentType="text/html;charset=GBK"%>			   <!-- ������ҳ�ı���ΪGBK -->
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core" %><!-- ����JSF���ı�ǿ� -->
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html" %><!-- ����JSF����HTML�ı�ǿ�-->
<html><head><title>��½ҳ��</title>
<link type="text/css" rel="stylesheet" href="images/style.css"><!-- �����ⲿcss��ʽ�� -->
<script type="text/javascript" src="images/teacher.js"></script>
</head><body topMargin=90;background-image:url(images/bg.gif);><f:view><!-- ʹ��JSF��ǩ�����ɵ�¼��-->
	<h:form id="myform" onsubmit="return checkLogin();"><h:panelGrid styleClass="panel">	
		<h:panelGrid columns="1" style= "background-image:url(images/aaa.JPG); height:389;width=641;">
		<h:outputText value="�������д�ѧѧ������ϵͳ" styleClass="pname"/>
			<h:panelGrid columns="2"  style="text-align:right;width=80%;">
				<h:panelGrid columns="2" width="70%" ><h:outputText value="�û�����"/>
					<h:inputText id="uid" value="#{LoginBean.uid}" required="true"/>
					<h:outputText value="��    �룺"/>
					<h:inputSecret id="pwd" value="#{LoginBean.pwd}" required="true"/>
					<h:outputText value="��    �ͣ�"/>
					<h:selectOneRadio layout="lineDirection" value="#{LoginBean.type}">
						<f:selectItem itemLabel="��ͨѧ��" itemValue="student"/>
						<f:selectItem itemLabel="��ְ��" itemValue="teacher"/>
					</h:selectOneRadio><h:outputText value=""/>
					<h:panelGroup><h:message for="uid" style="color:red"/>
					<h:message for="pwd" styleClass="msg"/></h:panelGroup></h:panelGrid>
				<h:commandButton image="images/login1.gif" 
					onmouseover="this.src='images/login2.gif'" onmouseout="this.src='images/login1.gif'" 
					onmousedown="this.src='images/login3.gif'" onmouseup="this.src='images/login2.gif'" 
				action="#{LoginBean.verify}"/>	
			</h:panelGrid></h:panelGrid></h:panelGrid></h:form>	</f:view></body></html>
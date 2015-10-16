<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html" %>
<html>
	<head>
		<title>CourseTable.jsp</title>
		<link type="text/css" rel="stylesheet" href="images/style.css">
	</head>
	<body><f:view><h:outputLink value="Login.jsp" target="_parent" rendered="#{!LoginBean.login}">
		<h:outputText value="���ȵ�¼"/></h:outputLink><!-- ��δ��¼�ߵĴ��� -->
	<h:panelGrid styleClass="panel" rendered="#{LoginBean.login}"><!-- ���ø�ģ��ҳ���������ʽ -->
	<h:outputText value="�޿γ���Ϣ" styleClass="noinfo" rendered="#{CourseTableBean.size==0}"/>
	<h:outputText value="�γ̱�" styleClass="tablehead" rendered="#{CourseTableBean.size!=0}"/>
	<h:dataTable value="#{CourseTableBean.courTable}" var="coursetime" rendered="#{CourseTableBean.size!=0}"
	columnClasses="evencol1,oddcol1" styleClass="tablestyle" headerClass="headerClazz">
		<h:column>
			<f:facet name="header">
				<h:outputText value=""/>
			</f:facet>
			<h:outputText value="#{coursetime.zero}"/>
		</h:column>
		<h:column>
			<f:facet name="header">
				<h:outputText value="����һ"/>
			</f:facet>
			<h:outputText value="#{coursetime.one}"/>
		</h:column>
		<h:column>
			<f:facet name="header">
				<h:outputText value="���ڶ�"/>
			</f:facet>
			<h:outputText value="#{coursetime.two}"/>
		</h:column>
		<h:column>
			<f:facet name="header">
				<h:outputText value="������"/>
			</f:facet>
			<h:outputText value="#{coursetime.three}"/>
		</h:column>
		<h:column>
			<f:facet name="header">
				<h:outputText value="������"/>
			</f:facet>
			<h:outputText value="#{coursetime.four}"/>
		</h:column>
		<h:column>
			<f:facet name="header">
				<h:outputText value="������"/>
			</f:facet>
			<h:outputText value="#{coursetime.five}"/>
		</h:column>
		<h:column>
			<f:facet name="header">
				<h:outputText value="������"/>
			</f:facet>
			<h:outputText value="#{coursetime.six}"/>
		</h:column><h:column>
			<f:facet name="header">
				<h:outputText value="������"/>
			</f:facet>
			<h:outputText value="#{coursetime.seven}"/>
		</h:column>
	</h:dataTable>
	<hr/>
	<h:form>
	<h:dataTable value="#{CourseTableBean.myCourseMsgItem}" 
				 var="mycoursemsg" rendered="#{CourseTableBean.size!=0}"
				rowClasses="evenRow,oddRow" styleClass="panelstyle" headerClass="headerClazz">
		<h:column><f:facet name="header">
				<h:outputText value="�γ̱��"/></f:facet><!-- �γ̱���� -->
			<h:outputText value="#{mycoursemsg.courNo}"/></h:column>
		<h:column><f:facet name="header">
				<h:outputText value="�γ�����"/></f:facet><!-- �γ������� -->
			<h:outputText value="#{mycoursemsg.courName}"/> </h:column>
		<h:column><f:facet name="header">
				<h:outputText value="���ڼ�"/></f:facet><!-- ���ڼ��� -->
			<h:outputText value="#{mycoursemsg.day}"/> </h:column>
		<h:column><f:facet name="header">
				<h:outputText value="�ڼ���"/></f:facet><!-- ������ -->
			<h:outputText value="#{mycoursemsg.times}"/> </h:column>
		<h:column><f:facet name="header">
				<h:outputText value="�ον�ʦ"/></f:facet><!-- �ον�ʦ�� -->
			<h:outputText value="#{mycoursemsg.teacher}"/></h:column>
		<h:column><f:facet name="header">
				<h:outputText value="�γ�ѧ��"/></f:facet><!-- ѧ���� -->
			<h:outputText value="#{mycoursemsg.xuefen}"/> </h:column>
		<h:column rendered="#{CourseTableBean.onchosing}">
			<f:facet name="header"><h:outputText value="^_^"/></f:facet><!-- ɾ���� -->
			<h:commandLink action="#{CourseTableBean.delete}"><!-- �󶨵���̨���� -->
                    <h:graphicImage value="images/delete.png" style="border:0"/><h:outputText value="ɾ��"/></h:commandLink><!-- ɾ����ǩ -->
            </h:column></h:dataTable></h:form></h:panelGrid></f:view></body>
</html>
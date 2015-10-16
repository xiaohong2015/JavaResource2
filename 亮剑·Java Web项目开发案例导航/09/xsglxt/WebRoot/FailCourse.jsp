<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html" %>
<html>
	<head>
		<title>FailCourse.jsp</title>
		<link type="text/css" rel="stylesheet" href="images/style.css">
	</head>
	<body>
		<f:view>
			<h:outputLink value="Login.jsp" target="_parent" rendered="#{!LoginBean.login}">
				<h:outputText value="���ȵ�¼"/>
			</h:outputLink>
			<h:panelGrid styleClass="panel" rendered="#{LoginBean.login}">
			<h:outputText value="��û�в�����ļ�¼" rendered="#{FailCourseBean.size==0}" styleClass="noinfo"/>
			<h:outputText value="������ɼ��б�" styleClass="tablehead" rendered="#{FailCourseBean.size!=0}"/>
			<h:dataTable value="#{FailCourseBean.failCourse}" var="failCourse" rendered="#{FailCourseBean.size!=0}"
			 rowClasses="evenRow,oddRow" styleClass="panelstyle" headerClass="headerClazz">
				<h:column>
					<f:facet name="header">
						<h:outputText value="�γ̱��"/>
					</f:facet>
					<h:outputText value="#{failCourse.courseNo}"/>
				</h:column>
				<h:column>
					<f:facet name="header">
						<h:outputText value="�γ�����"/>
					</f:facet>
					<h:outputText value="#{failCourse.courseName}"/> 
				</h:column>
				<h:column>
					<f:facet name="header">
						<h:outputText value="ѧ��"/>
					</f:facet>
					<h:outputText value="#{failCourse.xuefen}"/> 
				</h:column>
				<h:column>
					<f:facet name="header">
						<h:outputText value="�ɼ�"/>
					</f:facet>
					<h:outputText value="#{failCourse.score}"/> 
				</h:column>		
			</h:dataTable>
			</h:panelGrid>
		</f:view>
	</body>
</html>
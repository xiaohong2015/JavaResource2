<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html" %>
<html>
	<head>
		<title>LearnedCourse.jsp</title>
		<link type="text/css" rel="stylesheet" href="images/style.css">
	</head>
	<body>
		<f:view>
			<h:outputLink value="Login.jsp" target="_parent" rendered="#{!LoginBean.login}">
				<h:outputText value="���ȵ�¼"/>
			</h:outputLink>
			<h:panelGrid styleClass="panel" rendered="#{LoginBean.login}">
			<h:outputText value="��ʱû��������سɼ���Ϣ" rendered="#{LearnedCourseBean.size==0}" styleClass="noinfo"/>
			<h:outputText value="���޿γ̳ɼ��б�" styleClass="tablehead" rendered="#{LearnedCourseBean.size!=0}"/>
			<h:dataTable value="#{LearnedCourseBean.learnedCourse}" var="learncourse" rendered="#{LearnedCourseBean.size!=0}"
			 rowClasses="evenRow,oddRow" styleClass="panelstyle" headerClass="headerClazz">
				<h:column>
					<f:facet name="header">
						<h:outputText value="�γ̱��"/>
					</f:facet>
					<h:outputText value="#{learncourse.courseNo}"/>
				</h:column>
				<h:column>
					<f:facet name="header">
						<h:outputText value="�γ�����"/>
					</f:facet>
					<h:outputText value="#{learncourse.courseName}"/> 
				</h:column>
				<h:column>
					<f:facet name="header">
						<h:outputText value="ѧ��"/>
					</f:facet>
					<h:outputText value="#{learncourse.xuefen}"/> 
				</h:column>
				<h:column>
					<f:facet name="header">
						<h:outputText value="�ɼ�"/>
					</f:facet>
					<h:outputText value="#{learncourse.score}"/> 
				</h:column>
			</h:dataTable>
			</h:panelGrid>
		</f:view>
	</body>
</html>
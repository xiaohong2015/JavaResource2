<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core" %>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html" %>
<html>
	<head>
		<title>Tree.jsp</title>
		<link type="text/css" rel="stylesheet" href="images/style.css">
	</head>
	<body>
		<f:view>
			<h:form id="treeform">
				<h:panelGrid columns="2" id="root" rendered="true">
					<h:commandButton image="#{(StuTreeBean.root1)?'images/-.png':'images/+.png'}" 
					    id="com" value="submit" action="#{StuTreeBean.clickCom}"/>
					<h:outputLink value="StudentWelcome.jsp" target="mainFrame">
						<h:outputText value="ѧ������ϵͳ" styleClass="treefont"/>
					</h:outputLink>
					<h:outputText value="" rendered="#{StuTreeBean.root1}"/>
					<h:panelGrid columns="2" id="root1" rendered="#{StuTreeBean.root1}">
						<h:commandButton image="#{(StuTreeBean.root11)?'images/-.png':'images/+.png'}" 
					        value="submit" action="#{StuTreeBean.clickRoot11}"/>
						<h:outputLink value="#">
							<h:outputText value="������Ϣ����" styleClass="treefont"/>
						</h:outputLink>
						
						<h:outputText value="" rendered="#{StuTreeBean.root11}"/>
						<h:panelGrid columns="2" id="root11" rendered="#{StuTreeBean.root11}">
							<h:graphicImage value="images/star.gif"/>
							<h:outputLink value="PersonalMsg.jsp" target="mainFrame">
								<h:outputText value="���˻�����Ϣ" styleClass="treefont"/>
							</h:outputLink>
						</h:panelGrid>
						
						<h:outputText value="" rendered="#{StuTreeBean.root11}"/>
						<h:panelGrid columns="2" rendered="#{StuTreeBean.root11}">
							<h:graphicImage value="images/star.gif" onclick=""/>
							<h:outputLink value="StudentChangePwd.jsp" target="mainFrame">
								<h:outputText value="�޸�����" styleClass="treefont"/>
							</h:outputLink>
						</h:panelGrid>
						
						<h:outputText value="" rendered="#{StuTreeBean.root11}"/>
						<h:panelGrid columns="2" rendered="#{StuTreeBean.root11}">
							<h:graphicImage value="images/star.gif"/>
							<h:commandLink value="���µ�¼" action="#{StuTreeBean.reLogin}" target="_parent" styleClass="treefont"/>
						</h:panelGrid>
					</h:panelGrid>
					<h:outputText value="" rendered="#{StuTreeBean.root1}"/>
					<h:panelGrid columns="2" id="root2" rendered="#{StuTreeBean.root1}">
						<h:commandButton image="#{(StuTreeBean.root21)?'images/-.png':'images/+.png'}" 
					        value="submit" action="#{StuTreeBean.clickRoot21}"/>
						<h:outputLink value="#">
							<h:outputText value="����ѡ��" styleClass="treefont"/>
						</h:outputLink>
						<h:outputText value="" rendered="#{StuTreeBean.root21}"/>
						<h:panelGrid columns="2" rendered="#{StuTreeBean.root21}">
							<h:graphicImage value="images/star.gif" onclick=""/>
							<h:outputLink value="StudentChoseCourse.jsp" target="mainFrame">
								<h:outputText value="����ѡ��" styleClass="treefont"/>
							</h:outputLink>
						</h:panelGrid>
						<h:outputText value="" rendered="#{StuTreeBean.root21}"/>
						<h:panelGrid columns="2" rendered="#{StuTreeBean.root21}">
							<h:graphicImage value="images/star.gif"/>
							<h:outputLink value="CourseTable.jsp" target="mainFrame">
								<h:outputText value="�α���ʾ" styleClass="treefont"/>
							</h:outputLink>
						</h:panelGrid>
					</h:panelGrid>
					<h:outputText value="" rendered="#{StuTreeBean.root1}"/>
					<h:panelGrid columns="2" id="root3" rendered="#{StuTreeBean.root1}">
						<h:commandButton image="#{(StuTreeBean.root31)?'images/-.png':'images/+.png'}" 
					        value="submit" action="#{StuTreeBean.clickRoot31}"/>
						<h:outputLink value="#">
							<h:outputText value="�ɼ���Ϣ��ѯ" styleClass="treefont"/>
						</h:outputLink>
						<h:outputText value="" rendered="#{StuTreeBean.root31}"/>
						<h:panelGrid columns="2" rendered="#{StuTreeBean.root31}">
							<h:graphicImage value="images/star.gif" onclick=""/>
							<h:outputLink value="LearnedCourse.jsp" target="mainFrame">
								<h:outputText value="���޿γ̳ɼ�" styleClass="treefont"/>
							</h:outputLink>
						</h:panelGrid>
						<h:outputText value="" rendered="#{StuTreeBean.root31}"/>
						<h:panelGrid columns="2" rendered="#{StuTreeBean.root31}">
							<h:graphicImage value="images/star.gif" onclick=""/>
							<h:outputLink value="FailCourse.jsp" target="mainFrame">
								<h:outputText value="������γ̳ɼ�" styleClass="treefont"/>
							</h:outputLink>
						</h:panelGrid>
					</h:panelGrid>
				</h:panelGrid>
			</h:form>
		</f:view>
	</body>
</html>
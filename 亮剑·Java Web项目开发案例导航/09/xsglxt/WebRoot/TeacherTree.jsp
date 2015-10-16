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
		<h:form id="treeform" >
		<h:panelGrid columns="2" id="root" rendered="true" >
			<h:commandButton image="#{(TeacherTreeBean.root1)?'images/-.png':'images/+.png'}" 
			    id="com" value="submit" action="#{TeacherTreeBean.clickCom}"/><!-- ����ͼƬ��ť -->
			<h:outputLink value="TeacherWelcome.jsp" target="mainFrame" ><!-- ����ͼƬ��ť -->
				<h:outputText value="ѧ������ϵͳ" styleClass="treefont"/></h:outputLink>		<!-- ���ó������ı� -->
			<h:outputText value="" rendered="#{TeacherTreeBean.root1}"/>
			<h:panelGrid columns="2" id="root1" rendered="#{TeacherTreeBean.root1}">
				<h:commandButton image="#{(TeacherTreeBean.root11)?'images/-.png':'images/+.png'}" 
			        value="submit" action="#{TeacherTreeBean.clickRoot11}"/><!-- ����ͼƬ��ť -->
				<h:outputLink value="#"><h:outputText value="ϵͳ����ѡ��" styleClass="treefont"/></h:outputLink>
				<h:outputText value="" rendered="#{TeacherTreeBean.root11}"/>
				<h:panelGrid columns="2" rendered="#{TeacherTreeBean.root11}"><!-- ����ͼƬ��ť -->
					<h:graphicImage value="images/star.gif"/><!-- ����ͼƬ��ť -->
					<h:outputLink value="TeacherChangePwd.jsp" target="mainFrame">
						<h:outputText value="�޸�����" styleClass="treefont"/></h:outputLink><!-- ���ó������ı� -->
				</h:panelGrid>
				<h:outputText value="" rendered="#{TeacherTreeBean.root11}"/>
				<h:panelGrid columns="2" rendered="#{TeacherTreeBean.root11}">
					<h:graphicImage value="images/star.gif"/>    <!-- ����ͼƬ��ť -->
					<h:commandLink value="���µ�¼" action="#{TeacherTreeBean.reLogin}" target="_parent" styleClass="treefont"/>
						
				</h:panelGrid>
			</h:panelGrid>
			<h:outputText value="" rendered="#{TeacherTreeBean.root1}"/>
			<h:panelGrid columns="2" id="root2" rendered="#{TeacherTreeBean.root1}">
				<h:commandButton image="#{(TeacherTreeBean.root21)?'images/-.png':'images/+.png'}" 
			        value="submit" action="#{TeacherTreeBean.clickRoot21}"/>
				<h:outputLink value="#">
					<h:outputText value="ѧ����Ϣ����" styleClass="treefont"/>
				</h:outputLink>
				<h:outputText value="" rendered="#{TeacherTreeBean.root21}"/>
				<h:panelGrid columns="2" rendered="#{TeacherTreeBean.root21}">
					<h:graphicImage value="images/star.gif" onclick=""/>
					<h:outputLink value="AddStu.jsp" target="mainFrame">
						<h:outputText value="�����ѧ��" styleClass="treefont"/>
					</h:outputLink>
				</h:panelGrid>
				<h:outputText value="" rendered="#{TeacherTreeBean.root21}"/>
				<h:panelGrid columns="2" rendered="#{TeacherTreeBean.root21}">
					<h:graphicImage value="images/star.gif"/>
					<h:outputLink value="TeacherSearchMsg.jsp" target="mainFrame">
						<h:outputText value="ѧ��������Ϣ��ѯ" styleClass="treefont"/>
					</h:outputLink>
				</h:panelGrid>
				
				<h:outputText value="" rendered="#{TeacherTreeBean.root21}"/>
				<h:panelGrid columns="2" rendered="#{TeacherTreeBean.root21}">
					<h:graphicImage value="images/star.gif"/>
					<h:outputLink value="TeacherSearchGrade.jsp" target="mainFrame">
						<h:outputText value="ѧ���ɼ���ѯ" styleClass="treefont"/>
					</h:outputLink>
				</h:panelGrid>
			</h:panelGrid>
			<h:outputText value="" rendered="#{TeacherTreeBean.root1}"/>
			<h:panelGrid columns="2" id="root3" rendered="#{TeacherTreeBean.root1}">
				<h:commandButton image="#{(TeacherTreeBean.root31)?'images/-.png':'images/+.png'}" 
			        value="submit" action="#{TeacherTreeBean.clickRoot31}"/>
				<h:outputLink value="#">
					<h:outputText value="�γ���Ϣ����" styleClass="treefont"/>
				</h:outputLink>
				<h:outputText value="" rendered="#{TeacherTreeBean.root31}"/>
				<h:panelGrid columns="2" rendered="#{TeacherTreeBean.root31}">
					<h:graphicImage value="images/star.gif" onclick=""/>
					<h:outputLink value="TeacherManageCourse.jsp" target="mainFrame">
						<h:outputText value="ѡ����Ϣ����" styleClass="treefont"/>
					</h:outputLink>
				</h:panelGrid>
				
				<h:outputText value="" rendered="#{TeacherTreeBean.root31}"/>
				<h:panelGrid columns="2" rendered="#{TeacherTreeBean.root31}">
					<h:graphicImage value="images/star.gif" onclick=""/>
					<h:outputLink value="ChosingCourse.jsp" target="mainFrame">
						<h:outputText value="��ѡ�γ��б�" styleClass="treefont"/>
					</h:outputLink>
				</h:panelGrid>
				
				<h:outputText value="" rendered="#{TeacherTreeBean.root31}"/>
				<h:panelGrid columns="2" rendered="#{TeacherTreeBean.root31}">
					<h:graphicImage value="images/star.gif" onclick=""/>
					<h:outputLink value="WriteScore.jsp" target="mainFrame">
						<h:outputText value="�γ̳ɼ�¼��" styleClass="treefont"/>
					</h:outputLink>
				</h:panelGrid>
				
				<h:outputText value="" rendered="#{TeacherTreeBean.root31}"/>
				<h:panelGrid columns="2" rendered="#{TeacherTreeBean.root31}">
					<h:graphicImage value="images/star.gif" onclick=""/>
					<h:outputLink value="AddNewCourse.jsp" target="mainFrame">
						<h:outputText value="����¿γ�" styleClass="treefont"/>
					</h:outputLink>
				</h:panelGrid>	
			</h:panelGrid>
		</h:panelGrid>
		</h:form>
		</f:view>
	</body>
</html>
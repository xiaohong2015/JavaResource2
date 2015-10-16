<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core" %>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html" %>
<html>
	<head>
		<title>ChosingCourse.jsp</title>
		<link style="text/css" rel="stylesheet" href="images/style.css">
		<script type="text/javascript" src="images/teacher.js"></script> 
	</head>
	<body>
		<f:view>
			<h:outputLink value="Login.jsp" target="_parent" rendered="#{!LoginBean.login}">
				<h:outputText value="���ȵ�¼"/>
			</h:outputLink>
			<h:form styleClass="centers" rendered="#{LoginBean.login&&ChosingCourseBean.size!=0}"><!-- ������������� -->
				<h:commandButton image="images/stop1.gif" 
					onmouseover="this.src='images/stop2.gif'" onmouseout="this.src='images/stop1.gif'" 
					onmousedown="this.src='images/stop3.gif'" onmouseup="this.src='images/stop2.gif'" 
				action="#{ChosingCourseBean.stop}" onclick="return confirm('ȷ��Ҫֹͣѡ����?');" 
				rendered="#{LoginBean.login}"/></h:form>
			<h:panelGrid styleClass="panel">
			<h:outputText value="���޿�ѡ�γ���Ϣ" styleClass="tablehead" 
					rendered="#{LoginBean.login&&ChosingCourseBean.size==0}"/>
			<h:form rendered="#{LoginBean.login&&ChosingCourseBean.size!=0}">
				<h:outputText value="��ѡ�γ��б�" styleClass="tablehead"/>
				<h:dataTable value="#{ChosingCourseBean.courseMsgItem}" var="coursemsg" 
				rowClasses="evenRow,oddRow" styleClass="panelstyle" headerClass="headerClazz">
					<h:column><f:facet name="header"><h:outputText value="�γ�����"/><!-- �γ������� -->
						</f:facet><h:outputText value="#{coursemsg.courName}"/> </h:column>
					<h:column><f:facet name="header"><h:outputText value="�Ͽ��ܴ�"/><!-- ���ڼ��Ͽ� -->
						</f:facet><h:outputText value="#{coursemsg.day}"/> </h:column><!-- ֵ -->
					<h:column><f:facet name="header"><h:outputText value="�Ͽν���"/><!-- �ڼ����Ͽ� -->
						</f:facet><h:outputText value="#{coursemsg.times}"/> </h:column><!-- ���� -->
					<h:column><f:facet name="header"><h:outputText value="�ον�ʦ"/><!-- �ον�ʦ�� -->
						</f:facet><h:outputText value="#{coursemsg.teacher}"/></h:column><!-- �ον�ʦ -->
					<h:column><f:facet name="header"><h:outputText value="�γ�ѧ��"/><!-- �γ�ѧ���� -->
						</f:facet><h:outputText value="#{coursemsg.xuefen}"/> </h:column><!-- ѧ��ֵ -->
					<h:column><f:facet name="header"><h:outputText value="״̬"/><!-- �γ�״̬�� -->
						</f:facet><!-- ����״̬�ı� -->
							<h:outputText value="��ѡ" rendered="#{!coursemsg.state}"/>
			                <h:commandLink action="#{ChosingCourseBean.gongBu}" rendered="#{coursemsg.state}">
			                <h:outputText value="#{(coursemsg.state)?'����':'�ѿ�ѡ'}"/></h:commandLink>
					</h:column><h:column><f:facet name="header"><h:outputText value="^_^"/><!--  -->
						</f:facet>  <h:commandLink action="#{ChosingCourseBean.delete}">
								<h:graphicImage value="images/delete.png" style="border:0"/>
			                    <h:outputText value="ɾ��"/></h:commandLink><!-- ɾ���γ̵����Ӱ�ť -->
			           </h:column></h:dataTable></h:form></h:panelGrid>
		</f:view>
	</body>
</html>
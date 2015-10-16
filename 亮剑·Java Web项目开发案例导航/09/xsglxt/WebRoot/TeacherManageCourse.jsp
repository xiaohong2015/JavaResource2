<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core" %>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html" %>
<html>
	<head>
		<title>TeacherManageCourse.jsp</title>
		<link style="text/css" rel="stylesheet" href="images/style.css">
		<script type="text/javascript" src="images/teacher.js"></script> 
	</head>
	<body>
		<f:view>
			<h:outputLink value="Login.jsp" target="_parent" rendered="#{!LoginBean.login}">
				<h:outputText value="���ȵ�¼"/>
			</h:outputLink>
			<h:panelGrid styleClass="panel" columns="1" rendered="#{LoginBean.login}"><!-- �Ǹ����������ʾ -->
			<h:outputText value="ѧԺ���пγ��б�" styleClass="tablehead"/>
			<h:dataTable value="#{TeacherManageCourseBean.courseItemList}" var="course" 
			 	rowClasses="evenRow,oddRow" styleClass="panelstyle" headerClass="headerClazz" ><!-- ���ñ����ʽ -->
				<h:column><f:facet name="header"><h:outputText value="�γ̱��"/></f:facet><!-- �γ̱���� -->        
			        <h:outputText value="#{course.courseNo}"/></h:column><!-- �γ̱��ֵ -->
				<h:column><f:facet name="header"><h:outputText value="�γ�����"/><!-- �γ������� -->
			        </f:facet><h:outputText value="#{course.courseName}"/></h:column><!-- �γ�����ֵ -->
				<h:column><f:facet name="header"><h:outputText value="�γ�ѧ��"/><!-- �γ�ѧ���� -->
			        </f:facet><h:outputText value="#{course.xuefen}"/></h:column><!-- �γ�ѧ��ֵ -->
				<h:column><f:facet name="header"><h:outputText value="����ѧԺ"/><!-- ����ѧԺ�� -->
			        </f:facet><h:outputText value="#{course.collName}"/></h:column><!-- ѧԺ���� -->
				<h:column><f:facet name="header"><h:outputText value="����רҵ"/><!-- ����רҵ�� -->
			        </f:facet><h:outputText value="#{course.deptName}"/></h:column><!-- רҵ���� -->
			</h:dataTable>
			
			</h:panelGrid>
			
			<hr/>
			<h:form rendered="#{LoginBean.login}" id="manageform" onsubmit="return coursemsgcheck();">
			<h:panelGrid styleClass="panel" columns="1" >
			
			<h:panelGrid columns="3"><!-- ����һ���Ҿ�����ʾ -->
				<h:outputText value="��������Ҫ�����Ŀγ̵Ŀγ̺ţ�" styleClass="message"/><!-- ��ʾ����γ̺ŵı�ǩ -->
				<h:inputText value="#{TeacherManageCourseBean.courseNo}" id="courseNo"/><!-- ��������γ̺� -->
				<h:message for="courseNo" style="color:red"/><!-- ������ʾ��Ϣ -->
				<h:outputText value="������ÿγ̵��ο���ʦ��" styleClass="message"/><!-- ��ʾ�����ο���ʦ���� -->
				<h:inputText value="#{TeacherManageCourseBean.teacher}" id="teacher"/><!-- ���������ο���ʦ -->
				<h:message for="teacher" style="color:red"/><!-- ������Ϣ��� -->
				<h:outputText value="��ѡ��ÿγ̵��Ͽ�ʱ�䣺" styleClass="message"/><!-- ��ʾѡ���Ͽ�ʱ�� -->
				<h:panelGroup><h:selectOneMenu value="#{TeacherManageCourseBean.day}"><!-- ���ڼ��� -->
						<f:selectItems value="#{TeacherManageCourseBean.dayItem}"/></h:selectOneMenu>
					<h:selectOneMenu value="#{TeacherManageCourseBean.times}"><!-- �ڼ����� -->
						<f:selectItems value="#{TeacherManageCourseBean.timesItem}"/></h:selectOneMenu>
				</h:panelGroup><h:outputText value=""/>
				<h:commandButton image="images/add1.gif" 
					onmouseover="this.src='images/add2.gif'" onmouseout="this.src='images/add1.gif'" 
					onmousedown="this.src='images/add3.gif'" onmouseup="this.src='images/add2.gif'" 
				action="#{TeacherManageCourseBean.addToDB}"/><!-- �ύ��ť -->
				<h:inputText id="result" value="#{TeacherManageCourseBean.result}" style="display:none"/><!-- ������� -->
			</h:panelGrid></h:panelGrid>
			</h:form>
			
		</f:view>
		<script language="JavaScript">
			function alertmsg()
			{
				var msg=document.getElementById("manageform:result").value;
				if(msg!="")
				{
					alert(msg);	
				}
				
			}
			
			window.onload=alertmsg;
		</script>
	</body>
</html>
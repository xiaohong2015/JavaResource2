<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core" %>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html" %>
<html>
	<head>
		<title>TeacherSearchGrade.jsp</title>
		<link style="text/css" rel="stylesheet" href="images/style.css">
		<script type="text/javascript" src="images/teacher.js"></script>
	</head>
	<body><f:view>
		<h:outputLink value="Login.jsp" target="_parent" rendered="#{!LoginBean.login}">
			<h:outputText value="���ȵ�¼"/></h:outputLink><!-- û�е�¼ʱ����ʾ��Ϣ -->
		<h:form id="searchform"  onsubmit="return checksno();" rendered="#{LoginBean.login}" styleClass="centers">
			<div class="topsearch">
				<h:graphicImage styleClass="iconstyle" value="images/icon.jpg" />
				<h:inputText onfocus="clearinput();" id="search" styleClass="inputtype" value="#{TeacherSearchGradeBean.sno}" required="true"/>
				<h:commandButton image="images/sea1.png" 
				onmouseover="this.src='images/sea2.png'" onmouseout="this.src='images/sea1.png'" 
					onmousedown="this.src='images/sea3.png'" onmouseup="this.src='images/sea2.png'" 
				action="#{TeacherSearchGradeBean.search}" styleClass="searchbutton"/>
				</div>
		
			<h:message for="search" style="color:red"/><!-- ������Ϣ��� -->
		<!-- û�и�ѧ������ʾ��Ϣ -->
		</h:form><h:panelGrid styleClass="panel" rendered="#{LoginBean.login}"><!-- ������ʽ��ʼ���ݱ�� -->
		<h:dataTable value="#{TeacherSearchGradeBean.gradeList}" var="grade" 
		       rendered="#{TeacherSearchGradeBean.cansee&&TeacherSearchGradeBean.size>0}"rowClasses="evenRow,oddRow" 
		       styleClass="panelstyle" headerClass="headerClazz"><!-- �����ݱ��������ʽ������ -->
			<h:column><f:facet name="header"><h:outputText value="�γ���"/></f:facet><!-- ��ͷ -->
				<h:outputText value="#{grade.courseName}"/></h:column><!-- ���� -->
			<h:column><f:facet name="header"><h:outputText value="����"/></f:facet><!-- ��ͷ -->
				<h:outputText value="#{grade.score}"/></h:column><!-- ���� -->
			<h:column><f:facet name="header"><h:outputText value="ѧ��"/></f:facet><!-- ��ͷ -->
				<h:outputText value="#{grade.xuefen}"/></h:column><!-- ���� -->
		</h:dataTable>
			<h:outputText value="#{TeacherSearchGradeBean.result}" styleClass="noinfo" />
		</h:panelGrid></f:view></body>
		<script language="JavaScript">
			function initialinput()
			{
				var com=document.getElementById("searchform:search");
				var sno=com.value;
				
				if(sno.trim()=="")
				{
					com.value="������Ҫ��ѯ��ѧ����ѧ��";
				}
			}
			function clearinput()
			{
				var com=document.getElementById("searchform:search");
				var sno=com.value;
			
				if(sno=="������Ҫ��ѯ��ѧ����ѧ��")
				{
					com.value="";
				}
			}
			window.onload=initialinput();
		</script>
</html>
<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html" %>
<html>
	<head>
		<title>StudentChangePwd.jsp</title>
		<link type="text/css" rel="stylesheet" href="images/style.css">
	</head>
	<body><f:view>
	<h:outputLink value="Login.jsp" target="_parent" rendered="#{!LoginBean.login}">
		<h:outputText value="���ȵ�¼"/></h:outputLink><!-- ��δ��¼�û��Ĵ��� -->
	<h:panelGrid styleClass="panel"><!-- ���ø�ҳ��Ԫ�ص�����λ�� -->
	<h:form rendered="#{LoginBean.login}">
	<h:outputText value="���޿�ѡ�γ���Ϣ" styleClass="noinfo" rendered="#{StudentChoseCourseBean.size==0}"/>
	<h:outputText value="��ѡ�γ��б�" styleClass="tablehead" rendered="#{StudentChoseCourseBean.size!=0}"/>
	<h:dataTable value="#{StudentChoseCourseBean.courseMsgItem}" 
	 var="coursemsg" rendered="#{StudentChoseCourseBean.size!=0}"
			 rowClasses="evenRow,oddRow" styleClass="panelstyle" headerClass="headerClazz">
		<h:column><f:facet name="header">
				<h:outputText value="�γ̱��"/></f:facet><!-- �γ̱���� -->
			<h:outputText value="#{coursemsg.courNo}"/></h:column>
		<h:column><f:facet name="header">
				<h:outputText value="�γ�����"/></f:facet><!-- �γ������� -->
			<h:outputText value="#{coursemsg.courName}"/> </h:column>
		<h:column><f:facet name="header">
				<h:outputText value="���ڼ�"/></f:facet><!-- ���ڼ��� -->
			<h:outputText value="#{coursemsg.day}"/> </h:column>
		<h:column><f:facet name="header">
				<h:outputText value="�ڼ���"/></f:facet><!-- �ڼ����� -->
			<h:outputText value="#{coursemsg.times}"/> </h:column>
		<h:column><f:facet name="header">
				<h:outputText value="�ον�ʦ"/></f:facet><!-- �ον�ʦ�� -->
			<h:outputText value="#{coursemsg.teacher}"/> </h:column>
		<h:column><f:facet name="header">
				<h:outputText value="�γ�ѧ��"/></f:facet><!-- �γ�ѧ���� -->
			<h:outputText value="#{coursemsg.xuefen}"/> </h:column>
		<h:column><f:facet name="header">
				<h:outputText value="^_^"/></f:facet><!-- ѡ���� -->
			<h:commandLink action="#{StudentChoseCourseBean.chose}">
	                <h:outputText value="ѡ��"/></h:commandLink><!-- ѡ������ -->
		</h:column></h:dataTable></h:form></h:panelGrid>
	<h:inputText id="result" value="#{StudentChoseCourseBean.result}" style="display:none"
	 styleClass="centers"/></f:view>
	 <script language="JavaScript">
			function alertmsg()
			{
				var msg=document.getElementById("result").value;
				if(msg!="")
				{
					alert(msg);	
				}
				
			}
			
			window.onload=alertmsg;
		</script>
	 </body><!-- ���ѡ�κ����ʾ��Ϣ -->
</html>
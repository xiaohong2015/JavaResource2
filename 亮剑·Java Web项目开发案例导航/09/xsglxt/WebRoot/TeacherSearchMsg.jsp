<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core" %>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html" %>
<html>
	<head>
		<title>TeacherSearchMsg.jsp</title>
		<link style="text/css" rel="stylesheet" href="images/style.css">
		<script type="text/javascript" src="images/teacher.js"></script>
	</head>
	<body>
		<f:view>
			<h:outputLink value="Login.jsp" target="_parent" rendered="#{!LoginBean.login}">
				<h:outputText value="���ȵ�¼"/>
			</h:outputLink>
			<h:form id="searchform" rendered="#{LoginBean.login}" styleClass="centers" onsubmit="return checksno();">
				<div class="topsearch">
				<h:graphicImage styleClass="iconstyle" value="images/icon.jpg" />
				<h:inputText onfocus="clearinput();" id="search" styleClass="inputtype" value="#{TeacherSearchMsgBean.sno}" required="true"/>
				<h:commandButton image="images/sea1.png" 
				onmouseover="this.src='images/sea2.png'" onmouseout="this.src='images/sea1.png'" 
					onmousedown="this.src='images/sea3.png'" onmouseup="this.src='images/sea2.png'" 
				action="#{TeacherSearchMsgBean.search}" styleClass="searchbutton"/>
				</div>
				<h:message for="search" style="color:red"/>
				<h:inputText id="result" value="#{TeacherSearchMsgBean.result}" style="display:none" />
			</h:form>
			<h:panelGrid styleClass="panel">
			<h:panelGrid columns="2" rendered="#{TeacherSearchMsgBean.cansee&&LoginBean.login}" 
			            columnClasses="evenColumn,oddColumn" styleClass="panelstyle">
				<h:outputText value="ѧ ��:"/>	<h:outputText value="#{TeacherSearchMsgBean.sno}"/>
				<h:outputText value="�� ��:"/>	<h:outputText value="#{TeacherSearchMsgBean.sname}"/>
				<h:outputText value="�� ��:"/>	<h:outputText value="#{TeacherSearchMsgBean.sgender}"/>
				<h:outputText value="��������:"/><h:outputText value="#{TeacherSearchMsgBean.birth}"/>
				<h:outputText value="�� ��:"/>	<h:outputText value="#{TeacherSearchMsgBean.nativeplace}"/>
				<h:outputText value="ѧ Ժ:"/>	<h:outputText value="#{TeacherSearchMsgBean.coll}"/>
				<h:outputText value="ר ҵ:"/>	<h:outputText value="#{TeacherSearchMsgBean.dept}"/>
				<h:outputText value="�� ��:"/>	<h:outputText value="#{TeacherSearchMsgBean.classes}"/>
				<h:outputText value="������ò:"/><h:outputText value="#{TeacherSearchMsgBean.mianmao}"/>
				<h:outputText value="��ѧʱ��:"/><h:outputText value="#{TeacherSearchMsgBean.comedate}"/>
			</h:panelGrid>
			</h:panelGrid>
		</f:view>
		<script language="JavaScript">
			function alertmsg()
			{

				var msg=document.getElementById("searchform:result").value;
				if(msg!="")
				{
					alert(msg);	
				}
				
			}
			window.onload=alertmsg;

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
	</body>
</html>
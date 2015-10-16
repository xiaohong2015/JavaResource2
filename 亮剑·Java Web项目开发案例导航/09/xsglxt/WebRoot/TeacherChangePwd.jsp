<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html" %>
<html>
	<head>
		<title>TeacherChangePwd.jsp</title>
		<link type="text/css" rel="stylesheet" href="images/style.css">
		<script type="text/javascript" src="images/teacher.js"></script> 
	</head>
	<body>
		<f:view>
			<h:outputLink value="Login.jsp" target="_parent" rendered="#{!LoginBean.login}">
				<h:outputText value="���ȵ�¼"/><!-- û�е�¼����ʾ��Ϣ -->
			</h:outputLink>
			<h:form rendered="#{LoginBean.login}" id="myform" 
			   onsubmit="return check('myform:oldpwd','�����������')&&check('myform:newpwd','������������')
			              &&check('myform:renewpwd','���ٴ�����������')&&checknewpwd('myform:newpwd')&&pwd();">
				<h:panelGrid columns="3"><h:outputText value="�ҵľ����룺" styleClass="message"/>
					<h:inputSecret id="oldpwd" value="#{TeacherChangePwdBean.oldpwd}" required="true"/>
					<h:message for="oldpwd" styleClass="msg"/><!-- ������Ϣ��ʾ -->
					<h:outputText value="�����������룺" styleClass="message"/>
					<h:inputSecret id="newpwd" value="#{TeacherChangePwdBean.newpwd}" required="true">
						<f:validateLength maximum="12" minimum="6"/>
					</h:inputSecret>
					<h:panelGroup>
						<h:message for="newpwd" styleClass="msg"/>
						<h:outputText value="������ɴ�СдӢ����ĸ��������ɣ�����6��12λ��" styleClass="info"/>
					</h:panelGroup>
					<h:outputText value="���ٴ����������룺" styleClass="message"/>
					<h:inputSecret id="renewpwd" value="#{TeacherChangePwdBean.renewpwd}" required="true">
						<f:validateLength maximum="12" minimum="6"/>
					</h:inputSecret>
					<h:panelGroup>
						<h:message for="renewpwd" styleClass="msg"/>
						<h:outputText value="#{TeacherChangePwdBean.different}" styleClass="msg"/>
					</h:panelGroup>
					<h:outputText value=""/>
					<h:commandButton image="images/ok1.gif" 
					onmouseover="this.src='images/ok2.gif'" onmouseout="this.src='images/ok1.gif'" 
					onmousedown="this.src='images/ok3.gif'" onmouseup="this.src='images/ok2.gif'" 
					value="ȷ  ��" action="#{TeacherChangePwdBean.changePwd}"/>
					<h:inputText id="result" value="#{TeacherChangePwdBean.result}" style="display:none"/>
				</h:panelGrid>
			</h:form>
			<script language="JavaScript">
			function alertmsg()
			{
				var msg=document.getElementById("myform:result").value;
				if(msg!="")
				{
					alert(msg);	
				}
				
			}
			
			window.onload=alertmsg;
		</script>
		</f:view>
		
	</body>
</html>
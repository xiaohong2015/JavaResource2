<%@ page contentType="text/html;charset=gbk" %>
<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>

<f:view>
	<html>
		<head>
			<title>����Ա��ҳ</title>
			<link type="text/css" rel="stylesheet" href="css/index.css"/>
			<link type="text/css" rel="stylesheet" href="css/admin.css"/>
			<script type="text/javascript" src="script/index.js"></script>
			<script type="text/javascript" src="script/general.js"></script>
		</head>
		<body>
			<div id="wrapper">
				<h:graphicImage value="/images/logo_pic.gif" />
				<%@ include file="AdminMenu.jsp" %><br/><br/><br/>
				<h:panelGroup style="font-weight:blod;font-size:30px;">
					<h:outputText value="#{AdminLoginBean.aname}" />
					<h:outputText value="����ӭ����Ѹ�ݹ���ϵͳ��"/>
				</h:panelGroup>
				<br/><br/><br/>
				<h:panelGroup>
					<h:outputText value="��ǰ��#{AdminIndexBean.lookHouseCount}��������鿴��Դ��Ϣ��" style="font-size:18px;"/>
					<br/>
					<h:outputLink value="#{facesContext.externalContext.requestContextPath}/faces/LookUserApply.jsp">
						<h:outputText value="������鿴��"/>
					</h:outputLink>
				</h:panelGroup>
				<br/><br/>
				<h:panelGroup>
					<h:outputText value="��ǰ��#{AdminIndexBean.lookQuestionCount}����������ѯ���⣡" style="font-size:18px;"/>
					<br/>
					<h:outputLink value="#{facesContext.externalContext.requestContextPath}/faces/LookAllQuestion.jsp">
						<h:outputText value="������鿴��"/>
					</h:outputLink>
				</h:panelGroup>
			</div>
		</body>
	</html>
</f:view>
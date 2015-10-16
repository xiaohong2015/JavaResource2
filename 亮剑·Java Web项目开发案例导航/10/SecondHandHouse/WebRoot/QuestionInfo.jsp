<%@ page contentType="text/html;charset=gbk" %>
<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>

<f:view>
	<html>
		<head>
			<title>������ѯ</title>
			<link type="text/css" rel="stylesheet" href="css/index.css"/>
			<link type="text/css" rel="stylesheet" href="css/tip.css" />
			<script type="text/javascript" src="script/index.js"></script>
			<script type="text/javascript" src="script/general.js"></script>
			<script type="text/javascript" src="script/trim.js"></script>
			<script type="text/javascript" src="script/question.js"></script>
		</head>
		<body onload="isLogin();">
			<div id="wrapper">
				<h:graphicImage value="/images/logo_pic.gif" />
				<%@ include file="Menu.jsp" %>
				<p style="text-align:left;padding-top:10px;">
					<h:outputText value=" ��ǰλ�ã�"/>
					<h:outputLink value="#{facesContext.externalContext.requestContextPath}/faces/Index.jsp">
						<h:outputText value="��ҳ" />
					</h:outputLink>
					<h:outputText value=">>������ѯ" />
				</p>
				<h:form id="mf_login" style="display:none;">
					<h:inputText value="#{UserLoginBean.flag}" id="flag" style="display:none;"/>
					<h:inputText value="#{UserLoginBean.url}" id="url" style="display:none;"/>					
				</h:form>
				<h:form id="mf_question" onsubmit="return checkQuestion();" rendered="#{UserLoginBean.flag}">
					<h:panelGrid columns="1" style="font-size:12px;">
						<br/>
						<h:outputText value="���⣨���þ����̵ܶ�����������������⣩��" style="width:100%;text-align:left;"/>
						<h:inputText id="title" value="#{QuestionInfoBean.title}" size="100" required="true"/>
						<h:message for="title" style="color:red;"/>
						<br/>
						<h:outputText value="���ݣ�����ϸ������������⣩��" style="width:100%;text-align:left;"/>
						<h:inputTextarea id="content" value="#{QuestionInfoBean.content}" cols="100" rows="20" required="true"/>
						<h:message for="content" style="color:red;" />
					</h:panelGrid>
					<h:panelGroup>
						<h:commandButton value="����" styleClass="btn" action="#{QuestionInfoBean.saveQuestion}"/>&nbsp;&nbsp;
						<h:commandButton value="����" styleClass="btn" type="reset"/>
					</h:panelGroup>
				</h:form>
			<%@ include file="Tip.jsp" %>
			</div>
		</body>
	</html>
</f:view>
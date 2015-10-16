<%@ page contentType="text/html;charset=gbk" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core" %>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html" %>

<f:view>
	<html>
		<head>
			<title>
				<h:outputText value="#{QuestionDetailBean.title}"/>
			</title>
			<link type="text/css" rel="stylesheet" href="css/index.css"/>
			<link type="text/css" rel="stylesheet" href="css/tip.css" />
			<link type="text/css" rel="stylesheet" href="css/admin.css"/>
			<script type="text/javascript" src="script/adminlogin.js"></script>
			<script type="text/javascript" src="script/trim.js"></script>
			<script type="text/javascript" src="script/index.js"></script>
			<script type="text/javascript" src="script/general.js"></script>
			<script type="text/javascript">
				function check() {
					var answer = document.getElementById("mf:answer").value.trim();
					if(answer=="") {
						showErrMsg("�ظ����ݲ���Ϊ�գ�","mf:answer");
						return false;
					}
					return true;
				}
			</script>
		</head>
		<body>
			<div id="wrapper">
				<h:graphicImage value="/images/logo_pic.gif" />
				<%@ include file="AdminMenu.jsp" %>
				<p style="text-align:left;padding-top:10px;">
					&nbsp;&nbsp;<h:outputText value="��ǰλ�ã�"/>
					<h:outputLink value="#{facesContext.externalContext.requestContextPath}/faces/AdminIndex.jsp">
						<h:outputText value="��ҳ" />
					</h:outputLink>
					<h:outputText value=">>����ظ�"/>
				</p><br/>
				<div style="width:95%;border:1px solid green;padding:5px;text-align:left;">
					<p style="border-bottom:1px dashed green;">
						<h:outputText value="���⣺"/>
					</p>
					<p>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<h:outputText value="#{QuestionDetailBean.content}"/>
					</p>
					<p style="border-top:1px dashed green;text-align:right;">
						<h:outputText value="���ⷢ���ڣ�"/>
						<h:outputText value="#{QuestionDetailBean.qtime}">
							<f:convertDateTime dateStyle="short" />
						</h:outputText>
					</p>
				</div><br/>
				<div style="width:95%;border:1px solid green;padding:5px;">
					<h:outputText value="����Ա�ظ���" style="text-align:left;width:100%;"/>
					<h:form id="mf" onsubmit="JavaScript:return check();">
						<h:inputTextarea id="answer" value="#{QuestionDetailBean.answer}" cols="95" rows="10" required="true"/>
						<h:message for="answer" style="color:red;" /><br/><br/>
							<h:commandButton value="�ظ�" styleClass="btn" action="#{QuestionDetailBean.adminAnswer}" />&nbsp;&nbsp;
							<h:commandButton value="����" styleClass="btn" type="reset" />
					</h:form><br/>
				</div>
				<%@ include file="Tip.jsp" %>
			</div>
		</body>
	</html>
</f:view>
<%@ page contentType="text/html;charset=gbk" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core" %>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html" %>

<f:view>
	<html>
		<head>
			<title>�����޸�</title>
			<link type="text/css" rel="stylesheet" href="css/index.css"/>
			<link type="text/css" rel="stylesheet" href="css/tip.css" />
			<link type="text/css" rel="stylesheet" href="css/admin.css"/>
			<script type="text/javascript" src="script/adminlogin.js"></script>
			<script type="text/javascript" src="script/trim.js"></script>
			<script type="text/javascript" src="script/index.js"></script>
			<script type="text/javascript" src="script/general.js"></script>
			<script type="text/javascript" src="script/modifyPwd.js"></script>
		</head>
		<body>
			<div id="wrapper">
				<h:graphicImage value="/images/logo_pic.gif" />
				<%@ include file="AdminMenu.jsp" %>
				<p style="text-align:left;padding-top:10px;">
					<h:outputText value="��ǰλ�ã�"/>
					<h:outputLink value="#{facesContext.externalContext.requestContextPath}/faces/AdminIndex.jsp">
						<h:outputText value="��ҳ" />
					</h:outputLink>
					<h:outputText value=">>�����޸�" />
				</p>
				<h:outputText value="�����ȵ�¼������" style="color:red;text-align:center;font-size:18px;" rendered="#{!AdminLoginBean.flag}" />
				<h:panelGroup rendered="#{AdminLoginBean.flag}" >
					<div style="font-size:5px;vertical-align:middle;border:1px solid #A8C29F;position:absolute;top:40%;left:25%;width:500px;height:200px;text-align:center;">
						<div style="background-color:#F7AE31;">
							<h:outputText value="�����޸�" style="text-align:center;font-size:18px;font-weight:bold;"/>
						</div><br/><br/>
						<div style="float:left;">
							<h:graphicImage value="/images/changepwd.png" />
						</div>
						<div style="float:left;">
							<h:form id="mf" onsubmit="JavaScript:return modifyAdminPwd();">
								<h:panelGrid columns="2" style="font-size:14px;text-align:center;">
									<h:outputText value="��  ��  ����"/>
									<h:outputText value="#{ModifyAdminPwdBean.aname}" style="text-align:left;" />
									<h:outputText value="������ɿ��"/>
									<h:panelGroup>
										<h:inputSecret id="oldPwd" value="#{ModifyAdminPwdBean.oldPwd}" style="height:20px;" required="true"/>
										<h:message for="oldPwd" style="color:red;"/>
									</h:panelGroup>
									<h:outputText value="�������¿��" style="text-align:right"/>
									<h:panelGroup>
										<h:inputSecret id="firstPwd" value="#{ModifyAdminPwdBean.firstPwd}" style="height:20px;" required="true" />
										<h:message for="firstPwd" style="color:red;" />
									</h:panelGroup>
									<h:outputText value="���ٴ������¿��" />
									<h:panelGroup>
										<h:inputSecret id="secondPwd" value="#{ModifyAdminPwdBean.secondPwd}" style="height:20px;" required="true"/>
										<h:message for="secondPwd" style="color:red;" />
									</h:panelGroup>
								</h:panelGrid>
								<h:panelGroup>
									<h:commandButton value="�޸�" styleClass="btn" action="#{ModifyAdminPwdBean.modify}" />&nbsp;&nbsp;
									<h:commandButton value="����" styleClass="btn" type="reset" />
								</h:panelGroup>
								<h:inputText id="errMsg" value="#{ModifyAdminPwdBean.errMsg}" style="display:none"/>
							</h:form>
						</div>
					</div>
					<%@ include file="Tip.jsp" %>
				</h:panelGroup>
			</div>
			<script type="text/javascript">
				function showMsg(){
					var msg = document.getElementById("mf:errMsg").value;
					if(msg.trim()!=""){
						alert(msg);
					}
				}
				window.onload=showMsg;
			</script>
		</body>
	</html>
</f:view>









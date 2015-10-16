<%@ page contentType="text/html;charset=gbk" %>
<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>

<f:view>
	<html>
		<head>
			<title>��д����������ͬ</title>
			<link type="text/css" rel="stylesheet" href="css/index.css"/>
			<link type="text/css" rel="stylesheet" href="css/tip.css" />
			<link type="text/css" rel="stylesheet" href="css/admin.css"/>
			<script type="text/javascript" src="script/trim.js"></script>
			<script type="text/javascript" src="script/index.js"></script>
			<script type="text/javascript" src="script/general.js"></script>
			<script type="text/javascript" src="script/contract.js"></script>
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
					<h:outputText value=">>��д����������ͬ"/>
				</p><br/>
				<div style="border:1px solid green;width:85%;padding:10px;">
					<h:form id="mf" onsubmit="JavaScript:return checkSaleContract();">
						<h:panelGrid columns="2">
							<h:outputText value="���۷���" style="font-size:14px;width:100%;text-align:right;"/>
							<h:panelGroup>
								<h:inputText id="first" value="#{SaleContractInfoBean.first}" required="true"/>
								<h:message for="first" style="color:red;"/>
							</h:panelGroup>
							<h:outputText value="�󹺷���" style="font-size:14px;width:100%;text-align:right;"/>
							<h:panelGroup>
								<h:inputText id="second" value="#{SaleContractInfoBean.second}" required="true"/>
								<h:message for="second" style="color:red;"/>
							</h:panelGroup>
							<h:outputText value="���۷����֤�ţ�" style="font-size:14px;width:100%;text-align:right;"/>
							<h:panelGroup>
								<h:inputText id="firstcardid" value="#{SaleContractInfoBean.firstCardId}"/>
								<h:message for="firstcardid" style="color:red;"/>
							</h:panelGroup>
							<h:outputText value="�󹺷����֤�ţ�" style="font-size:14px;width:100%;text-align:right;"/>
							<h:panelGroup>
								<h:inputText id="secondcardid" value="#{SaleContractInfoBean.secondCardId}"/>
								<h:message for="secondcardid" style="color:red;"/>
							</h:panelGroup>
							<h:outputText value="��Դλ�ã�" style="font-size:14px;width:100%;text-align:right;"/>
							<h:panelGroup>
								<h:inputText id="location" value="#{SaleContractInfoBean.location}"/>
								<h:message for="location" style="color:red;"/>
							</h:panelGroup>
							<h:outputText value="���������ƽ���ף���" style="font-size:14px;width:100%;text-align:right;"/>
							<h:panelGroup>
								<h:inputText id="housearea" value="#{SaleContractInfoBean.houseArea}"/>
								<h:message for="housearea" style="color:red;"/>
							</h:panelGroup>
							<h:outputText value="�����ۼ�(��Ԫ)��" style="font-size:14px;width:100%;text-align:right;"/>
							<h:panelGroup>
								<h:inputText id="houseprice" value="#{SaleContractInfoBean.housePrice}"/>
								<h:message for="houseprice" style="color:red;"/>
							</h:panelGroup>
							<h:outputText value="���۷������ˣ�" style="font-size:14px;width:100%;text-align:right;"/>
							<h:panelGroup>
								<h:inputText id="firstagent" value="#{SaleContractInfoBean.firstAgent}"/>
								<h:message for="firstagent" style="color:red;"/>
							</h:panelGroup>
							<h:outputText value="�󹺷������ˣ�" style="font-size:14px;width:100%;text-align:right;"/>
							<h:panelGroup>
								<h:inputText id="secondagent" value="#{SaleContractInfoBean.secondAgent}"/>
								<h:message for="secondagent" style="color:red;"/>
							</h:panelGroup>
							<h:outputText value="���۷���ϵ�绰��" style="font-size:14px;width:100%;text-align:right;"/>
							<h:panelGroup>
								<h:inputText id="firsttel" value="#{SaleContractInfoBean.firstTel}"/>
								<h:message for="firsttel" style="color:red;"/>
							</h:panelGroup>
							<h:outputText value="�󹺷���ϵ�绰��" style="font-size:14px;width:100%;text-align:right;"/>
							<h:panelGroup>
								<h:inputText id="secondtel" value="#{SaleContractInfoBean.secondTel}"/>
								<h:message for="secondtel" style="color:red;"/>
							</h:panelGroup>
							<h:outputText value="��ͬ״̬��" style="font-size:14px;width:100%;text-align:right;"/>
							<h:selectOneMenu value="#{SaleContractInfoBean.state}">
								<f:selectItem itemLabel="��ͬ��ǩ��" itemValue="��ͬ��ǩ��"/>
								<f:selectItem itemLabel="���Ѹ���" itemValue="���Ѹ���"/>
								<f:selectItem itemLabel="�����ѹ���" itemValue="�����ѹ���"/>
								<f:selectItem itemLabel="�������" itemValue="�������"/>
							</h:selectOneMenu>					
						</h:panelGrid><br/>
						<h:panelGroup>
							<h:commandButton styleClass="btn" value="���ɺ�ͬ" action="#{SaleContractInfoBean.insertContract}"/>&nbsp;&nbsp;
							<h:commandButton styleClass="btn" value="����" type="reset"/>
						</h:panelGroup>
					</h:form><br/>
				</div>
				<%@ include file="Tip.jsp" %>
			</div>
		</body>
	</html>
</f:view>
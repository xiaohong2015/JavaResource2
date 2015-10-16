<%@ page contentType="text/html;charset=gbk" %>
<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>

<f:view>
	<html>
		<head>
			<title>��д�������޺�ͬ</title>
			<link type="text/css" rel="stylesheet" href="css/index.css"/>
			<link type="text/css" rel="stylesheet" href="css/tip.css" />
			<link type="text/css" rel="stylesheet" href="css/admin.css"/>
			<script type="text/javascript" src="script/index.js"></script>
			<script type="text/javascript" src="script/trim.js"></script>
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
					<h:outputText value=">>��д�������޺�ͬ"/>
				</p>
				<div style="border:1px solid green;width:85%;padding:10px;">
					<h:form id="mf" onsubmit="JavaScript:return checkRentContract();">
						<h:panelGrid columns="2">
							<h:outputText value="���޷���" style="font-size:14px;width:100%;text-align:right;"/>
							<h:panelGroup>
								<h:inputText id="first" value="#{RentContractInfoBean.first}" required="true"/>
								<h:message for="first" style="color:red;"/>
							</h:panelGroup>
							<h:outputText value="���ⷽ��" style="font-size:14px;width:100%;text-align:right;"/>
							<h:panelGroup>
								<h:inputText id="second" value="#{RentContractInfoBean.second}" required="true"/>
								<h:message for="second" style="color:red;"/>
							</h:panelGroup>
							<h:outputText value="��ʼ���ڣ�" style="font-size:14px;width:100%;text-align:right;"/>
							<h:panelGroup>
								<h:inputText id="beginTime" value="#{RentContractInfoBean.beginTime}" required="true">
									<f:convertDateTime pattern="yyyy-MM-dd"/>
								</h:inputText>
								<h:message for="beginTime" style="color:red;"/>
							</h:panelGroup>
							<h:outputText value="��ֹ���ڣ�" style="font-size:14px;width:100%;text-align:right;"/>
							<h:panelGroup>
								<h:inputText id="endTime" value="#{RentContractInfoBean.endTime}" required="true">
									<f:convertDateTime pattern="yyyy-MM-dd"/>
								</h:inputText>
								<h:message for="endTime" style="color:red;"/>
							</h:panelGroup>
							<h:outputText value="�۸�(Ԫ/��)��" style="font-size:14px;width:100%;text-align:right;"/>
							<h:panelGroup>
								<h:inputText id="price" value="#{RentContractInfoBean.price}" required="true"/>
								<h:message for="price" style="color:red;"/>
							</h:panelGroup>
							<h:outputText value="���޷������ˣ�" style="font-size:14px;width:100%;text-align:right;"/>
							<h:panelGroup>
								<h:inputText id="firstAgent" value="#{RentContractInfoBean.firstAgent}"/>
								<h:message for="firstAgent" style="color:red;"/>
							</h:panelGroup>
							<h:outputText value="���ⷽ�����ˣ�" style="font-size:14px;width:100%;text-align:right;"/>
							<h:panelGroup>
								<h:inputText id="secondAgent" value="#{RentContractInfoBean.secondAgent}"/>
								<h:message for="secondAgent" style="color:red;"/>
							</h:panelGroup>
							<h:outputText value="���޷���ϵ�绰��" style="font-size:14px;width:100%;text-align:right;"/>
							<h:panelGroup>
								<h:inputText id="firstTel" value="#{RentContractInfoBean.firstTel}"/>
								<h:message for="firstTel" style="color:red;"/>
							</h:panelGroup>
							<h:outputText value="���ⷽ��ϵ�绰��" style="font-size:14px;width:100%;text-align:right;"/>
							<h:panelGroup>
								<h:inputText id="secondTel" value="#{RentContractInfoBean.secondTel}"/>
								<h:message for="secondTel" style="color:red;"/>
							</h:panelGroup>
							<h:outputText value="����λ�ã�" style="font-size:14px;width:100%;text-align:right;"/>
							<h:panelGroup>
								<h:inputText id="address" value="#{RentContractInfoBean.address}"/>
								<h:message for="address" style="color:red;"/>
							</h:panelGroup>
							<h:outputText value="��ͬ״̬��" style="font-size:14px;width:100%;text-align:right;"/>
							<h:selectOneMenu value="#{RentContractInfoBean.state}">
								<f:selectItem itemLabel="��ͬ��ǩ��" itemValue="��ͬ��ǩ��"/>
								<f:selectItem itemLabel="���Ѹ���" itemValue="���Ѹ���"/>
								<f:selectItem itemLabel="�����ѹ���" itemValue="�����ѹ���"/>
								<f:selectItem itemLabel="�������" itemValue="�������"/>
							</h:selectOneMenu>					
						</h:panelGrid><br/>
						<h:panelGroup>
							<h:commandButton styleClass="btn" value="���ɺ�ͬ" action="#{RentContractInfoBean.insertContract}"/>&nbsp;&nbsp;
							<h:commandButton styleClass="btn" value="����" type="reset"/>
						</h:panelGroup>
						<h:inputText id="errMsg" value="#{RentContractInfoBean.errMsg}" style="display:none"/>
					</h:form><br/>
				</div>
				<%@ include file="Tip.jsp" %>
				<script type="text/javascript">
					function showMsg(){
						var msg = document.getElementById("mf:errMsg").value;
						if(msg.trim()!=""){
							alert(msg);
							document.getElementById("mf:errMsg").value="";
						}
					}
					window.onload=showMsg;
				</script>
			</div>
		</body>
	</html>
</f:view>
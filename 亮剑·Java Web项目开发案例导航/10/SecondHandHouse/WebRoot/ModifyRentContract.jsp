<%@ page contentType="text/html;charset=gbk" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core" %>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html" %>

<f:view>
	<html>
		<head>
			<title>�޸����޺�ͬ</title>
			<link type="text/css" rel="stylesheet" href="css/index.css"/>
			<link type="text/css" rel="stylesheet" href="css/tip.css" />
			<link type="text/css" rel="stylesheet" href="css/admin.css"/>
			<script type="text/javascript" src="script/adminlogin.js"></script>
			<script type="text/javascript" src="script/trim.js"></script>
			<script type="text/javascript" src="script/index.js"></script>
			<script type="text/javascript" src="script/allinfo.js"></script>
			<script type="text/javascript" src="script/general.js"></script>
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
					<h:outputText value=">>�޸ĺ�ͬ״̬"/>
				</p><br/><br/><br/>
				<h:form id="mf">
					<h:outputText value="��ѡ���ͬ״̬��"/>
					<h:selectOneMenu value="#{ModifyRentContractBean.state}">
						<f:selectItem itemLabel="��ͬ��ǩ��" itemValue="��ͬ��ǩ��"/>
						<f:selectItem itemLabel="���Ѹ���" itemValue="���Ѹ���"/>
						<f:selectItem itemLabel="�����ѹ���" itemValue="�����ѹ���"/>
						<f:selectItem itemLabel="�������" itemValue="�������"/>
					</h:selectOneMenu>&nbsp;&nbsp;
					<h:commandButton styleClass="btn" value="�޸�" action="#{ModifyRentContractBean.modify}"/>				
				</h:form>
			</div>
		</body>
	</html>
</f:view>
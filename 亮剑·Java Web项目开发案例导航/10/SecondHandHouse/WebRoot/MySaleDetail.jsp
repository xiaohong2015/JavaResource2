<%@ page contentType="text/html;charset=gbk" %>
<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<f:view>
	<html>
		<head>
			<title>������Ϣ��ϸ</title>
			<link type="text/css" rel="stylesheet" href="css/index.css"/>
			<link type="text/css" rel="stylesheet" href="css/tip.css" />
			<script type="text/javascript" src="script/index.js"></script>
			<script type="text/javascript" src="script/general.js"></script>
			<script type="text/javascript" src="script/trim.js"></script>
		</head>
		<body>
			<div id="wrapper">
				<h:graphicImage value="/images/logo_pic.gif" />
				<%@ include file="Menu.jsp" %>
				<p style="text-align:left;padding-top:10px;">
					<h:outputText value=" ��ǰλ�ã�"/>
					<h:outputLink value="#{facesContext.externalContext.requestContextPath}/faces/Index.jsp">
						<h:outputText value="��ҳ" />
					</h:outputLink>
					<h:outputText value=">>������Ϣ��ϸ" />
				</p><br/><br/>
				<p style="font-size:20px;">
					<h:outputText value="#{MySaleDetailBean.msgtype}��Ϣ��ϸ"/>
				</p>
				<h:panelGrid columns="2" style="border:1px solid gray;width:80%;">
					<h:panelGroup>
						<h:outputText value="��Ϣ���ͣ�"/>
						<h:outputText value="#{MySaleDetailBean.msgtype}"/>
					</h:panelGroup>
					<h:panelGroup>
						<h:outputText value="����λ�ã�"/>
						<h:outputText value="#{MySaleDetailBean.location}"/>
					</h:panelGroup>
					<h:panelGroup>
						<h:outputText value="����λ�ã�"/>
						<h:outputText value="#{MySaleDetailBean.detail}"/>
					</h:panelGroup>
					<h:panelGroup>
						<h:outputText value="���ȣ�"/>
						<h:outputText value="#{MySaleDetailBean.longitude}"/>
					</h:panelGroup>
					<h:panelGroup>
						<h:outputText value="γ�ȣ�"/>
						<h:outputText value="#{MySaleDetailBean.latitude}"/>
					</h:panelGroup>
					<h:panelGroup>
						<h:outputText value="��ҵ��"/>
						<h:outputText value="#{MySaleDetailBean.wuye}"/>
					</h:panelGroup>
					<h:panelGroup>
						<h:outputText value="���ͣ�"/>
						<h:outputText value="#{MySaleDetailBean.type}"/>
					</h:panelGroup>
					<h:panelGroup>
						<h:outputText value="�����"/>
						<h:outputText value="#{MySaleDetailBean.area}"/>
					</h:panelGroup>
					<h:panelGroup>
						<h:outputText value="�۸�"/>
						<h:outputText value="#{MySaleDetailBean.price}"/>
					</h:panelGroup>
					<h:panelGroup>
						<h:outputText value="��ϵ�ˣ�"/>
						<h:outputText value="#{MySaleDetailBean.linkman}"/>
					</h:panelGroup>
					<h:panelGroup>
						<h:outputText value="�绰��"/>
						<h:outputText value="#{MySaleDetailBean.tel}"/>
					</h:panelGroup>
					<h:panelGroup>
						<h:outputText value="E-mail:"/>
						<h:outputText value="#{MySaleDetailBean.email}"/>
					</h:panelGroup>
					<h:panelGroup>
						<h:outputText value="����ʱ�䣺"/>
						<h:outputText value="#{MySaleDetailBean.publishtime}"/>
					</h:panelGroup>
					<h:panelGroup>
						<h:outputText value="��ע��"/>
						<h:outputText value="#{MySaleDetailBean.remark}"/>
					</h:panelGroup>
				</h:panelGrid>
			</div>
		</body>
	</html>
</f:view>
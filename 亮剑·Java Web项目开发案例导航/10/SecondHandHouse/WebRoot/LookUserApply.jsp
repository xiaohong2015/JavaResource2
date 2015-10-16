<%@ page contentType="text/html;charset=gbk" %>
<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>

<f:view>
	<html>
		<head>
			<title>����鿴��Դ�б�</title>
			<link type="text/css" rel="stylesheet" href="css/index.css"/>
			<link type="text/css" rel="stylesheet" href="css/admin.css"/>
			<script type="text/javascript" src="script/index.js"></script>
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
					<h:outputText value=">>����鿴��Դ�б�"/>
				</p><br/>
				<h:outputText value="#{LookUserApplyBean.initList}" style="display:none;"/>
				<h:form rendered="#{LookUserApplyBean.flag}">
					<div style="width:95%;border:1px solid green;padding:2px;">
					<h:dataTable value="#{LookUserApplyBean.applyList}" var="ai" width="100%" rowClasses="evenRow,oddRow" columnClasses="perCol,perCol,perCol" style="font-size:12px;">								
				        <h:column>
				        	<f:facet name="header">
									<h:outputText value="��Դλ��"/>
	            			</f:facet>
				        	<h:commandLink value="#{ai.location}" action="#{LookUserApplyBean.getSelectObj}"/>
				        </h:column>
				        <h:column>
				        	<f:facet name="header">
									<h:outputText value="��Ϣ����"/>
	            			</f:facet>  
				            <h:outputText value="#{ai.msgtype}"/>
				        </h:column>
				        <h:column>
				        	<f:facet name="header">
									<h:outputText value="��ϸ��Ϣ"/>
	            			</f:facet>  
				            <h:commandButton image="/images/mod.gif" action="#{LookUserApplyBean.getSelectObj}"/>
				        </h:column>
				    </h:dataTable>
				    </div>
			    </h:form>
				<h:outputText value="������Ϣ��" rendered="#{!LookUserApplyBean.flag}"/>
			</div>
		</body>
	</html>
</f:view>
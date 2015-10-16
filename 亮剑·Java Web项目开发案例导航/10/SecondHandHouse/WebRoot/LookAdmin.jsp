<%@ page contentType="text/html;charset=gbk" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core" %>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html" %>

<f:view>
<html>
	<head>
		<title>�鿴����Ա</title>
			<link type="text/css" rel="stylesheet" href="css/index.css"/>
			<link type="text/css" rel="stylesheet" href="css/tip.css" />
			<link type="text/css" rel="stylesheet" href="css/admin.css"/>
			<script type="text/javascript" src="script/adminlogin.js"></script>
			<script type="text/javascript" src="script/trim.js"></script>
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
				<h:outputText value=">>�鿴����Ա"/>
			</p><br/>
			<div style="width:95%;border:1px solid green;padding:5px;">
				<h:form>
					<h:dataTable value="#{LookAdminBean.adminObj}" var="ai" width="100%" rowClasses="evenRow,oddRow" columnClasses="moreCol,moreCol,moreCol,moreCol,moreCol,moreCol,moreCol" style="font-size:12px;">								
				        <h:column>
							<f:facet name="header">
								<h:outputText value="�û���"/>
        					</f:facet>     
				        	<h:commandLink value="#{ai.a_name}"/>
				        </h:column>
				        <h:column>
							<f:facet name="header">
								<h:outputText value="�Ա�"/>
        					</f:facet>  
				            <h:outputText value="#{ai.a_gender}"/>
				        </h:column>
				        <h:column>
							<f:facet name="header">
								<h:outputText value="����"/>
        					</f:facet>
				            <h:outputText value="#{ai.a_level}"/>
				        </h:column>
				        <h:column>
				        	<f:facet name="header">
								<h:outputText value="ɾ��"/>
        					</f:facet>
        					<h:commandButton image="/images/del.gif" action="#{LookAdminBean.deleteAdminObj}"/>
				        </h:column>
				    </h:dataTable>
				</h:form>
			</div>				
		</div>
	</body>
</html>
</f:view>
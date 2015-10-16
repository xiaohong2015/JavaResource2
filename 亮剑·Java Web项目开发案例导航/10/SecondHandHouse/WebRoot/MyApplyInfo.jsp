<%@ page contentType="text/html;charset=gbk" %>
<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>

<f:view>
	<html>
		<head>
			<title>�ҵ�ԤԼ</title>
			<link type="text/css" rel="stylesheet" href="css/index.css"/>
			<link type="text/css" rel="stylesheet" href="css/tip.css" />
			<script type="text/javascript" src="script/index.js"></script>
			<script type="text/javascript" src="script/general.js"></script>
		</head>
		<body>
			<div id="wrapper">
				<h:graphicImage value="/images/logo_pic.gif" />
				<%@ include file="Menu.jsp" %>
				<h:outputText value="#{MyApplyInfoBean.initList}" style="display:none;"/>
				<p style="text-align:left;padding-top:10px;">
					<h:outputText value=" ��ǰλ�ã�"/>
					<h:outputLink value="#{facesContext.externalContext.requestContextPath}/faces/Index.jsp">
						<h:outputText value="��ҳ" />
					</h:outputLink>
					<h:outputText value=">>�ҵ�ԤԼ" />
				</p>
				<h:form>
				<h:dataTable value="#{MyApplyInfoBean.myApplyList}" var="ai" width="100%" rowClasses="evenRow,oddRow" columnClasses="perCol,perCol,perCol" style="font-size:12px;" rendered="#{MyApplyInfoBean.showObj}">								
			        <h:column>
			        	<f:facet name="header">
								<h:outputText value="��ҵ��ַ/����"/>
            			</f:facet>
			        	<h:commandLink value="#{ai.location}" action="#{MyApplyInfoBean.showDetail}"/>
			        </h:column>			        
			        <h:column>
			        	<f:facet name="header">
								<h:outputText value="��Ϣ����"/>
            			</f:facet>  
			            <h:outputText value="#{ai.msgtype}"/>
			        </h:column>
			        <h:column>
			        	<f:facet name="header">
								<h:outputText value="����"/>
            			</f:facet>  
			            <h:outputText value="#{ai.type}"/>
			        </h:column>
			        <h:column>
			        	<f:facet name="header">
								<h:outputText value="�Ƿ���׼"/>
            			</f:facet>  
			            <h:outputText value="#{ai.agree}"/>
			        </h:column>
			       	<h:column>
			        	<f:facet name="header">
								<h:outputText value="ɾ��"/>
            			</f:facet>  
			            <h:commandButton image="/images/del.gif" action="#{MyApplyInfoBean.deleteObj}"/>
			        </h:column>
			    </h:dataTable>
			    <h:outputText value="������Ϣ��" rendered="#{!MyApplyInfoBean.showObj}"/>
			    </h:form>				
			</div>
		</body>
	</html>
</f:view>
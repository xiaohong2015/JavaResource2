<%@ page contentType="text/html;charset=gbk" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core" %>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html" %>

<f:view>
	<html>
		<head>
			<title>�����б�</title>
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
					<h:outputText value=">>�����б�"/>
				</p><br/>
				<h:outputText value="#{LookAllQuestionBean.initList}" style="display:none;"/>
				<h:outputText value="�������⣡" rendered="#{!LookAllQuestionBean.flag}" style="font-size:25px;color:red;"/>
				<h:panelGroup rendered="#{LookAllQuestionBean.flag}">
				<div style="width:95%;border:1px solid green;padding:5px;">
					<h:form>
						<h:dataTable value="#{LookAllQuestionBean.questionObj}" var="qi" width="100%" rowClasses="evenRow,oddRow" columnClasses="moreCol,moreCol,moreCol,moreCol,moreCol,moreCol,moreCol" style="font-size:12px;">								
					        <h:column>
								<f:facet name="header">
									<h:outputText value="����"/>
	        					</f:facet>     
					        	<h:commandLink value="#{qi.q_title}" action="#{LookAllQuestionBean.getSelectObj}"/>
					        </h:column>
					        <h:column>
								<f:facet name="header">
									<h:outputText value="����ʱ��"/>
	        					</f:facet>
					            <h:outputText value="#{qi.q_time}">
					            	<f:convertDateTime dateStyle="short" />
					            </h:outputText>
					        </h:column>
					        <h:column>
								<f:facet name="header">
									<h:outputText value="�ظ�"/>
	        					</f:facet>
					            <h:commandLink value="�ظ�" action="#{LookAllQuestionBean.getSelectObj}"/>
					        </h:column>
					    </h:dataTable>
					</h:form>
				</div>
				</h:panelGroup>
			</div>
		</body>
	</html>
</f:view>
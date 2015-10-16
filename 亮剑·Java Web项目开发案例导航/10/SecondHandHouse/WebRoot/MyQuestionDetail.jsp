<%@ page contentType="text/html;charset=gbk" %>
<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>

<f:view>
	<html>
		<head>
			<title>�ҵ�����</title>
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
				<h:outputText value="#{MyQuestionDetailBean.initList}" style="display:none;"/>
				<p style="text-align:left;padding-top:10px;">
					<h:outputText value=" ��ǰλ�ã�"/>
					<h:outputLink value="#{facesContext.externalContext.requestContextPath}/faces/Index.jsp">
						<h:outputText value="��ҳ" />
					</h:outputLink>
					<h:outputText value=">>�ҵ�����" />
				</p><br/>
				<div style="width:95%;border:1px solid green;text-align:left;padding:10px;">
					<p style="border-bottom:1px dashed green;">
						<h:outputText value="���⣺"/>
					</p>
					<p>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<h:outputText value="#{MyQuestionDetailBean.content}"/>
					</p>
					<p style="border-top:1px dashed green;text-align:right;">
						<h:outputText value="���ⷢ���ڣ�"/>
						<h:outputText value="#{MyQuestionDetailBean.publishTime}"/>
					</p>
				</div><br/>
				<h:panelGroup rendered="#{MyQuestionDetailBean.flag}">
					<div style="width:95%;border:1px solid green;text-align:left;padding:10px;">
						<p style="border-bottom:1px dashed green;">
							<h:outputText value="����Ա�ظ���"/>
						</p>
						<p>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<h:outputText value="#{MyQuestionDetailBean.answerContent}"/>
						</p>
						<p style="border-top:1px dashed green;text-align:right;">
							<h:outputText value="�ظ��ڣ�"/>
							<h:outputText value="#{MyQuestionDetailBean.answerTime}"/>
						</p>
					</div>
				</h:panelGroup>
			</div>
		</body>
	</html>
</f:view>
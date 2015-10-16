<%@ page contentType="text/html;charset=gbk" %>
<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>

<f:view>
	<html>
		<head>
			<title>�û���¼</title>
			<link type="text/css" rel="stylesheet" href="css/index.css"/>
			<link type="text/css" rel="stylesheet" href="css/tip.css" />
			<script type="text/javascript" src="script/index.js"></script>
			<script type="text/javascript" src="script/general.js"></script>
			<script type="text/javascript" src="script/trim.js"></script>
			<script type="text/javascript" src="script/login.js"></script>
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
					<h:outputText value=">>��Ա��¼" />
				</p>
				<div style="font-size:5px;vertical-align:middle;border:1px solid #A8C29F;position:absolute;top:40%;left:25%;width:500px;height:200px;text-align:center;">
					<div style="background-color:#F7AE31;">
						<h:outputText value="Ѹ�ݻ�Ա��¼" style="text-align:center;font-size:18px;font-weight:bold;"/>
					</div><br/><br/>
					<div style="float:left;">
						<h:graphicImage value="/images/login.png" />
					</div>
					<div style="float:left;">
						<h:form id="mf" onsubmit="return check();">
							<h:panelGrid columns="3" style="font-size:14px;vertical-align:middle;">
								<h:outputText value="�û�����"/>
								<h:inputText id="uname" value="#{UserLoginBean.uname}" required="true" style="height:20px;width:150px;"/>
								<h:message for="uname" style="color:red"/>
								<h:outputText value="�� �룺" />
								<h:inputSecret id="upwd" value="#{UserLoginBean.upwd}" required="true"  style="height:20px;width:150px;"/>
								<h:message for="upwd" style="color:red"/>
								<h:outputText value="��֤�룺" />
								<h:inputText id="uyzm" value="#{UserLoginBean.yzm}" required="true" style="height:20px;width:150px;"/>
								<h:message for="uyzm" style="color:red"/>
							</h:panelGrid>
							<h:panelGrid columns="1" style="text-align:center;">
								<h:graphicImage alt="�����壬�����һ��" id="yzm" value="yzm.jsp" onclick="JavaScript:loadImg();" style="cursor:hand;"/>
								<h:panelGroup>
									<h:commandButton value="��¼" styleClass="btn" action="#{UserLoginBean.login}"/>&nbsp;&nbsp;						
									<h:commandButton value="����" styleClass="btn" type="reset"/>
								</h:panelGroup>
							</h:panelGrid>
							<h:inputText id="errMsg" value="#{UserLoginBean.errMsg}" style="display:none"/>
						</h:form>
					</div>
				</div>
				<%@ include file="Tip.jsp" %>
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
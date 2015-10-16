<%@ page contentType="text/html;charset=gbk" %>
<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<f:view>
	<html>
		<head>
			<title>������Ϣ�޸�</title>
			<link type="text/css" rel="stylesheet" href="css/index.css"/>
			<link type="text/css" rel="stylesheet" href="css/tip.css" />
			<script type="text/javascript" src="script/index.js"></script>
			<script type="text/javascript" src="script/trim.js"></script>
			<script type="text/javascript" src="script/general.js"></script>
			<script type="text/javascript" src="script/sale.js"></script>
		</head>
		<body onload="JavaScript:login();">
			<div id="wrapper">
				<h:graphicImage value="/images/logo_pic.gif" />
				<%@ include file="Menu.jsp" %>
				<p style="text-align:left;padding-top:10px;">
					<h:outputText value=" ��ǰλ�ã�"/>
					<h:outputLink value="#{facesContext.externalContext.requestContextPath}/faces/Index.jsp">
						<h:outputText value="��ҳ" />
					</h:outputLink>
					<h:outputText value=">>������Ϣ�޸�" />
				</p>
				<h:form id="mf_login" style="display:none;">
					<h:inputText value="#{UserLoginBean.flag}" id="flag" style="display:none;"/>
					<h:inputText value="#{UserLoginBean.url}" id="url" style="display:none;"/>
				</h:form>
				<h:panelGroup rendered="#{UserLoginBean.flag}">
				<div style="border:1px solid gray;width:85%;margin:20px;padding-bottom:20px;">
					<div style="background-color:#F7AE31;">������Ϣ�޸�</div><br/>
					<h:form id="mf_sale" onsubmit="JavaScript:return check();">
						<h:inputText value="#{ModifyMySaleInfoBean.msgtype}" id="msgtype" style="display:none;"/>
						<h:panelGrid columns="2" style="font-size:14px;">
				   			<h:outputText value="��Դ����λ�ã�" style="text-align:right;width:100%;"/>
				   			<h:panelGroup>
				   				<h:inputText value="#{ModifyMySaleInfoBean.location}" id="location" required="true" />
				   				<h:message for="location" style="color:red;"/>
				   				<h:outputText value=" ����д���ȵ���Ҫ��(��)�ⷿ�ݵ�С��" style="font-size:12px;color:#909090" />
				   			</h:panelGroup>
				   			<h:outputText value="��Դ����λ�ã�" style="text-align:right;width:100%;" />
				   			<h:panelGroup>
				   				<h:inputText id="detail" value="#{ModifyMySaleInfoBean.detail}" required="true"/>
				   				<h:message for="detail" style="color:red;"/>
				   				<h:outputText value=" ����д���ȵ���Ҫ���ⷿ�ݵ����ƺ�" style="font-size:12px;color:#909090"/>
				   			</h:panelGroup>
				   			<h:outputText value=" �����뾭�ȣ�" style="text-align:right;width:100%;"/>
				   			<h:panelGroup>
				   				<h:inputText value="#{ModifyMySaleInfoBean.longitude}" id="longitude" required="true"/>
				   				<h:message for="longitude" style="color:red;"/>
				   				<h:outputText value=" ����д��������λ�õľ���" style="font-size:12px;color:#909090"/>
				   			</h:panelGroup>
				   			<h:outputText value=" ������γ�ȣ�" style="text-align:right;width:100%;"/>
				   			<h:panelGroup>
				   				<h:inputText value="#{ModifyMySaleInfoBean.latitude}" id="latitude" required="true"/>
				   				<h:message for="latitude" style="color:red;"/>
				   				<h:outputText value=" ����д��������λ�õ�γ��" style="font-size:12px;color:#909090"/>
				   			</h:panelGroup>
				   			<h:outputText value=" ��ѡ����ҵ���ͣ�" style="text-align:right;width:100%;" />
		   					<h:selectOneMenu value="#{ModifyMySaleInfoBean.wuye}" id="wuye" required="true">
   								<f:selectItems value="#{MsgSearchBean.houseType}" />
   							</h:selectOneMenu>
				   			<h:outputText value=" ��ѡ���ݵĻ��ͣ�" style="text-align:right;width:100%;"/>
				   			<h:selectOneMenu value="#{ModifyMySaleInfoBean.type}">
				   				<f:selectItems value="#{MsgSearchBean.houseSize}" />
				   			</h:selectOneMenu>
				   			<h:outputText value="����д���ݵ������" style="text-align:right;width:100%;"/>
				   			<h:panelGroup>
				   				<h:inputText value="#{ModifyMySaleInfoBean.area}" id="area" required="true"/>
				   				<h:outputText value=" ƽ����" />
				   				<h:message for="area" style="color:red;"/>
				   			</h:panelGroup>
				   			<h:outputText value="����д¥�㣺" style="text-align:right;width:100%;"/>
				   			<h:panelGroup>
				   				<h:inputText value="#{ModifyMySaleInfoBean.high}" id="high" required="true"/>
				   				<h:outputText value=" ���磺4/5" style="font-size:12px;color:#909090"/>
				   				<h:message for="high" style="color:red;"/>
				   			</h:panelGroup>
				   			<h:outputText value="������۸�" style="text-align:right;width:100%;" />
				   			<h:panelGroup>
				   				<h:inputText value="#{ModifyMySaleInfoBean.price}" id="price" required="true"/>
				   				<h:outputText value=" ��Ԫ"/>
				   				<h:message for="price" style="color:red;"/>
				   			</h:panelGroup>
				   			<h:outputText value="����д��ϵ��������" style="text-align:right;width:100%;"/>
				   			<h:panelGroup>
				   				<h:inputText value="#{ModifyMySaleInfoBean.linkman}" id="linkman" required="true" />
				   				<h:message for="linkman" style="color:red;"/>
				   			</h:panelGroup>
				   			<h:outputText value="����д��ϵ�˵�ַ��" style="text-align:right;width:100%;"/>
				   			<h:panelGroup>
				   				<h:inputText value="#{ModifyMySaleInfoBean.address}" id="address" required="true"/>
				   				<h:message for="address" style="color:red;"/>
				   			</h:panelGroup>
				   			<h:outputText value="����д��ϵ�˵绰��" style="text-align:right;width:100%;"/>
				   			<h:panelGroup>
				   				<h:inputText value="#{ModifyMySaleInfoBean.tel}" id="tel" required="true"/>
				   				<h:message for="tel" style="color:red;"/>
				   			</h:panelGroup>
				   			<h:outputText value="����д��ϵ��E-mail��" style="text-align:right;width:100%;"/>
				   			<h:panelGroup>
				   				<h:inputText value="#{ModifyMySaleInfoBean.email}" id="email" required="true" />
				   				<h:message for="email" style="color:red;"/>
				   			</h:panelGroup>
				   			<h:outputText value="��ע��" style="text-align:right;width:100%;" />
				   			<h:panelGroup>
				   				<h:inputTextarea value="#{ModifyMySaleInfoBean.remark}" id="remark" cols="30"/>
								<h:message for="remark" style="color:red;" />
							</h:panelGroup>
						</h:panelGrid>
						<h:panelGroup><br/>
							<h:commandButton value="�޸�" styleClass="btn" action="#{ModifyMySaleInfoBean.modify}"/>&nbsp;
							<h:commandButton value="����" styleClass="btn" type="reset"/>
						</h:panelGroup>
					</h:form>
				</div>
				</h:panelGroup>
				<%@ include file="Tip.jsp" %>
			</div>
		</body>
	</html>
</f:view>
<%@ page contentType="text/html;charset=GBK" %>
<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<f:view>
<html>
 <head>
  <title>A10�Ƶ�Ԥ�����Ļ�ӭ��</title>
  <link rel="stylesheet" type="text/css" href="script/main.css"/>
  <link rel="stylesheet" type="text/css" href="script/style.css"/>
  <script language="JavaScript" src="script/showMsg.js"></script>
  <script language="JavaScript" src="script/login.js"></script>
 </head>
 <body>
 <div class="MainBox">
 	<%@ include file="top.jsp" %>
 	<span style="margin-left:5px;">��ҳ >>  �û���¼</span>
    <table class="RegBox" align="center" border="0" width="750">
    	<caption style="font-size:15px;margin-bottom:10px;">�û���¼</caption>
       	<h:form id="loginform" onsubmit="return checkLogin();">
       	<tr>
       		<td align="right" width="150"><h:outputText value="������֤�룺"/></td>
       		<td>
       			<h:inputText id="yzm" value="#{UserLogin.valCode}" styleClass="yzm" />
       			<a href="javascript:reloadImage();" title="�����壿�����һ��^_^" tabindex="100">
       				<h:graphicImage value="/yzm.jsp" id="pic" style="vertical-align:middle;border:0"/>
				</a>
				<a href="javascript:reloadImage();" tabindex="200">
	 				<font color="#bc2931" size="2" face="����" title="�����ִ�Сд">�������������ͼƬ</font>
	 			</a>
	 			<span id="codeMsg" class="message"></span>
       		</td>
       	</tr>
       	
       	<tr>
       		<td align="right"><h:outputText value="�û�����"/></td>
       		<td><h:inputText id="uname" value="#{UserLogin.uname}" styleClass="input"/>
       		<span class="message">���������ڱ��Ƶ�ע����û��� 
       				<h:outputLink value="reg.jsp" rendered="true" tabindex="100">
						<h:outputText value="û���û������������ע��"/>
					</h:outputLink>
       		</span></td>
       	</tr>
       	
       	<tr>
       		<td align="right"><h:outputText value="��   �룺"/></td>
       		<td><h:inputSecret id="pwd" value="#{UserLogin.pwd}" styleClass="input"/>
       		<span id="pwdMsg" class="message">��������������</span></td>
       	</tr>       	
       
       	<tr>
       		<td></td>
       		<td>
       			<input type="reset" value="�� ��" class="button">
       			<h:commandButton value="�� ¼" action="#{UserLogin.loginUser}" styleClass="button"/>
       			<h:outputText value="#{UserLogin.message}" style="color:red;vertical-align:middle;"/>
       		</td>
       	</tr>
       	</h:form>
     </table>
     <%@ include file="qq.jsp" %>
 </body>
 </div>
</html>
</f:view>
<%@ page contentType="text/html;charset=GBK" %>
<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<f:view>
<html>
 <head>
  <title>A10�Ƶ�Ԥ�����Ļ�ӭ��</title>
  <link rel="stylesheet" type="text/css" href="script/main.css"/>
  <link rel="stylesheet" type="text/css" href="script/reg.css"/>  
  <link rel="stylesheet" type="text/css" href="script/style.css"/>
  <script language="JavaScript" src="script/reg.js"></script>  
  <script language="JavaScript" src="script/showMsg.js"></script>
 </head>
 <body>
 <div class="MainBox">
 	<%@ include file="top.jsp" %>
 	<span style="margin-left:5px;">��ҳ >>  ���û�ע��</span>
    <table class="RegBox" align="center" border="0" width="750">
    	<caption style="font-size:15px;margin-bottom:10px;">���û�ע��</caption>    	
       	<h:form id="regform" onsubmit="return checkReg();">
       	<tr>
       		<td align="right" width="150"><h:outputText value="������֤�룺"/></td>
       		<td>
       			<h:inputText id="yzm" value="#{RegBean.valCode}" styleClass="yzm" onblur="checkValCode()"/>
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
       		<td><h:inputText id="uname" value="#{RegBean.uname}" styleClass="input" onblur="checkUname()"/>
       		<span id="unameMsg" class="message">�û���������Ӣ����ĸ�����ֵ��ַ���ɣ����Ȳ���С��3λ��</span></td>
       	</tr>
       	
       	<tr>
       		<td align="right"><h:outputText value="��   �룺"/></td>
       		<td><h:inputSecret id="pwd" value="#{RegBean.pwd}" styleClass="input" onblur="checkPwd()"/>
       		<span id="pwdMsg" class="message">��������ɴ�СдӢ����ĸ��������ɣ����Ȳ���С��6λ��</span></td>
       	</tr>
       	
       	<tr>
       		<td align="right"><h:outputText value="ȷ�����룺"/></td>
       		<td><h:inputSecret id="rePwd" value="#{RegBean.rePwd}" styleClass="input" onblur="checkPwd2()"/>
       		<span id="pwdMsg2" class="message">����������������</span></td>
       	</tr>
       	
       	<tr>
       		<td align="right"><h:outputText value="��   ��"/></td>
       		<td style="font-size:13px;">
       			<h:selectOneRadio layout="lineDirection" value="#{RegBean.gender}" style="font-size:13px;">
					<f:selectItem itemLabel="��" itemValue="��"/>
					<f:selectItem itemLabel="Ů" itemValue="Ů"/>
				</h:selectOneRadio>
       		</td>
       	</tr>
       	
       	<tr>
       		<td align="right"><h:outputText value="�����ʼ���"/></td>
       		<td><h:inputText id="email" value="#{RegBean.email}" styleClass="input" onblur="checkEmail()"/>
       		<span id="emailMsg" class="message">�������ĵ����ʼ���ַ</span></td>
       	</tr>
       	
       	<tr>
       		<td align="right"><h:outputText value="�绰���룺"/></td>
       		<td><h:inputText id="phone" value="#{RegBean.phone}" styleClass="input" onblur="checkPhone()"/>
       		<span id="phoneMsg" class="message">�������ĵ绰����</span></td>
       	</tr>
       	<tr>
       		<td></td>
       		<td>
       			<input type="reset" value="�� ��" class="button">
       			<h:commandButton value="ע ��" action="#{RegBean.userReg}" styleClass="button"/>
       			<h:outputText value="#{RegBean.message}" style="color:red;vertical-align:middle;"/>
       		</td>
       	</tr>
       	</h:form>
     </table>
     <%@ include file="qq.jsp" %>
 </body>
 </div>
</html>
</f:view>
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
  <script language="JavaScript" src="script/changeInfo.js"></script>  
  <script language="JavaScript" src="script/showMsg.js"></script>
 </head>
 <body>
 <div class="MainBox">
 	<%@ include file="top.jsp" %>
 	<span style="margin-left:5px;">��ҳ >>  �޸�����</span>
    <table class="RegBox" align="center" border="0" width="550">
    	<caption style="font-size:15px;margin-bottom:10px;">�޸�����</caption>
       	<h:form id="changeInfo" onsubmit="return checkInfo();">
       	
       	<tr>
       		<td align="right" width="150"><h:outputText value="�û�����"/></td>
       		<td><h:outputText value="#{UserLogin.uname}"/></td>
       	</tr>
       	
       	<tr>
       		<td align="right"><h:outputText value="��   ��"/></td>
       		<td style="font-size:13px;">
       			<h:selectOneRadio layout="lineDirection" value="#{UCIBean.gender}" style="font-size:13px;">
					<f:selectItem itemLabel="��" itemValue="��"/>
					<f:selectItem itemLabel="Ů" itemValue="Ů"/>
				</h:selectOneRadio>      		
       		</td>
       	</tr>
       	
       	<tr>
       		<td align="right"><h:outputText value="�����ʼ���"/></td>
       		<td><h:inputText id="email" value="#{UCIBean.email}" styleClass="input" onblur="checkEmail()"/>
       		<span id="emailMsg" class="message">�������ĵ����ʼ���ַ</span></td>
       	</tr>
       	
       	<tr>
       		<td align="right"><h:outputText value="�绰���룺"/></td>
       		<td><h:inputText id="phone" value="#{UCIBean.phone}" styleClass="input" onblur="checkPhone()"/>
       		<span id="phoneMsg" class="message">�������ĵ绰����</span></td>
       	</tr>
       	<tr>
       		<td></td>
       		<td>
       			<input type="reset" value="�� ��" class="button">
       			<h:commandButton value="�� ��" action="#{UCIBean.changeInfo}" styleClass="button"/>
       			<h:outputText value="#{UCIBean.message}" style="color:red;vertical-align:middle;"/>
       		</td>
       	</tr>
       	</h:form>
     </table>
     <%@ include file="qq.jsp" %>
 </body>
 </div>
</html>
</f:view>
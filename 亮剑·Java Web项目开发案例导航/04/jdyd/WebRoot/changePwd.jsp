<%@ page contentType="text/html;charset=GBK" %>
<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<f:view>
<html>
 <head>
  <title>A10�Ƶ�Ԥ�����Ļ�ӭ��</title>
  <link rel="stylesheet" type="text/css" href="script/main.css"/>
  <link rel="stylesheet" type="text/css" href="script/style.css"/>
  <script language="JavaScript" src="script/changePwd.js"></script>  
  <script language="JavaScript" src="script/showMsg.js"></script>
 </head>
 <body>
 <div class="MainBox">
 	<%@ include file="top.jsp" %>
 	<span style="margin-left:5px;">��ҳ >>  �޸�����</span>
    <table class="RegBox" align="center" border="0" width="550">
    	<caption style="font-size:15px;margin-bottom:10px;">�޸�����</caption>    	
       	<h:form id="changePwd" onsubmit="return checkPwd();">
       	
       	<tr>
       		<td align="right" width="100"><h:outputText value="��   �룺"/></td>
       		<td><h:inputSecret id="oldPwd" value="#{UCPBean.oldPwd}" styleClass="input" onblur="checkOldPwd()"/>
       		<span id="pwdMsg" class="message">���������û�����ǰ������</span></td>
       	</tr>
       	
       	<tr>
       		<td align="right"><h:outputText value="ȷ�����룺"/></td>
       		<td><h:inputSecret id="newPwd" value="#{UCPBean.newPwd}" styleClass="input" onblur="checkNewPwd()"/>
       		<span id="pwdMsg2" class="message">��������Ҫ���õ�������</span></td>
       	</tr>
       	
       	<tr>
       		<td align="right"><h:outputText value="ȷ�����룺"/></td>
       		<td><h:inputSecret id="reNewPwd" value="#{UCPBean.reNewPwd}" styleClass="input" onblur="checkReNewPwd()"/>
       		<span id="pwdMsg3" class="message">���ٴ����������õ�������</span></td>
       	</tr>
       	
       	<tr>
       		<td></td>
       		<td>
       			<input type="reset" value="�� ��" class="button">
       			<h:commandButton value="�� ��" action="#{UCPBean.changePwd}" styleClass="button"/>
       			<h:outputText value="#{UCPBean.message}" style="color:red;vertical-align:middle;"/>
       		</td>
       	</tr>
       	</h:form>
     </table>
     <%@ include file="qq.jsp" %>
 </body>
 </div>
</html>
</f:view>
<%@page contentType="text/html;charset=GBK"%>
<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<f:view> 
 <html>
  <head>
    <title>A10�Ƶ�Ԥ�����Ļ�ӭ��</title>
    <link rel="stylesheet" type="text/css" href="script/main.css"/>
    <link rel="stylesheet" type="text/css" href="script/style.css"/>
    <script language="JavaScript" src="script/eidtRes.js"></script>
  </head>
  <body>
  	<div class="MainBox">
	  	<%@ include file="adminTop.jsp" %>
	  	<span style="margin-left:5px;margin-bottom:0px;">
	  		<h:outputText value="��ҳ >> �༭��Դ"></h:outputText>
	  	</span>
		<h:panelGroup rendered="#{ALBean.aid!=null&&ALBean.super}">
	  		<h:form id="editRes" onsubmit="return checkEditRes();">
			  	<table class="RegBox" align="center" border="0" width="470" style="margin-top:20;">
			  		<caption style="font-size:18px;margin-bottom:20px;">�༭��Դ</caption>			  		
			  		<tr>
			  			<td align="right"><h:outputText value="��Դ���ƣ�"/></td>
			  			<td width="180">
			  				<h:inputText id="rname" value="#{ERBean.rname}" styleClass="input"/>			  				
			  			</td>
			  			<td><h:outputText value=" ��������Դ������"/></td>
			  		</tr>
			  		<tr>
			  			<td align="right"><h:outputText value="��Դ���"/></td>
			  			<td>
			  				<h:inputText id="rspec" value="#{ERBean.rspec}" styleClass="input"/>			  				
			  			</td>
			  			<td><h:outputText value=" ��������Դ�Ĺ��"/></td>
			  		</tr>
			  		
					<tr>
			  			<td align="right"><h:outputText value="��Դ���飺"/></td>
			  			<td>
			  				<h:selectOneMenu value="#{ERBean.gid}" styleClass="input">
                    			<f:selectItems value="#{ARBean.typeList}"/>
                			</h:selectOneMenu>
			  			</td>
			  			<td><h:outputText value=" ѡ����Դ��������"/></td>
			  		</tr>
			  							  		
					<tr>
			  			<td align="right"><h:outputText value="��Դ�۸�"/></td>
			  			<td>
			  				<h:inputText id="rprice" value="#{ERBean.rprice}" styleClass="input"/>
			  			</td>
			  			<td><h:outputText value=" ��������ԴԤ���ļ۸�"/></td>
			  		</tr>
			  					  		
			  		<tr>
			  			<td align="right"><h:outputText value="��Դ������"/></td>
			  			<td>
			  				<h:inputTextarea id="rdetail" value="#{ERBean.rdetail}" styleClass="input"/>			  				
			  			</td>
			  			<td align="left"><h:outputText value=" ��������Դ����"/></td>
			  		</tr>
			  		
			  		<tr>
			  			<td align="right"><h:outputText value="��Դ������"/></td>
			  			<td>
			  				<h:selectOneMenu value="#{ERBean.rstatus}" styleClass="input">
								<f:selectItem itemLabel="����" itemValue="����"/>
								<f:selectItem itemLabel="ռ��" itemValue="ռ��"/>
							</h:selectOneMenu>
			  			</td>
			  			<td align="left"><h:outputText value=" ��������Դ����"/></td>
			  		</tr>

			  		<tr>
			  			<td>&nbsp;</td>
			  			<td align="center">
				  			<h:commandButton value="����" styleClass="button" action="#{ERBean.editRes}"/>
							&nbsp;<h:commandButton value="����" styleClass="button" type="reset"/>							
						</td>
						<td>&nbsp;<h:outputText value="#{ERBean.message}" style="color:red;vertical-align:middle;"/></td>
			  		</tr>
			  	</table>
		  	</h:form>
	  	</h:panelGroup>
  	</div>
  	</body>
 </html>
 </f:view>
 

<%@page contentType="text/html;charset=GBK"%>
<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<f:view> 
 <html>
  <head>
    <title>A10�Ƶ�Ԥ�����Ļ�ӭ��</title>
    <link rel="stylesheet" type="text/css" href="script/main.css"/>
    <link rel="stylesheet" type="text/css" href="script/style.css"/>
  </head>
  <body>
  	<div class="MainBox">
	  	<%@ include file="top.jsp" %>
	  	<span style="margin-left:5px;margin-bottom:0px;">
	  		<h:outputText value="��ҳ >> "></h:outputText>
	  		<h:outputText value="#{MOBean.orderId}�Ŷ�������"></h:outputText>
	  	</span>
	  	<div style="text-align:center;">
	  		<h:form>
			  	<h:dataTable value="#{MOBean.orderDetail}" var="res" 
		      		styleClass="orders" headerClass="ordersHeader" rowClasses="evenRow,oddRow"
		      		rendered="#{MOBean.size>0}"	
		    	>
			        <h:column>
			            <f:facet name="header">
			                <h:outputText value="��Դ����"/>
			            </f:facet>
			            <h:outputText value="#{res.rname}"/>
			        </h:column>
			        
			        <h:column>
			            <f:facet name="header">
			                <h:outputText value="��ʼʱ��"/>
			            </f:facet>
			            <h:outputText value="#{res.start}"/>
			        </h:column>
			        
			        <h:column>
			            <f:facet name="header">
			                <h:outputText value="����ʱ��"/>
			            </f:facet>
			            <h:outputText value="#{res.end}"/>
			        </h:column>
			        
			         <h:column>
			            <f:facet name="header">
			                <h:outputText value="״̬"/>
			            </f:facet>
			            <h:outputText value="#{res.status}"/>
			        </h:column>
			        
			        <h:column>
			            <f:facet name="header">
			                <h:outputText value="ɾ��"/>
			            </f:facet>            
			            <h:commandLink action="#{MOBean.delete}" rendered="#{res.flag}">
			                <h:outputText value="ɾ��"/>
			                <h:graphicImage value="images/delete.png" style="vertical-align:middle;border:0"/>  
			            </h:commandLink>
			            <h:outputText value="------" rendered="#{!res.flag}"/>
			        </h:column>
	    		</h:dataTable>
    		</h:form>
    		<center><h:outputText value="�ö�����Ϣ�Ѿ�ȫ������" rendered="#{MOBean.size==0}"></h:outputText></center>	
    	</div>
  	</div>
  </body>
 </html>
 </f:view>
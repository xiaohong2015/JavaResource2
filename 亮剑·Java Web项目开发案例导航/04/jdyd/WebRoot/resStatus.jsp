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
	  	<%@ include file="adminTop.jsp" %>
	  	<span style="margin-left:5px;margin-bottom:0px;">
	  		<h:outputText value="��ҳ >> #{RMBean.rname}��Դ״̬"></h:outputText>
	  	</span>
	  	<div style="text-align:center;">
	  	<h:outputText value="����ԴĿǰû�ж���������Ԥ��" rendered="#{RMBean.size<=0}"/>
	  	<h:dataTable value="#{RMBean.orderList}" var="res" style="margin-top:20px;" 
      		styleClass="orders" headerClass="ordersHeader" rowClasses="evenRow,oddRow"
      		footerClass="ordersFooter"
      		rendered="#{RMBean.size>0}"
    	>
        
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
    </h:dataTable>
    </div>
  	</div>
  	</body>
 </html>
 </f:view>
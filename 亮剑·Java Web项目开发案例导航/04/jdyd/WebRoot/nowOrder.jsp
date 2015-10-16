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
	  		<h:outputText value="��ǰ�����б�"></h:outputText>
	  	</span>
	  	<div style="text-align:center;">
	  	<h:outputText value="��ǰ������û�м�¼������" rendered="#{OIBean.size<=0&&!OIBean.submit}"/>
	  	<h:outputText value="#{OIBean.message}" rendered="#{OIBean.size<=0&&OIBean.submit}"/>
	  	<h:form>
	  	<h:dataTable value="#{OIBean.orderList}" var="res" 
      		styleClass="orders" headerClass="ordersHeader" rowClasses="evenRow,oddRow"
      		footerClass="ordersFooter"
      		rendered="#{OIBean.size>0}"
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
            <f:facet name="footer">

                	<h:commandButton value="��ն���" action="#{OIBean.removeAll}" styleClass="button"/>

            </f:facet>
        </h:column>
        
        <h:column>
            <f:facet name="header">
                <h:outputText value="����ʱ��"/>
            </f:facet>
                    <h:outputText value="#{res.end}"/>
        </h:column>
        
        <h:column>
            <f:facet name="header">
                <h:outputText value="^_^"/>
            </f:facet>
            
                <h:commandLink actionListener="#{OIBean.remove}">
                    <h:outputText value="ɾ��"/>
                </h:commandLink>
            
            <f:facet name="footer">
                <h:commandButton value="�ύ����" action="#{OIBean.submitOrder}" styleClass="button"/>
            </f:facet>
        </h:column>

    </h:dataTable>
    </h:form>
    </div>
  	</div>
		<div id="calendar"
		style="position:absolute;height:140px;width:160px;visibility:hidden;border:1px inset #003399;" 
		onmouseover="calshow=true" onmouseout="calshow=false">
		</div>
  	</body>
 </html>
 </f:view>
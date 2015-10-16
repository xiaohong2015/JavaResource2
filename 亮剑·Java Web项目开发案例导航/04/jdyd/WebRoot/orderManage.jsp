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
	  		<h:outputText value="��ҳ >> ��������"></h:outputText>
	  	</span>
	  	<div style="text-align:center;">
	  	<h:panelGroup rendered="#{ALBean.aid!=null}">	  	
	  	<table border="0" cellpadding="0" cellspacing="0" width="85%">
	  		<tr><h:form>
	  			<td align="right">	
	  					<h:outputText value="�����붩����ţ�"/>  				
	  					<h:inputText value="#{OLBean.oid}"styleClass="input"/>
	  					<h:commandButton value="����" styleClass="an"/>	  				
	  			</td></h:form>
	  		</tr>
	  	</table>
	  	</h:panelGroup>
	  	
	  	
	  	<h:outputText value="������û�м�¼" rendered="#{OLBean.maxPage<=0}"/>
	  
	  	<h:dataTable value="#{OLBean.orderList}" var="res" 
      		styleClass="orders" headerClass="ordersHeader" rowClasses="evenRow,oddRow"
      		rendered="#{OLBean.maxPage>0&&ALBean.aid!=null}"
    	>
	        <h:column>
	            <f:facet name="header">
	                <h:outputText value="�������"/>
	            </f:facet>
	            <h:outputText value="#{res.OId}"/>
	        </h:column>
	        
	        <h:column>
	            <f:facet name="header">
	                <h:outputText value="�ύ��"/>
	            </f:facet>
	            <h:outputText value="#{res.uname}"/>
	        </h:column>
	        
	        <h:column>
	            <f:facet name="header">
	                <h:outputText value="�ύʱ��"/>
	            </f:facet>
	            <h:outputText value="#{res.OTime}"/>
	        </h:column>
	        
	        <h:column>
	            <f:facet name="header">
	                <h:outputText value="����״̬"/>
	            </f:facet>
	            <h:outputText value="#{res.OStatus}"/>
	        </h:column>
	        
	        <h:column>
	            <f:facet name="header">
	                <h:outputText value="��ע"/>
	            </f:facet>
	            <h:outputText value="#{res.ODetail}"/>
	        </h:column>
			
			<h:column>
	            <f:facet name="header">
	                <h:outputText value="�鿴����"/>
	            </f:facet>
	            <h:form>
	                <h:commandLink action="#{OLBean.detail}" target="_blank">
	                    <h:outputText value="�鿴"/>
	                    <h:graphicImage value="images/detail.png" style="vertical-align:middle;border:0"/>	                    	
	                </h:commandLink>
	            </h:form>
	        </h:column>
    </h:dataTable>
   
    <h:panelGroup rendered="#{OLBean.maxPage>0&&ALBean.aid!=null}">
	    <table class="nav" border="0" cellpadding="0" cellspacing="0">
	    	<tr>
	    		<td width="90">
	    			<h:outputText value="��#{OLBean.maxPage}ҳ,��#{OLBean.curPage}ҳ"></h:outputText>
	    		</td>
	    		<h:form rendered="#{OLBean.maxPage>0}">
	    		<td width="140">    			
			         <h:outputText value="��ҳϵ����" /> 
			         <h:selectOneMenu value="#{OLBean.span}" onchange="this.form.submit();">
			           <f:selectItems value="#{OLBean.pageSpanList}"/>
			         </h:selectOneMenu>			   	
	    		</td>
	    		</h:form>
	    		
	    		<h:form rendered="#{OLBean.maxPage>1}">
	            <td width="80" align="center">
	                <h:selectOneMenu value="#{OLBean.curPage}" onchange="this.form.submit();">
	                    <f:selectItems value="#{OLBean.pageList}"/>
	                </h:selectOneMenu>
	            </td>
	            </h:form>
	            
	    		<h:form>
		    		<td width="60">    			
		         		<h:commandButton image="/images/pre.gif" action="#{OLBean.prePage}"
		                			 							rendered="#{OLBean.curPage>1}"/>
		            	            	
		             </td>
	             </h:form>
	             
	             <h:form>
		             <td align="right" width="60">             
		             <h:commandButton image="/images/next.gif" action="#{OLBean.nextPage}"
		                			 rendered="#{OLBean.maxPage>OLBean.curPage}"/>
		    		</td>
	    		</h:form>
	    	</tr>
	    </table>
    </h:panelGroup>
    
    
    
    </div>
  	</div>
		<div id="calendar"
		style="position:absolute;height:140px;width:160px;visibility:hidden;border:1px inset #003399;" 
		onmouseover="calshow=true" onmouseout="calshow=false">
		</div>
  	</body>
 </html>
 </f:view>
 

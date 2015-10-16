<%@page contentType="text/html;charset=GBK"%>
<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<f:view> 
 <html>
  <head>
    <title>A10�Ƶ�Ԥ�����Ļ�ӭ��</title>
    <link rel="stylesheet" type="text/css" href="script/main.css"/>
    <link rel="stylesheet" type="text/css" href="script/style.css"/>
    <script language="JavaScript">
    	String.prototype.trim=function()
		{
		  return this.replace(/(^\s*)|(\s*$)/g,"");
		}
    	function checkOrder(){
    		var detail = document.getElementById('orderForm:detail').value.trim();
    		if(detail==""){
    			alert("��ע����Ϊ�գ�����");
    			return false;
    		}
    		return true;
    	}
    </script>
  </head>
  <body>
  	<div class="MainBox">
	  	<%@ include file="adminTop.jsp" %>
	  	<span style="margin-left:5px;margin-bottom:0px;">
	  		<h:outputText value="��ҳ >> "></h:outputText>
	  		<h:outputText value="#{AOBean.orderId}�Ŷ�������"></h:outputText>
	  	</span>
	  	<div style="text-align:center;">
		  	<h:dataTable value="#{AOBean.orderDetail}" var="res" 
	      		styleClass="orders" headerClass="ordersHeader" rowClasses="evenRow,oddRow"
	      		rendered="#{AOBean.size>0&&ALBean.aid!=null}"
	    	>
		        <h:column>
		            <f:facet name="header">
		                <h:outputText value="��Դ����"/>
		            </f:facet>
		            <h:outputText value="#{res.rname}"/>
		        </h:column>
		        
		        <h:column>
		            <f:facet name="header">
		                <h:outputText value="��������"/>
		            </f:facet>
		            <h:outputText value="#{res.gname}"/>
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
    		</h:dataTable>
    		
    		<h:panelGroup rendered="#{ALBean.aid!=null}">
			    <table width="87%" border="0" style="font-size:13px;margin-top:20px;border:1px solid black;">
			    <th colspan="2" style="font-size:15px;" align="center">��������</th>
			    <h:form id="orderForm" onsubmit="return checkOrder();">
			    	<tr>
			    		<td width="130">&nbsp;</td>
			    		<td align="left">
			    			<h:outputText value="����״̬��" />
			    			<h:selectOneMenu value="#{AOBean.status}" styleClass="input">
			                    <f:selectItem itemLabel="Ԥ����" itemValue="Ԥ����"/>
			                     <f:selectItem itemLabel="Ԥ���ɹ�" itemValue="Ԥ���ɹ�"/>
			                      <f:selectItem itemLabel="Ԥ��ʧ��" itemValue="Ԥ��ʧ��"/>
			                </h:selectOneMenu>			     
			                <h:outputText value="  ��ѡ�񶩵�������"></h:outputText>           
			    		</td>
			    			
			    	</tr>
			    	
			    	<tr>
			    		<td>&nbsp;</td>
			    		<td>
			    			<h:outputText value="������ע��" />
			    			<h:inputText id="detail" value="#{AOBean.detail}" styleClass="input"/>
			    			<h:outputText value="  ���뱸ע������ʧ��ԭ��"></h:outputText>			    			
			    		</td>
			    	</tr>
			    	
			    	<tr>
			    		<td>&nbsp;</td>
			    		<td align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			    			<h:commandButton value="������" styleClass="button" action="#{AOBean.deal}"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			    			<h:commandButton type="reset" value="����" styleClass="button"/>
			    			<h:outputText value="#{AOBean.message}" style="color:red;vertical-align:middle;"/>
			    		</td>
			    	</tr>
			    	</h:form>
			    </table>
    		</h:panelGroup>
    	</div>
  	</div>
  </body>
 </html>
 </f:view>
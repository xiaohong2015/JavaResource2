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
    	function checkAddGroup(){
    		var gname = document.getElementById('addGroup:gname').value.trim();
    		if(gname==""){
    			alert("�������Ʋ���Ϊ��");
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
	  		<h:outputText value="��ҳ >> �������"></h:outputText>
	  	</span>
	  	<div style="text-align:center;">	  	
		
		  	<h:dataTable value="#{GLBean.groupList}" var="res" 
	      		styleClass="orders" headerClass="ordersHeader" rowClasses="evenRow,oddRow"
	      		rendered="#{GLBean.size>0&&ALBean.aid!=null}"
	    	>
	        <h:column>
	            <f:facet name="header">
	                <h:outputText value="������"/>
	            </f:facet>
	            <h:outputText value="#{res.gid}"/>
	        </h:column>
	        
	        <h:column>
	            <f:facet name="header">
	                <h:outputText value="��������"/>
	            </f:facet>	            	
	            <h:outputText value="#{res.gname}"/>
	        </h:column>
	        
	        <h:column>
	            <f:facet name="header">
	                <h:outputText value="ɾ������"/>
	            </f:facet>
				<h:form>
					<h:commandLink action="#{GLBean.delete}">
					    <h:outputText value="ɾ��"/>
					    <h:graphicImage value="images/delete.png" style="vertical-align:middle;border:0"/>        
					</h:commandLink>
				</h:form>
	        </h:column>
	    </h:dataTable>
    
    <h:form id="addGroup" onsubmit="return checkAddGroup();" rendered="#{ALBean.aid!=null}">
    	<h:outputText value="�������������" style="font-size:14px;"/>
    	<h:inputText id="gname" value="#{GLBean.gname}" styleClass="input"/>&nbsp;&nbsp;&nbsp;
    	<h:commandButton value="��ӷ���" action="#{GLBean.addGroup}" styleClass="an"/>&nbsp;&nbsp;&nbsp;
    	<h:outputText value="#{GLBean.message}" style="color:red;vertical-align:middle;"/>
    </h:form>
    <h:outputText value="û�з�����Ϣ������" rendered="#{GLBean.size<=0&&ALBean.aid!=null}"/>
    </div>
  	</div>
  	</body>
 </html>
 </f:view>
<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core" %>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html" %>
<html>
	<head>
		<title>WriteScore.jsp</title>
		<link type="text/css" rel="stylesheet" href="images/style.css">
		<script type="text/javascript" src="images/teacher.js"></script> 
		
	</head>
	<body><f:view><h:outputLink value="Login.jsp" target="_parent" rendered="#{!LoginBean.login}">
		<h:outputText value="���ȵ�¼"/></h:outputLink><!-- ��ʾ�ȵ�¼����Ϣ -->
	<h:form id="myform" rendered="#{LoginBean.login&&WriteScoreBean.courseSize!=0}" styleClass="centers"><!-- ���������б�����ʽ -->
		<div class="topform">
			<h:graphicImage styleClass="gbicon" value="images/opration.gif" />
			<h:outputText value="��ѡ����Ҫ�����Ŀγ̣�" styleClass="topformmsg"/>
			<h:selectOneMenu value="#{WriteScoreBean.courseNo}" onchange="this.form.submit();" styleClass="selecttype">
	        <f:selectItems value="#{WriteScoreBean.courseItem}"/></h:selectOneMenu>
	        <h:commandButton image="images/gongbu1.gif" 
					onmouseover="this.src='images/gongbu2.gif'" onmouseout="this.src='images/gongbu1.gif'" 
					onmousedown="this.src='images/gongbu3.gif'" onmouseup="this.src='images/gongbu2.gif'" 
	    			 action="#{WriteScoreBean.gongbu}" styleClass="gongbustyle"/>
	    	<h:commandButton image="images/gongbu.gif" action="#{WriteScoreBean.gongbu}" styleClass="gbicon1" alt="�����ÿƳɼ�"/>
	    	
		</div>
		
	     
	    </h:form><!-- ���������� -->
	 <h:panelGrid styleClass="panel">
	 <h:inputText id="result" value="#{WriteScoreBean.result}" style="display:none"/>
	 <h:form id="scoreform" onsubmit="return checkss();" rendered="#{LoginBean.login&&WriteScoreBean.courseSize!=0}"><!-- �������ݱ�������ʾ -->
	 <h:dataTable  value="#{WriteScoreBean.gradeList}" var="gradeitem" 
	            rowClasses="evenRow,oddRow" styleClass="panelstyle" headerClass="headerClazz">
			<h:column><f:facet name="header"><h:outputText value="�γ̱��"/><!-- �γ̱���� -->
				</f:facet><h:outputText value="#{gradeitem.courseNo}"/> </h:column><!-- �γ̱��ֵ -->
			<h:column><f:facet name="header"><h:outputText value="�γ�����"/><!-- �γ������� -->
				</f:facet><h:outputText value="#{gradeitem.courseName}"/> </h:column><!-- �γ����� -->
			<h:column><f:facet name="header"><h:outputText value="ѧ��"/><!-- ѧ���� -->
				</f:facet><h:outputText value="#{gradeitem.stuNo}"/> </h:column><!-- ѧ�� -->
			<h:column><f:facet name="header"><h:outputText value="����"/><!-- ������ -->
				</f:facet><h:outputText value="#{gradeitem.stuName}"/> </h:column><!-- ���� -->
			<h:column><f:facet name="header"><h:outputText value="�γ�ѧ��"/><!-- �γ�ѧ���� -->
				</f:facet><h:outputText value="#{gradeitem.xuefen}"/> </h:column><!-- ѧ�� -->
			<h:column><f:facet name="header"><h:outputText value="����"/><!-- ������ -->
				</f:facet><h:panelGroup>
					<h:inputText value="#{gradeitem.score}" id="score" onchange="checkscore(this);" converter="MyConveter">
						<f:validateDoubleRange maximum="100.0" minimum="0.0"/></h:inputText>
					<h:message for="score" style="color:red"/><!-- ������Ϣ��� -->
				</h:panelGroup></h:column></h:dataTable>
				<h:commandButton image="images/submit1.gif" 
					onmouseover="this.src='images/submit2.gif'" onmouseout="this.src='images/submit1.gif'" 
					onmousedown="this.src='images/submit3.gif'" onmouseup="this.src='images/submit2.gif'" 
				 action="#{WriteScoreBean.saveScore}"/>
				</h:form>
			
				</h:panelGrid>
					<h:outputText rendered="#{LoginBean.login&&WriteScoreBean.courseSize==0}" value="û����Ӧ�Ŀɲ����γ���Ϣ" styleClass="noinfo"/>
				</f:view>
				<script language="JavaScript">
				function alertmsg()
				{
					var msg=document.getElementById("result").value;
					if(msg!="")
					{
						alert(msg);	
					}	
				}
				
				window.onload=alertmsg;
			</script>
		</body>
</html>
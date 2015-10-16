<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core" %>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html" %>
<html>
	<head>
		<title>AddStu.jsp</title>
		<link type="text/css" rel="stylesheet" href="images/style.css">
		<script type="text/javascript" src="images/teacher.js"></script> 
	</head>
<body><f:view><h:outputLink value="Login.jsp" target="_parent" rendered="#{!LoginBean.login}">
	<h:outputText value="���ȵ�¼"/></h:outputLink><!-- ���û�е�¼�������¼��Ϣ -->
<h:form id="stuform" onsubmit="return stucheck();" rendered="#{LoginBean.login}"><!-- �ύǰ����JavaScript��֤ -->
<h:panelGrid styleClass="panel"><!-- ���ñ�������λ�� -->
	<h:outputText value="����������" styleClass="tablehead"/>
	<h:panelGrid columns="3"  columnClasses="evenColumn,oddColumn,oddColumn"
	 styleClass="panelstyle"><!-- ���ñ�����ʾ��ʽ -->
		<h:outputText value="ѧ  �ţ�"  /><!-- ��ʾ����ѧ�ŵı�ǩ -->
		<h:inputText id="sno" value="#{AddStuBean.sno}" required="true"><!--  ����ѧ�Ŵ� -->
			<f:validateLength maximum="12" minimum="8"/><!-- ������ѧ�ų��ȵ���֤ -->
		</h:inputText><h:message for="sno" style="color:red"/><!-- ������Ϣ��� -->
		<h:outputText value="��  ����"/><!-- ��ʾ���������ı�ǩ -->
		<h:inputText value="#{AddStuBean.sname}" id="sname" required="true"/><!-- ����Ϊ������ -->
		<h:message for="sname" style="color:red"/><!-- ������Ϣ��� -->
		<h:outputText value="��  ��"/><!-- ������ʾѡ���Ա�ı�ǩ -->
		<h:selectOneRadio value="#{AddStuBean.sgender}" layout="lineDirection" id="gender" >
			<f:selectItem itemLabel="��" itemValue="��"/><f:selectItem itemLabel="Ů" itemValue="Ů"/>
		</h:selectOneRadio><!-- ѡ���Ա�ĵ�ѡ��ť��  -->
		<h:message for="gender" style="color:red"/><!-- ������Ϣ���� -->
		<h:outputText value="�������ڣ�"/><h:panelGroup><!-- ��ʾѡ��������ڵı�ǩ -->
			<h:selectOneMenu id="biryear" value="#{AddStuBean.biryear}" onchange="updateDate();"><!-- ������ -->
				<f:selectItems value="#{AddStuBean.biryearList}"/></h:selectOneMenu>
			<h:selectOneMenu id="birmonth" value="#{AddStuBean.birmonth}" onchange="updateDate();"><!-- ������ -->
				<f:selectItems value="#{AddStuBean.birmonthList}"/></h:selectOneMenu>
			<h:selectOneMenu id="birday" value="#{AddStuBean.birday}"><f:selectItems value="#{AddStuBean.birdayList}"/>
			</h:selectOneMenu></h:panelGroup><h:outputText value=""/>
		<h:outputText value="�� �᣺"/><!-- ��ʾ���뼮��ı�ǩ -->
		<h:inputText value="#{AddStuBean.nativeplace}" id="nativeplace" size="50" required="true"/>
		<h:message for="nativeplace" style="color:red"/><!-- ������Ϣ��� -->
		<h:outputText value="ѧ  Ժ��"/><h:outputText value="#{AddStuBean.coll}"/><h:outputText value=""/>
		<h:outputText value="ר  ҵ��"/><!-- ��ʾѡ��רҵ�ı�ǩ -->
		<h:selectOneMenu value="#{AddStuBean.deptid}" onfocus="stucheck();" onchange="this.form.submit();" 
		 valueChangeListener="#{AddStuBean.updateClass}"><!-- ���°༶�б� -->
			<f:selectItems value="#{AddStuBean.deptList}"/></h:selectOneMenu><h:outputText value=""/>
		<h:outputText value="��  ����"/><h:selectOneMenu value="#{AddStuBean.classid}">
			<f:selectItems value="#{AddStuBean.classList}"/></h:selectOneMenu><h:outputText value=""/>
		<h:outputText value="������ò��"/><h:selectOneMenu value="#{AddStuBean.mianmao}">
			<f:selectItems value="#{AddStuBean.mianmaoList}"/></h:selectOneMenu>
		<h:outputText value=""/><h:outputText value="��ѧʱ�䣺"/><!-- ��ʾѡ����ѧʱ�� -->
		<h:panelGroup><h:selectOneMenu id="comeyear" value="#{AddStuBean.comeyear}" onchange="updateDate1();"><!-- ������ -->
				<f:selectItems value="#{AddStuBean.comeyearList}"/></h:selectOneMenu>
			<h:selectOneMenu id="comemonth" value="#{AddStuBean.comemonth}" onchange="updateDate1();"><!-- ������ -->
				<f:selectItems value="#{AddStuBean.comemonthList}"/></h:selectOneMenu>
			<h:selectOneMenu id="comeday" value="#{AddStuBean.comeday}">
				<f:selectItems value="#{AddStuBean.comedayList}"/></h:selectOneMenu>
		</h:panelGroup><h:outputText value=""/><h:outputText value=""/>
		<h:panelGrid columns="1" style="text-align:center;width=60%;">
			<h:commandButton image="images/tijiao1.gif" 
					onmouseover="this.src='images/tijiao2.gif'" onmouseout="this.src='images/tijiao1.gif'" 
					onmousedown="this.src='images/tijiao3.gif'" onmouseup="this.src='images/tijiao2.gif'" 
			action="#{AddStuBean.addStu}"/><!-- �ύ��ť -->
		</h:panelGrid><h:inputText id="msg" value="#{AddStuBean.msg}" style="display:none"/><!-- ����������� -->
	</h:panelGrid></h:panelGrid></h:form></f:view>
		<script language="JavaScript">
			function alertmsg()
			{

				var msg=document.getElementById("stuform:msg").value;
				if(msg!="")
				{
					alert(msg);	
				}
				
			}
			window.onload=alertmsg;
		</script>	
	</body>
</html>
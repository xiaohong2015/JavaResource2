<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core" %>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html" %>
<html>
	<head>
		<title>Student.jsp</title>
		<link type="text/css" rel="stylesheet" href="images/style.css">
	</head>
		<f:view>
		<frameset rows="15%,*" frameborder="0" bordercolor="#D2e9ff" >
		<frame src="Studenttop.jsp" noresize="true">
		<frameset cols="23%,*" > 
			
			<frame name="leftFrame"  src="StuTree.jsp" noresize="true">
			<frame name="mainFrame"  src="StudentWelcome.jsp" noresize="true">
	    </frameset>
	    </frameset>
	    <noframes>
		<body>
		<p>�ܱ�Ǹ������һ����֡ҳ�棬����������������֧�֣����Բ�������� </p>
		<p>Sorry!This page uses frames,but your browser doesn't support them .
		</body> 
		</noframes>
		</f:view>
</html>
<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core" %>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html" %>
<html>
	<head>
		<title>Teacher.jsp</title>
		<link type="text/css" rel="stylesheet" href="images/style.css">
	</head>
		<f:view><frameset rows="15%,*" frameborder="0" bordercolor="#D2e9ff" >
		<frame src="Teachertop.jsp" noresize="true"><frameset cols="24%,*" >  <!-- ������ʾ��ҳ�� -->
			<frame name="leftFrame"  src="TeacherTree.jsp" noresize="true">   <!-- �����ʾ��ҳ�� -->
			<frame name="mainFrame"  src="TeacherWelcome.jsp" noresize="true"><!-- �ұ���ʾ��ҳ�� -->
		</frameset><noframes><body>                           <!-- �������֧��framesetʱ�Ĵ��� -->
		<p>�ܱ�Ǹ������һ����֡ҳ�棬����������������֧�֣����Բ�������� </p>
		<p>Sorry!This page uses frames,but your browser doesn't support them .</body>
		</noframes></frameset></f:view>
		
</html><table  ></table>
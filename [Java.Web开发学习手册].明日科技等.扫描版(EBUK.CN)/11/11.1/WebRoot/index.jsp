<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<%@ page import="java.util.*" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>ͨ��EL��������ȫ��Ԫ��</title>
</head>
<body>
<%
String[] arr={"Java Web��������ģ���ȫ","Java������ȫ��ѧ�ֲ�","JSP��Ŀ����ȫ��ʵ¼"};	//����һά����
request.setAttribute("book",arr);		//�����鱣�浽request������
%>
<%
String[] arr1=(String[])request.getAttribute("book");	//��ȡ���浽request��Χ�ڵı���
//ͨ��ѭ����EL���һά���������
for(int i=0;i<arr1.length;i++){
	request.setAttribute("requestI",i);
%>
	
	${requestI}��${book[requestI]}<br>	<!-- ��������е�i��Ԫ�� -->
<%} %>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=GB18030" pageEncoding="GB18030"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.*" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>����List����</title>
</head>
<body>
<%
List<String> list=new ArrayList<String>();	//����List���ϵĶ���
list.add("���ǿɿ����Ⱦ�����");				//��List���������Ԫ��
list.add("��Ȥ����õ���ʦ");
list.add("֪ʶ�ϵ�Ͷ�����ܵõ���õĻر�");
request.setAttribute("list",list);			//��List���ϱ��浽request������
%>
<b>����List���ϵ�ȫ��Ԫ�أ�</b><br>

<c:forEach items="${requestScope.list}" var="keyword" varStatus="id">
	${id.index }&nbsp;${keyword}<br>
</c:forEach>
<b>����List�����е�1��Ԫ���Ժ��Ԫ�أ���������1��Ԫ�أ���</b><br>
<c:forEach items="${requestScope.list}" var="keyword" varStatus="id" begin="1">
	${id.index }&nbsp;${keyword}<br>
</c:forEach>

</body>
</html>

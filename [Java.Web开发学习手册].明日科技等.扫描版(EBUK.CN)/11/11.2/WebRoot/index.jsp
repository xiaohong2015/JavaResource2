<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>��ϵ��������߼��������Ӧ��</title>
</head>
<body>
<%
request.setAttribute("userName","mr"); 	//����request��Χ�ڵı���userName
request.setAttribute("pwd","mrsoft");	//����pwd��Χ�ڵı���pwd
%>
userName=${userName}<br>	<!-- �������userName -->
pwd=${pwd}<br>	<!-- �������pwd -->
\${userName!="" and (userName=="����") }��	<!-- ��ELԭ����� -->
${userName!="" and userName=="����" }<br>	<!-- ����ɹ�ϵ���߼��������ɵı��ʽ��ֵ -->
\${userName=="mr" and pwd=="mrsoft" }��		<!-- ��ELԭ����� -->
${userName=="mr" and pwd=="mrsoft" }		<!-- ����ɹ�ϵ���߼��������ɵı��ʽ��ֵ -->
</body>
</html>
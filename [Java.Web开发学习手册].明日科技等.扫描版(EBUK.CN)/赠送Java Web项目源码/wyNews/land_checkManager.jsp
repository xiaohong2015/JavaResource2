<%@ page contentType="text/html; charset=gb2312" %>
<%@ taglib prefix="logic" uri="/WEB-INF/struts-logic.tld"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>������--��¼���ҳ��</title>
</head>
<body>

<!-- �ж�request��Χ���Ƿ����form���� -->
<logic:present name="form" scope="request">
<%session.setAttribute("form",request.getAttribute("form")); %>
<script language='javascript'>alert('�û���¼�ɹ�');window.location.href='b_mainPage.jsp';</script>
</logic:present>
<!-- �ж�request��Χ���Ƿ񲻴���form���� -->
<logic:notPresent name="form" scope="request">
<%String result=(String)request.getAttribute("result");%>
<script language='javascript'>alert('<%=result%>');window.location.href='land_manager.jsp';</script>
</logic:notPresent>


</body>
</html>


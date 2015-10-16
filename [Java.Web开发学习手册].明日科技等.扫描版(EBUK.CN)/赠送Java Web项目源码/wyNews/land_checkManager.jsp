<%@ page contentType="text/html; charset=gb2312" %>
<%@ taglib prefix="logic" uri="/WEB-INF/struts-logic.tld"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>新闻网--登录结果页面</title>
</head>
<body>

<!-- 判断request范围内是否存在form对象 -->
<logic:present name="form" scope="request">
<%session.setAttribute("form",request.getAttribute("form")); %>
<script language='javascript'>alert('用户登录成功');window.location.href='b_mainPage.jsp';</script>
</logic:present>
<!-- 判断request范围内是否不存在form对象 -->
<logic:notPresent name="form" scope="request">
<%String result=(String)request.getAttribute("result");%>
<script language='javascript'>alert('<%=result%>');window.location.href='land_manager.jsp';</script>
</logic:notPresent>


</body>
</html>


<%@ page contentType="text/html; charset=gb2312" %>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<%@ taglib prefix="logic" uri="/WEB-INF/struts-logic.tld"%> 





<!-- 判断request范围内是否存在form对象 -->
<logic:present name="result" scope="request">
<%String result=(String)request.getAttribute("result");%>
<script language='javascript'>alert('<%=result%>');window.location.href='b_managerInert.jsp';</script>
</logic:present>
<!-- 判断request范围内是否不存在form对象 -->
<logic:notPresent name="result" scope="request">
<script language='javascript'>alert('用户添加成功');window.location.href='b_managerInert.jsp';</script>
</logic:notPresent>
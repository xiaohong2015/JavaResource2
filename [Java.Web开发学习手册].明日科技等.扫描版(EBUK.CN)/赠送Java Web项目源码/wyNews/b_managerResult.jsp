<%@ page contentType="text/html; charset=gb2312" %>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<%@ taglib prefix="logic" uri="/WEB-INF/struts-logic.tld"%> 





<!-- �ж�request��Χ���Ƿ����form���� -->
<logic:present name="result" scope="request">
<%String result=(String)request.getAttribute("result");%>
<script language='javascript'>alert('<%=result%>');window.location.href='b_managerInert.jsp';</script>
</logic:present>
<!-- �ж�request��Χ���Ƿ񲻴���form���� -->
<logic:notPresent name="result" scope="request">
<script language='javascript'>alert('�û���ӳɹ�');window.location.href='b_managerInert.jsp';</script>
</logic:notPresent>
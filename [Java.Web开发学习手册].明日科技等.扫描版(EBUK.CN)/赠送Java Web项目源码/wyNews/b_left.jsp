<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<%@ taglib prefix="logic" uri="/WEB-INF/struts-logic.tld"%> 	
	<table width="94" height="17" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td height="17">&nbsp;</td>
      </tr>
    </table>      <table width="94" height="35" border="0" cellpadding="0" cellspacing="0" background="images/b_leftButton.jpg">
      <tr>
        <td width="92" align="right"><a href="b_mainPage.jsp" class="a2">������ҳ</a></td>
        <td width="2">&nbsp;</td>
      </tr>
    </table>  
    
      <%
      String[] typeNews={"ʱ��Ҫ��","���ö���","��ѧ����","���ƽ���","�������","�������"};
      %>
      <logic:iterate id="type" collection="<%=typeNews%>">
    <table width="94" height="35" border="0" cellpadding="0" cellspacing="0" background="images/b_leftButton.jpg">
      <tr>
        <td width="92" align="right"><a href="newsAction.do?method=queryNewsListAction&bigSort=<%=type%>" class="a1"><%=type%></a></td>
        <td width="2">&nbsp;</td>
      </tr>
    </table>
    </logic:iterate>
   
    
    
    
    
    <table width="94" height="35" border="0" cellpadding="0" cellspacing="0" background="images/b_leftButton.jpg">
      <tr>
        <td width="92" align="right"><a href="afficheAction.do?method=selectAfficheAction" class="a1">������Ϣ����</a></td>
        <td width="2">&nbsp;</td>
      </tr>
    </table>
    <table width="94" height="35" border="0" cellpadding="0" cellspacing="0" background="images/b_leftButton.jpg">
      <tr>
        <td width="92" align="right"><a href="forceAction.do?method=selectForceAction" class="a1">���㵼������</a></td>
        <td width="2">&nbsp;</td>
      </tr>
    </table>
    <table width="94" height="35" border="0" cellpadding="0" cellspacing="0" background="images/b_leftButton.jpg">
      <tr>
        <td width="92" align="right"><a href="index.jsp" class="a3">�˳���̨</a></td>
        <td width="2">&nbsp;</td>
      </tr>
    </table>
    <p>&nbsp;</p>


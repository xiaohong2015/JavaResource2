<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<jsp:directive.page import="com.actionForm.SortForm"/>
<link href="css/style.css" type="text/css" rel="stylesheet">
<script src="js/validate.JS" language="javascript" type="text/javascript"></script>
<%@ page import="java.util.List"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<jsp:useBean id="objectDao" scope="request" class="com.dao.ObjectDao"/>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ page import="com.actionForm.SortForm"%>





<title>��������̨-���Ź���</title>
</head>
<%
String sortNews=new String(request.getParameter("bigSort").getBytes("ISO8859_1"),"gb2312");
%>

<body onLoad="clockon(bgclock);">
<jsp:include page="b_top.jsp"/>

<table width="918" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="100" align="right" valign="top" bgcolor="#FFFFFF">
	<jsp:include page="b_left.jsp"/>
	</td>
    <td width="818" valign="top" background="images/b_right.jpg" align="center">
	<table width="680" height="65" border="0" align="center" cellpadding="0" cellspacing="0" background="images/b_place.jpg">
      <tr>
        <td valign="top"><table width="659">
          <tr>
            <td width="49" height="54" valign="bottom">&nbsp;</td>
            <td width="430" valign="bottom">��ǰλ�� &gt; ���Ź���</td>
            <td width="164" valign="bottom"><div align="right"><a href="sortAction.do?method=selectSortAction&bigSort=<%=sortNews%>">��ϸ������</a></div></td>
          </tr>
        </table></td>
      </tr>
    </table><br>
	<table width="643" height="24" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#CCCCCC">
      <tr>
        <td height="24"> &nbsp;&nbsp;&nbsp;<%=sortNews%>�������ŵ����</td>
      </tr>
    </table>	
	<br>
	
<html:form action="newsAction.do?method=insertNewsAction" onsubmit="return checkEmpty(newsForm)">
	  <table width="640" border="1" cellpadding="1" cellspacing="1" bordercolor="#FFFFFF" bgcolor="#E8E6E7">
        <tr>
          <td width="88" height="30" align="center">���ű���</td>
          <td width="477" bgcolor="#FFFFFF">&nbsp;&nbsp;<html:text property="title" size="50" title="���������ű���"></html:text></td>
        </tr>
        <tr>
          <td height="30" align="center">��ϸ���</td>
          <td bgcolor="#FFFFFF">&nbsp;&nbsp;<html:select property="sortId"> 
                <%
       String hql="from SortForm where bigSort='"+sortNews+"'";
       List list=objectDao.queryList(hql);
        for(int i=0;i<list.size();i++){
          SortForm form=(SortForm)list.get(i);
        %>
                <html:option value="<%=String.valueOf(form.getId())%>" style="background:#00FFFF"><%=form.getSmallSort()%></html:option>
                <%}%>
          </html:select> </td>
        </tr>
        <tr>
          <td height="200" align="center" valign="top"><br>
      ��������</td>
          <td bgcolor="#FFFFFF">&nbsp; <html:textarea property="content" cols="90" rows="20" title="��������������"></html:textarea></td>
        </tr>
        <tr>
          <td height="20" align="center">����ʱ��</td>
          <td bgcolor="#FFFFFF">&nbsp;&nbsp;<%=com.tools.TimeShow.cuttentMonthDate()%><html:hidden property="createTime" value="<%=com.tools.TimeShow.cuttentMonthDate()%>"/> <html:hidden property="bigSort" value="<%=sortNews%>"/> </td>
        </tr>
      </table>
	  <br>
      <html:submit value="���"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <html:reset value="���"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <html:button property="back" onclick="javascript:history.go(-1);" value="����"/>
	  
	  </html:form>
	
	
	
	
	
	
	
	
	</td>
  </tr>
</table>
<jsp:include page="b_botton.jsp"/>
</body>
</html>

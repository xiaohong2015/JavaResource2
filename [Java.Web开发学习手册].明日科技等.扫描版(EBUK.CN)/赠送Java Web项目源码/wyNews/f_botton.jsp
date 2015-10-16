<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<jsp:useBean id="objectDao1" scope="request" class="com.dao.ObjectDao"/>
<table width="800" height="158" border="0" align="center" cellpadding="0" cellspacing="0" background="images/f_botton.jpg">
  <tr>
    <td width="87" valign="top">&nbsp;</td>
    <td width="713" valign="top"><table width="713" height="35">
      <tr>
        <td width="720" height="29" valign="bottom">
          <%
		String sortNews[]={"时政要闻","经济动向","法制教育","科学教育","社会现象","娱乐天地"};
		for(String sortNew: sortNews){
			   String hql2 = "from NewsForm where bigSort='" + sortNew +"'";
			int number=objectDao1.queryListNumber(hql2);
		%>
          <%=sortNew%>&nbsp;共<font color="#FF0000"><%=number%></font>条&nbsp;/&nbsp;
          <%}%>
        </td>
      </tr>
    </table>
      <table width="100">
        <tr>
          <td height="87" valign="bottom"><a href="land_manager.jsp" class="a5" >进入后台</a></td>
        </tr>
      </table></td>
  </tr>
</table>
<%session.invalidate();%>

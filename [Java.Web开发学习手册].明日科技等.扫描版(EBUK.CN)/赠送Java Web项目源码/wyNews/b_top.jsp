<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@page import="com.actionForm.ManagerForm"%>

<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<table width="918" height="170" border="0" align="center" cellpadding="0" cellspacing="0" background="images/b_top.jpg">
  <tr>
    <td width="520">&nbsp;</td>
    <td width="211" valign="bottom"><table width="189" height="30">
      <tr>
        <td width="181"><font color="#5E0000"><div id="bgclock"></div></font></td>
      </tr>
    </table></td>
    <td width="95" valign="bottom"><table width="80" height="30">
      <tr>
        <td width="72">
        <%ManagerForm managerForm=(ManagerForm)session.getAttribute("form");
            if(managerForm.getManager()==1){
        %>
         <a href="b_managerInert.jsp" class="a4">添加用户</a>
        <%} else{%> <a href="b_managerUpdate.jsp" class="a4">修改用户</a>
        <%}%>
        
        </td>
      </tr>
    </table></td>
    <td width="92" valign="bottom"><table width="80" height="30">
      <tr>
        <td width="72">
        <%  if(managerForm.getManager()==1){%>
        <a href="managerAction.do?method=selectManagerAction" class="a4">查看用户</a>
         <%} else{%> <a href="#" class="a4">查看用户</a><%}%>
        </td>
      </tr>
    </table></td>
  </tr>
</table>



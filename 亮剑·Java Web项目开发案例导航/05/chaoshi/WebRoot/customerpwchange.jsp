<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import="java.util.*,wyf.hxl.PaginationBean,wyf.hxl.DB" %>
<% 
	session.setAttribute("fromWhere","mmcz");
	String user=(String)session.getAttribute("user");
	if(user==null)
	{
		response.sendRedirect("customermanage.jsp");
	}
	else
	{
 %>
<html>
  <head>
    <title>��������</title>
    <script language="javascript" src="script/trim.js"></script>
    <script language="javascript">
      function check()
      {
      	var apwd = document.addform.apwd.value.trim();
      	var secpwd = document.addform.secpwd.value.trim();
      	if(apwd==""||apwd.length<6)
      	{
      		alert("���벻�Ϸ�,���Ȳ���С��6!!!");
      		return;
      	}
      	if(secpwd!=apwd)
      	{
      		alert("�����������벻һ��!!!");
      		return;
      	}
      	document.addform.submit();
      }
    </script>
  </head>
<body style="background:url('img/top/bg.gif')">
<center>
<table border="0" width="400" style="border:1px solid #6daafc">
  <tr>
    <td>
		<table width="100%" cellpadding="0" cellspacing="0" border="0">
	  	<caption style="font-size:1.6em;font-weight:bold">��������</caption>
             <form action="CustomerServlet" method="post" name="addform">
                <tr>
                  <td align="right">�������û���</td>
                  <td>
                  	<input value="<%=user%>" disabled/>
                  </td>
                </tr>
                <tr>
                  <td align="right">������������</td>
                  <td><input type="password" name="apwd"/></td>
                </tr>
                <tr>
                  <td align="right">���ٴ�����������</td>
                  <td><input type="password" name="secpwd"/></td>
                </tr>
                <tr>
                  <td align="right">
                    <input type="hidden" name="action" value="resetpwd"/>
                    <input type="button" value="�ύ" onclick="check()"/>
                  </td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  <td><input type="reset" value="����"/></td>
                </tr>
                <tr>
	                <td colspan="2">
	                	&nbsp;&nbsp;
	                </td>
                </tr>
            </form>
    	</table>
    </td>
  </tr>
</table>
</center>
</body>
</html>
<% 
   String msg=(String)request.getAttribute("msg");
   if(msg!=null)
   {
%>
	<script>
	alert('<%=msg%>');
	</script>   
<%
   }
%>
<% 
 	}
%>
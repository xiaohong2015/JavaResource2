<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import="java.util.*,wyf.hxl.PaginationBean" %>
<jsp:useBean id="handlePage" class="wyf.hxl.PaginationBean" scope="session"/>
<% 
	if(session.getAttribute("user")==null)
	{
		response.sendRedirect("customermanage.jsp");
	}
	else
	{
 %>
<html>
  <head>
    <title>������Ϣ</title>
    <script language="javascript" src="script/trim.js"></script>
    <script language="javascript">
      function checkMsg()
      {
        
      	var recname = document.getElementById("recname").value;
      	var recadr = document.getElementById("recadr").value;
      	var rectel = document.getElementById("rectel").value;
      	var zzs =/^[0-9]{1,13}$/;
      	
      	if(recname.trim()=="")
      	{
      		alert("�ջ��˲���Ϊ��!!!");
      		return false;
      	}
      	if(recadr.trim()=="")
      	{
      		alert("�ջ��˵�ַ����Ϊ��!!!");
      		return false;
      	}
      	if(rectel.trim()=="")
      	{
      		alert("�绰���벻��Ϊ��!!!");
      		return false;
      	}
      	if(!zzs.test(rectel))
      	{
      		alert("�绰�����ʽ����!!!");
      		return false;
      	}
      	return true;
      }
    </script>
  </head>
  <body style="background:url('img/top/bg.gif')">
    <center>
    <table border="0" width="400" style="border:1px solid #6daafc">
    <tr>
     <td>
            <table border="0" width="100%">
              <caption style="font-size:1.5em;font-weight:bold">�ջ�����Ϣ</caption>
              <form action="CustomerServlet" method="post" onsubmit="return checkMsg();">
              <input type="hidden" name="action" value="saveRec">
              <input type="hidden" name="orderid" value="<%=request.getAttribute("orderid")%>">
                <tr>
                  <td width="100" align="right">�ջ�������</td>
                  <td><input name="recname" id="recname" size="38"/></td>
                </tr>
                <tr>
                  <td align="right">�ջ��˵�ַ</td>
                  <td><input name="recadr" id="recadr" size="38"/></td>
                </tr>
                <tr>
                  <td align="right">�ջ��˵绰</td>
                  <td><input name="rectel" id="rectel" size="38"/></td>
                </tr>
             </table>
             <table width="100%" border="0">
                <tr>
                  <td style="color:red">
                    &nbsp;&nbsp;�������д��ȷ����Ϣ,�Ա�֤���Ļ�����˳���յ�.
                  </td>
                </tr>
                <tr>
                  <td>
                    &nbsp;&nbsp;<input type="submit" value="ȷ��"/>
                    <input type="button" value="ȡ��" onclick="location.reload('cart.jsp');"/>
                  </td>
                </tr>
              </table> 
      </td></tr></table>
    </center>
  </body>
</html>
<% 
	}
 %>
<%@ page contentType="text/html;charset=gbk"
	import="wyf.zrk.ConsumerInfo"
 %>
<% 
	ConsumerInfo ci = (ConsumerInfo)request.getAttribute("object");
 %>
<html>
  <head>
    <title>�鿴�ͻ�</title>
  </head>
  <body bgcolor="#EBF5FD">
 	<jsp:useBean id="userBean" class="wyf.zrk.UserBean" scope="session"/>
	<table width="100%" height="44" bgcolor="#206AB3">
      <tr align="center"><td>
        <font color="#FFFFFF" size="5">�ͻ����Ϲ���</font>
        <font color="#FFFFFF" size="2">--�ͻ��鿴</font>
      </td></tr>
	</table>
	<table>
	  <tr><td><a href="javascript:history.back()">
	    <img border="0" src="img/back.jpg"/></a>
	  </td></tr>
	</table>
	<hr color="black" size="1" width="100%"/>	
	<table width="80%" border="0" cellspacing="1" bgcolor="black" align="center">	
	  <tr bgcolor="white">
	    <td align="center">�ͻ�����:</td>
	    <td><%= new String(ci.getCname().getBytes("ISO-8859-1"),"gbk") %></td>
	  </tr>
	  <tr bgcolor="white">
	    <td align="center">��&nbsp;ϵ&nbsp;��:</td>
	    <td><%= new String(ci.getClinkman().getBytes("ISO-8859-1"),"gbk") %></td>
	  </tr>
	  <tr bgcolor="white">
	    <td align="center">��˾��ַ:</td>
	    <td><%= new String(ci.getCaddress().getBytes("ISO-8859-1"),"gbk") %></td>
	  </tr>
	  <tr bgcolor="white">
	    <td align="center">��˾�绰:</td>
	    <td><%= new String(ci.getCtel().getBytes("ISO-8859-1"),"gbk") %></td>
	  </tr>
	  <tr bgcolor="white">
	    <td align="center">E-mail:</td>
	    <td><%= new String(ci.getCemail().getBytes("ISO-8859-1"),"gbk") %></td>
	  </tr>
	  <tr bgcolor="white">
	    <td align="center">��&nbsp;&nbsp;&nbsp;&nbsp;ע:</td>
	    <td><%= new String(ci.getCremark().getBytes("ISO-8859-1"),"gbk") %></td>
	  </tr>
	</table>	
  </body>
</html>
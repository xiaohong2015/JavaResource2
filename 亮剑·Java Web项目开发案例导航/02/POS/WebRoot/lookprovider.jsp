<%@ page contentType="text/html;charset=gbk"
	import="wyf.zrk.ProviderInfo"
 %>
<% 
	ProviderInfo pi = (ProviderInfo)request.getAttribute("object");
 %>
<html>
  <head>
    <title>�鿴��Ӧ��</title>
  </head>
  <body bgcolor="#EBF5FD">
 	<jsp:useBean id="userBean" class="wyf.zrk.UserBean" scope="session"/>
	<table width="100%" height="44" bgcolor="#206AB3">
      <tr align="center"><td>
        <font color="#FFFFFF" size="5">��Ӧ�����Ϲ���</font>
        <font color="#FFFFFF" size="2">--��Ӧ�̲鿴</font>
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
	    <td align="center">��Ӧ������:</td>
	    <td><%= new String(pi.getPname().getBytes("ISO-8859-1"),"gbk") %></td>
	  </tr>
	  <tr bgcolor="white">
	    <td align="center">��&nbsp;ϵ&nbsp;��:</td>
	    <td><%= new String(pi.getPlinkman().getBytes("ISO-8859-1"),"gbk") %></td>
	  </tr>
	  <tr bgcolor="white">
	    <td align="center">��˾��ַ:</td>
	    <td><%= new String(pi.getPaddress().getBytes("ISO-8859-1"),"gbk") %></td>
	  </tr>
	  <tr bgcolor="white">
	    <td align="center">��˾�绰:</td>
	    <td><%= new String(pi.getPtel().getBytes("ISO-8859-1"),"gbk") %></td>
	  </tr>
	  <tr bgcolor="white">
	    <td align="center">E-mail:</td>
	    <td><%= new String(pi.getPemail().getBytes("ISO-8859-1"),"gbk") %></td>
	  </tr>
	  <tr bgcolor="white">
	    <td align="center">��&nbsp;&nbsp;&nbsp;&nbsp;ע:</td>
	    <td><%= new String(pi.getPremark().getBytes("ISO-8859-1"),"gbk") %></td>
	  </tr>
	</table>	
  </body>
</html>
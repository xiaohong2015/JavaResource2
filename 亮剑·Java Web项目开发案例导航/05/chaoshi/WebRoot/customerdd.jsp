<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import="java.util.*,wyf.hxl.DB"%>
<html>
  <head>
    <link href="script/style.css" rel="stylesheet" type="text/css"/>
    <script language="javascript" src="script/trim.js"></script>    
    <script language="javascript">
       function check(temp,mmf){
      	if(temp=="mod"){
      	
      		mmf.action.value="ordercx";
      	}
      	mmf.submit();
      }
   
    </script>
  </head>
 <body  style="background:url('img/top/bg.gif')">   
          <a href='CustomerServlet?action=modify2'><img src="img/left_green.png"/>�������ﷵ��</a>
	      <hr></hr>
	   
<table style="border:1px solid #6daafc" cellspacing="5" bgcolor="#d2e9ff">
	<tr>
		<td>
			<table border="0" cellpadding="0" cellspacing="0" width="100%">
				<tr>
				  <% 
	 	 String[] str=(String[])request.getAttribute("list");
			 %>
  					<td colspan="3" align="center" height="40" border="1">
  						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  						<b style="font-size:1.5em"><%= str[0]%>�Ŷ���</b>&nbsp;
  						<b style="font-size:1.2em">(<%= str[5] %>)</b>
  					</td>
				</tr>
				<tr>
				  <td width="350" align="left" height="20" border="0"><b>�ջ�������:</b><%= str[1] %></td>
				  <td width="350" align="left" height="20" border="0"><b>�ջ��˵�ַ:</b><%= str[2] %></td>
				  <td>&nbsp;</td>
				</tr>
				<tr>
				  <td width="350" align="left" height="20" border="0"><b>�ջ��˵绰:</b><%= str[3] %></td>
				  <td width="350" align="left" height="20" border="0"><b>�����ܼ۸�:</b>
				  ��<%= (str[4].indexOf(".")==-1)?str[4]+".00":str[4]%>Ԫ</td>
				  <td>&nbsp;</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
				</tr>
			</table>
			<table width="100%" cellpadding="1" cellspacing="1" bgcolor="black">
	      		<form action="CustomerServlet" method="post">
				    <input id="aa" type="hidden" name="action" value="orderxiugai"/>
				    <input name="orderidname" type="hidden" value="<%= str[0]%>">
	      
	      <%
	      
	      String sql4 = "select goodsid,goodsname,gprice,orderamount,buytime from"
	      +" ordergoodsmeg where oid="+Integer.parseInt(str[0]);
	      	String sql2 = new String(sql4.getBytes(),"ISO-8859-1");
	      	Vector<String[]> vvv =(Vector<String[]>)DB.getMessage(sql2);
	      	if(vvv.size()==0)
	      	{
	      		out.println("û�������Ϣ��");
	      	}
	      	else
	      	{
	      	%>
	      	 
		      <tr>
		        <th bgcolor="#d2e9ff" width="200" align="center" height="30">��ƷID</th>
			    <th bgcolor="#d2e9ff" width="200" align="center" height="30">��Ʒ��</th>
			    <th bgcolor="#d2e9ff" width="200" align="center" height="30">�۸�</th>
			    <th bgcolor="#d2e9ff" width="200" align="center" height="30">����</th>
			    <th bgcolor="#d2e9ff" width="200" align="center" height="30">����ʱ��</th> 
		      </tr>
			<% 
			for(String[] str1:vvv)
			{
				
			%>	<tr align="center">
	       		<td bgcolor="#d2e9ff" bgcolor="white" width="200" align="center" height="20"><%= str1[0] %></td>
	       		<td bgcolor="#d2e9ff" width="200" align="center" height="20">
	       		<%= str1[1] %> </td>
	       		<td bgcolor="#d2e9ff" bgcolor="white" width="200" align="center" height="20">��<%= (str1[2].indexOf(".")==-1)?str1[2]+".00":str1[2]%>Ԫ</td>
	       		<td bgcolor="#d2e9ff" width="200" align="center" height="20"><%= str1[3] %></td>
	       		<td bgcolor="#d2e9ff" bgcolor="white" width="200" align="center" height="20">
	       
	      
	       		<%= (str1[4].length()>19)?str1[4].substring(0,19):str1[4]%></td>
	
	      </tr>
          <% 
        	} 
       	} %>
       	</form>
       	</table>
       	<br/>
</td>
</tr>
</table>
  <table align="center">
  <tr>
  <%  if(str[5].trim().equals("δ����"))
  {%>
       	<td>
       	<a href="CustomerServlet?action=modify&oid=<%= str[0]%>">
	       	<img border="0" id="xg"
			 onmousedown="document.all.xg.src='img/other/xg1.png'" 
	    	 onmousemove="document.all.xg.src='img/other/xg2.png'" 
	    	 onmouseout="document.all.xg.src='img/other/xg3.png'"
	    	 src="img/other/xg1.png" style="cursor:hand" />
		</a>
			&nbsp;&nbsp;&nbsp;&nbsp;
   		<a href="CustomerServlet?action=delete1&oid=<%= str[0]%>">
       		<img border="0" id="sc"
			 onmousedown="document.all.sc.src='img/other/sc1.png'" 
	    	 onmousemove="document.all.sc.src='img/other/sc2.png'" 
	    	 onmouseout="document.all.sc.src='img/other/sc3.png'"
	    	 src="img/other/sc1.png" style="cursor:hand" />
			</a>
		</td>
       	<% } %></tr>
  </table>
	        <hr></hr>
	        
	        <tr align="left"><td><a href='CustomerServlet?action=modify2'>
	        <img src="img/left_green.png"/>�������ﷵ��</a></td></tr>

  </body>
</html>
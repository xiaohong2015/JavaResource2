<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import="java.util.*,wyf.hxl.DB"%>
<html>
  <head>
    <title></title>
   <jsp:useBean id="spSearch" class="wyf.hxl.ManageBean" scope="session"/>
<html>
  <head>
    <title></title>
    <script language="javascript" src="script/trim.js"></script>
    <link href="script/style.css" rel="stylesheet" type="text/css"/>
    <script language="javascript">
  
		function qingchu()
	    {  
	        document.all.searchorder.value="";
	    }
		function checkSearch()
		{ 
			var flag=document.searchs.searchorder.value;
			if(flag.trim()=="")
			{	
				alert("������Ҫ������Ʒ�Ĺؼ��֣���");
				return;
			}
			var reg = /^[0-9]+$/;
			if(!reg.test(flag.trim()))
			{
				alert("�����붩����Ÿ�ʽ��\n�������֣���");
				return;}
			document.searchs.submit();
		}
		function check(temp,mmf){
      	if(temp=="mod"){
      	
      		mmf.action.value="orderxiugai";
      	}
      	mmf.submit();
      	}
    </script>
  </head>
<body  style="background:url('img/top/bg.gif')">   
<table width="100%" border="0">
	        <hr></hr>
	        <%
						String ddfs=(String)session.getAttribute("ddfs");
						if(ddfs==null)
						{
							ddfs="ordergl";
						}	
											
						String pxfs=(String)session.getAttribute("pxfs");
						if(pxfs==null)
						{
							pxfs="asc";
						}	  						          
	        %>
	        <tr align="left"><td><a href="ManageServlet?action=<%=ddfs%>&pxfs=<%=pxfs%>">
	        <img src="img/left_green.png"/>�������ﷵ��</a></td></tr>
</table>
	<form action="ManageServlet" name="searchs" method="post" target="mainFrame">
 			<table width="100%" border="0" height="42" style="background:url(img/top/search.gif) no-repeat">
	      	<tr>
	      	  <td width="198">
	      	  	&nbsp;
	      	  	<input name="searchorder" id="searchorder"
	      	        value="�����붩����" onclick="qingchu()" size="11" style="border:0" />
	      	  </td>
	      	  <td align="center">
	      	  	<input name="action" type="hidden" value="searchorder">
	      	  <td>
	      	  		<img id="sear" src="img/top/bt.gif" onclick="checkSearch()" style="cursor:hand" 
	      	  		   onmousedown="Javascript:document.all.sear.src='img/top/bt1.gif'"
	      	  		   onmouseup="Javascript:document.all.sear.src='img/top/bt.gif'"/>
	      	  </td>
	      	</tr>	      	
	      </table>
	</form>  	
	<%	
		Vector<String[]> vv = (Vector<String[]>)request.getAttribute("vv");
	    int i=0;	
	    for(String[] str:vv)
		{
			i++;
	%>
<table style="border:1px solid #6daafc" cellspacing="5" bgcolor="#d2e9ff">
<tr>
<td>
<table border="0" cellpadding="0" cellspacing="0" width="100%" >
<tr>
  <td colspan="5"  align="center" height="40" border="0">
  <b style="font-size:1.5em"><%= str[0]%>�Ŷ���</b>

  </td>
</tr>

<tr><td width="250" align="left" height="20"><b>��������:</b><%= str[1] %></td>
		      <td width="250" align="left" height="20"><b>�ջ�������:</b><%= str[2] %></td>
		      <td width="250" align="left" height="20"><b>�ջ��˵�ַ:</b><%= str[3] %></td>
<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
</tr>
 <td width="250" align="left" height="20"><b>�ջ��˵绰:</b><%= str[4] %></td>
		      <td width="250" align="left" height="20"><b>�ܼ۸�:</b>
		      ��<%= (str[5].indexOf(".")==-1)?str[5]+".00":str[5]%>Ԫ</td>
		      <td width="250" align="left" height="20"><b>����״̬:</b>
		      <font color="black"><%= str[6] %></font></td>
<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
</tr>
</table>
<table border="0" bgcolor="black" cellspacing="1">
<form action="ManageServlet" method="post" name="mf<%= i %>">
	      <% 
	     	 String sql4 = "select goodsid,goodsname,gprice,orderamount,buytime from"
		      	+" ordergoodsmeg where oid="+Integer.parseInt(str[0]);
		     String sql2 = new String(sql4.getBytes(),"ISO-8859-1");
		     Vector<String[]> vvv = DB.getMessage(sql2);
		 
	      	if(vvv.size()==0)
	      	{
	      		out.println("û�������Ϣ��");
	      	}
	      	else
	      	{%>
	      	 
		      <tr>
		        <th bgcolor="#d2e9ff" width="200" align="center" height="30">��ƷID</th>
			    <th bgcolor="#d2e9ff" width="200" align="center" height="30">��Ʒ��</th>
			    <th bgcolor="#d2e9ff" width="200" align="center" height="30">�۸�</th>
			    <th bgcolor="#d2e9ff" width="200" align="center" height="30">����</th>
			    <th bgcolor="#d2e9ff" width="200" align="center" height="30">����ʱ��</th> 
		      </tr>
			<% int q=0;
				for(String[] str1:vvv)
				{q++;%>	<tr align="center">
	       		<td bgcolor="#d2e9ff" width="200" align="center" height="20"><%= str1[0] %></td>
	       		<td bgcolor="#d2e9ff" width="200"><%= str1[1] %></td>
	       		<td bgcolor="#d2e9ff" width="200">��<%= (str1[2].indexOf(".")==-1)?str1[2]+".00":str1[2]%>Ԫ</td>
	       		<td bgcolor="#d2e9ff" width="200"><%= str1[3] %></td>
	       		<td bgcolor="#d2e9ff" width="200"><%= (str1[4].length()>19)?str1[4].substring(0,19):str1[4] %></td>
	
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
    <% if(str[6].trim().equals("δ����")) {%>

       	<td width="100" align="center" height="20">
       	<a href="ManageServlet?action=orderxiugai&oid=<%= str[0]%>">
	       	<img border="0" id="fh"
							 onmousedown="document.all.fh.src='img/dlfh/fsdd1.gif'" 
					    	 onmousemove="document.all.fh.src='img/dlfh/fsdd2.gif'" 
					    	 onmouseout="document.all.fh.src='img/dlfh/fsdd3.gif'"
					    	 src="img/dlfh/fsdd1.gif" style="cursor:hand" />
        </a></td>		
  </table>
   	
        <% }
    } 


 %>
<table width="100%" border="0">
	        <hr></hr>
	        
	        <tr align="left"><td><a href="ManageServlet?action=<%=ddfs%>&pxfs=<%=pxfs%>">
	        <img src="img/left_green.png"/>�������ﷵ��</a></td></tr>
</table>
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
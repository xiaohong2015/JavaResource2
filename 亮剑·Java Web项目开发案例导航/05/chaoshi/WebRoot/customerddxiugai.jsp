<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import="java.util.*,wyf.hxl.DB,wyf.hxl.PaginationBean"%>
<jsp:useBean id="handlPage" class="wyf.hxl.PaginationBean" scope="session"/> 
<html>
  <head>
    <title></title>
    <script language="javascript" src="script/trim.js"></script>
    <link href="script/style.css" rel="stylesheet" type="text/css"/>
    <script language="javascript">
    function checkdd()
      {
      	var pwd = document.getElementById('receivename').value;
      	var tel = document.getElementById('receivetel').value;
      	var adds = document.getElementById('receiveadds').value;
      	
      	if(pwd.trim()=="")
      	{
      		alert("�ջ�������������Ϊ��!!!");
      		return;
      	}
      	else if(tel.trim()=="")
      	{
      		alert("�ջ��˵绰������Ϊ��!!!");
      		return;
      	}
      	else if(adds.trim()=="")
      	{
      		alert("�ջ��˵�ַ����Ϊ��!!!");
      		return;
      	}
      	document.getElementById("mfzddaction").value="tijiao";
      	document.getElementById("mfzdd").submit();
      }
      
       function del(){
      	document.getElementById("mfzddaction").value="delete1";
      	document.getElementById("mfzdd").submit();
      }
   	function checkQuantity(slStr,mf)
 	{
 	    var sl=slStr*1;
 	    if(sl&&Math.round(sl)==sl)
 	    {
 	       mf.submit();
 	    }
 	    else
 	    {
 	       alert("��Ʒ��������Ϊ����,\n�Ҳ���Ϊ0��");	       
 	    }  	 	    
 	}
  	 	
  	 <!-- checkQuantity("12.00"); -->	
    </script>
    </script>
  </head>
 <body  style="background:url('img/top/bg.gif')">   
	     <a href="CustomerServlet?action=modify1&oid=<%= request.getParameter("oid")%>">
	     <img src="img/left_green.png"/>�������ﷵ��</a>
	      <hr/>
	     <% 
	   String[] str=(String[])request.getAttribute("list");	
		%> 
<table style="border:1px solid #6daafc" cellspacing="5" bgcolor="#d2e9ff">
<tr>
<td>
<table border="0" cellpadding="0" cellspacing="0" width="100%" >
<tr>
  <td colspan="3"  align="center" height="40" border="0">
  <b style="font-size:1.5em"><%= str[0]%>�Ŷ���</b>

  </td>
</tr>

<table><form action="CustomerServlet" id="mfzdd" name="mfzdd" method="post">
<input type="hidden" name="action" id="mfzddaction"/>
<input type="hidden" name="oid" value="<%= str[0]%>">
<tr>
  <td width="350" align="left" height="20" border="0"><b>�ջ�������:</b><input type="text" id="receivename" name="receivename" value="<%= str[1] %>"/></td>
  <td width="350" align="left" height="20" border="0"><b>�ջ��˵�ַ:<input type="text" id="receiveadds" name="receiveadds" value="<%= str[2] %>"/></td>
  <td>&nbsp;</td>
</tr>
<tr>
  <td width="350" align="left" height="20" border="0"><b>�ջ��˵绰:</b><input type="text" id="receivetel" name="receivetel" value="<%= str[3] %>"/></td>
  <td width="350" align="left" height="20" border="0"><b>�����ܼ۸�:��<%= (str[4].indexOf(".")==-1)?str[4]+".00":str[4]%>Ԫ</td>
  <td>&nbsp;</td>
</tr>
</form></table>
	      <table width="100%" cellpadding="1" cellspacing="1" bgcolor="black">
	      <% 
	      	String sql4 = "select * from ordergoodsmeg where oid="+Integer.parseInt(str[0]);
	      	String sql2 = new String(sql4.getBytes(),"ISO-8859-1");
	      	Vector<String[]> vvv = DB.getMessage(sql2);
	      	int i=0;
	      	if(vvv.size()==0)
	      	{
	      		out.println("û�������Ϣ��");
	      	}
	      	else
	      	{
	      	%>
	      	 
		      <tr>
		        <th width="200" align="center" height="30" bgcolor="#d2e9ff">��ƷID</th>
			    <th width="200" align="center" height="30" bgcolor="#d2e9ff">��Ʒ��</th>
			    <th width="200" align="center" height="30" bgcolor="#d2e9ff">�۸�</th>
			    <th width="200" align="center" height="30" bgcolor="#d2e9ff">����</th>
			    <th width="200" align="center" height="30" bgcolor="#d2e9ff">����ʱ��</th> 
		      </tr>
			<% 
			for(String[] str1:vvv)
			{
				i++;
			%>	<tr align="center">
				<td width="200" align="center" height="20" bgcolor="#d2e9ff"><%= str1[1] %></td>
	       		<td width="200" align="center" height="20" bgcolor="#d2e9ff"><%= str1[2] %></td>
	       		<td width="200" align="center" height="20" bgcolor="#d2e9ff">
	       		��<%= (str1[3].indexOf(".")==-1)?str1[3]+".00":str1[3]%>Ԫ</td>
	       		
	       		
	       	<form action="CustomerServlet" method="post" name="mf<%=i %>">
		    <td bgcolor="#d2e9ff" width="200">
			    <input type="text" id="receiveshuliang<%=i %>" name="receiveshuliang" value="<%= str1[4] %>" size="10" />
			    <input type="button" value="�޸�" onclick="checkQuantity(document.getElementById('receiveshuliang<%=i %>').value,this.form);"/>
			    <input type="hidden" name="oid" value="<%= str[0]%>"/>
			    <input type="hidden" name="goodsname" value="<%= str1[2]%>"/>
			    <input type="hidden" name="action" value="change1"/>
			</td>
		    </form>
				<td width="200" align="center" height="20" bgcolor="#d2e9ff"><%=  (str1[5].length()>19)?str1[5].substring(0,19):str1[5] %></td>
	      </tr>
          <% 
       		} 
       	} %>	   
        </table><br/>
</td></tr>
</table>      
  <table align="center">
  <tr>
  <td>
  	<a href="#" onclick="checkdd()">
  	       	<img border="0" id="tj"
			 onmousedown="document.all.tj.src='img/other/tj1.png'" 
	    	 onmousemove="document.all.tj.src='img/other/tj2.png'" 
	    	 onmouseout="document.all.tj.src='img/other/tj3.png'"
	    	 src="img/other/tj1.png" style="cursor:hand" />
	</a> &nbsp;&nbsp;&nbsp;&nbsp;
  		<a href="#" onclick="del()">       		
  			<img border="0" id="sc"
			 onmousedown="document.all.sc.src='img/other/sc1.png'" 
	    	 onmousemove="document.all.sc.src='img/other/sc2.png'" 
	    	 onmouseout="document.all.sc.src='img/other/sc3.png'"
	    	 src="img/other/sc1.png" style="cursor:hand" />
	    </a></td>	
       	</tr>
  </table>
	        <hr/>
	        
	        <tr align="left"><td><a href="http://localhost:8080/chaoshi/CustomerServlet?action=modify2">
	        <a href="CustomerServlet?action=modify1&oid=<%= request.getParameter("oid")%>">
	        <img src="img/left_green.png"/>�������ﷵ��</a></td></tr>

  </body>
</html>
<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import="java.util.*"%>
<html>
  <head>
    <style>
      th
      {
        background:#d2e9ff;
      }
      td
      {
        background:#d2e9ff;
      }
    </style>
	<script language="javascript" src="script/trim.js"></script>	
    <link href="script/style.css" rel="stylesheet" type="text/css"/>
    <script language="javascript">
    	function checkNum(num)
    	{
    		var reg = /^[1-9][0-9]*$/;
    		if(reg.test(num.trim()))
    		{
    			return true;
    		}
    		else
    		{
    			alert("��Ʒ����ֻ��Ϊ�����Ҳ���Ϊ0������");
    			return false;
    		}
    	}
    </script>
    <jsp:useBean id="handlePage" class="wyf.hxl.PaginationBean" scope="session"/>
  </head>
  <body style="background:url('img/top/bg.gif')">
<% 
if(handlePage.getCart().size()==0)
{
%>
<br/><br/>
<table style="background:url('img/top/bg.gif')" align="center">
	<tr>
		<td>
	    <img src="img/png-0405.png"/>
	  </td>
	  <td> 	
	    <b style="font-size:1.5em">���ﳵ��û����Ʒ�������й��򣡣���</b>
	  </td>
	</tr>
</table>
<%
}

else
{
%>
<table width="100%">
    <tr align="center">
        <td>

  <table border="0" width="70%" style="border:1px solid #6daafc" align="center">
  <tr>
    <td style="font-size:1.2em" align="center">
      ���ﳵ
    </td>
  </tr>
  <tr>
  <td>  

    <table border="0" width="100%" bgcolor="black" cellspacing="1">
     <tr>
     	<th>��ƷID</th>
    	<th>��Ʒ����</th>
    	<th>��Ʒ�۸�</th>
    	<th>��Ʒ����</th>
    	<th>ɾ��</th>
  	</tr>
	<% 
		Vector<String[]> vv = handlePage.getCartContent();
		for(String[] a:vv)
		{			
	%>
	   <tr>
		  <td><%= a[2] %></td>
		  <td><%= a[0] %></td>
		  <td  width="100">��<%= a[1] %></td>
		  <form action="CustomerServlet" method="post"
  		     onsubmit="return checkNum(document.all.gnum<%= a[2] %>.value);">
			  <td width="100">
			    <input type="text" id="gnum<%= a[2] %>" name="gnum" value="<%= a[3] %>" size="5"/>
			    <input type="submit" value="�޸�"/>
			    <input type="hidden" name="goodsid" value="<%= a[2]%>"/>
			    <input type="hidden" name="action" value="change"/>
			  </td>	
		  </form>
		  <form action="CustomerServlet">
			  <td width="100" align="center">
			    <input type="submit" value="ɾ��"/>
			    <input type="hidden" name="goodsid" value="<%= a[2]%>"/>
			    <input type="hidden" name="action" value="delete"/>
			  </td>	
		  </form>	  
		</tr>		
	<%
		}
	 %>
    </table>
    
    </td>
  </tr>
  <tr>
    <td>
      <table width="100%" border="0">
         <tr>
		     <td align="right" colspan="3"><b>��Ʒ�۸��ܼ�:��<%= handlePage.getAccount() %>Ԫ</b></td>
		     <td align="center">
		     <% 
		     	if(session.getAttribute("jieZhang")==null)
		     	{
		      %>
		      <form action="CustomerServlet">
	      	  <td width="100" align="center">
			    <input type="submit" value="����"/>
			    <input type="hidden" name="action" value="jiezhang"/>
			  </td>	
			  </form>
		      <% 
		      	}
		      %>
		     </td>
		   </tr>
      </table>
    </td>
  </tr>
</table> 
    <% 
	}
     %>    
    </center>
    <br/>
    <table align="left">
    	<tr>
	    	<td>
	    		<a href="pagination.jsp"><img src="img/left_green.png" border="0"/>��������</a>
	    	</td>
        </tr>
    </table>
    <script>
      <% 
         String msg=(String)request.getAttribute("msg");
         if(msg!=null)
         {
      %>
         alert('<%=msg%>');
      <%
         }
       %>
    </script>
  </body>
</html>
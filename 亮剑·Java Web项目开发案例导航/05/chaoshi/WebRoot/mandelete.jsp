<%@ page contentType="text/html;charset=gb2312"%>
<%@ page import="java.util.*,wyf.hxl.ManageBean,wyf.hxl.DB"%>

<html>
  <head>
<% 
   String chaoji=(String)session.getAttribute("chaoji");
   if(chaoji==null)
   {
     request.setAttribute("msg", "�Բ���ֻ��chaoji����Ա��\\n����ʹ�ô���ܣ����½��");
%>
     <jsp:forward page="dl.jsp"/>
<%
   }
%>  
  </head>
<body style="background:url('img/top/bg.gif')">
<center>
 <% 
    String ss="putong";
      	String sql = "select mname,mpw,mpermitted from mmanager where mpermitted='"+ss+"'";
      	String sql11 = new String(sql.getBytes(),"ISO-8859-1");
      	Vector<String[]> vv = DB.getMessage(sql11);
      	if(vv.size()==0)
      	{	
            request.setAttribute("msg","ɾ���ɹ���");
            this.getServletContext().getRequestDispatcher("/welcome.jsp").forward(request,response);              
      	    return;
      	}%>
<br><br>
<table border="0" width="500" style="border:1px solid #6daafc" align="center">
  <tr>
    <td>
		<table border="0" align="center" width="100%" bgcolor="black" cellspacing="1">
		<caption style="font-size:1.5em;font-weight:bold">����Ա����</caption>
          <tr>
		    <th bgcolor="#d2e9ff">����Ա��</th>
		    <th bgcolor="#d2e9ff">����Ա����</th>
		    <th bgcolor="#d2e9ff">����ԱȨ��</th>
		    <th bgcolor="#d2e9ff">ɾ��</th>           
          </tr> 
      	<%
		for(String[] str:vv)
		{
			
       %>
  	  
	       <tr align='center'>
	       		<td bgcolor="#d2e9ff"><%= str[0] %></td>
	       		<td bgcolor="#d2e9ff"><%= str[1] %></td>
	       		<td bgcolor="#d2e9ff"><%= str[2] %></td>
	       		<form action="ManageServlet">
	       		  <td width="100" align="center" bgcolor="#d2e9ff">
				    <input type="submit" value="ɾ��"/>
				    <input type="hidden" name="mname" value="<%= str[0]%>"/>
				    <input type="hidden" name="action" value="mandelete"/>
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
        	<td bgcolor="#d2e9ff" align="center">
          	<a href="welcome.jsp">
		        	<img border="0" id="qd"
							 onmousedown="document.all.qd.src='img/dlfh/qd1.gif'" 
					    	 onmousemove="document.all.qd.src='img/dlfh/qd2.gif'" 
					    	 onmouseout="document.all.qd.src='img/dlfh/qd3.gif'"
					    	 src="img/dlfh/qd1.gif" style="cursor:hand" />
					  </a>
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
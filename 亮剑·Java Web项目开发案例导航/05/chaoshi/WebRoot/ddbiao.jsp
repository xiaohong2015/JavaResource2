<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import="java.util.*,wyf.hxl.DB"%>
<html>
  <head>
    <title></title>
    <script language="javascript" src="script/trim.js"></script>
    <link href="script/style.css" rel="stylesheet" type="text/css"/>
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
	        
	     <%  
	      	Vector<String[]> vv=(Vector<String[]>)request.getAttribute("list");
	      	String cname=(String)request.getAttribute("use");
	      	System.out.println(cname);
	      	int i=0;
	      	%>
	      	<table width="100%">		      	
		      	<tr align="left">
		      	    <td>
		      	      <a href="pagination.jsp"><img src="img/left_green.png"/>��������</a>
		      	    </td>
		      	    <form action="CustomerServlet">				
					<td align="center">			<% System.out.println(session.getAttribute("wdddpx")); %>		  
				      ������ʱ������ 
				      <input 
				        type="radio" 
				        name="action" 
				        value="paixus"
				        <%=(session.getAttribute("wdddpx")==null)?"checked":(session.getAttribute("wdddpx").equals("asc"))?"checked":""%> 
				        onclick="this.form.submit();"
				      >����
				      <input 
				         type="radio" 
				         name="action" 
				         value="paixu" 
				         <%=(session.getAttribute("wdddpx")==null)?"":(session.getAttribute("wdddpx").equals("desc"))?"checked":""%>
				         onclick="this.form.submit();"
				      >����
				      <input type="hidden" name="user" value="<%= cname%>">
					</td>	
					</form>	
					<td width="200">&nbsp;</td>		
				</tr>				
			</table>
		      <hr></hr>
<table border="0" align="center" width="900">
   <tr>
      <td>
      	<table width="100%" cellpadding="1" cellspacing="1" bgcolor="black" border="0" align="center">
      	<caption style="font-size:1.6em;font-weight:bold">������Ϣ</caption>
      	<tr bgcolor="#d2e9ff">
      	  <th width="55" align="center" height="30">������</th>
      	  <th width="70" align="center" height="30">״̬</th>
      	  <th width="100" align="center" height="30">�ջ�������</th>
      	  <th width="190" align="center" height="30">�ջ��˵�ַ</th>
      	  <th width="100" align="center" height="30">�ջ��˵绰</b></font></th>
      	  <th width="100" align="center" height="30">�ܼ۸�</th>
      	  <th align="center" height="30">Ԥ��ʱ��</th>
      	  <th width="70" align="center" height="30">�鿴��ϸ</th>
        </tr>
      	<%	
	     for(String[] str:vv)
		{
		i++;		   
		 %>	     
	    <input id="aa" type="hidden" name="action" value="orderxiugai"/>
	    <input name="orderidname" type="hidden" value="<%= str[0]%>">
      
      <tr bgcolor="<%=(i%2==0)?"#d2e9ff":"#e4f0ff"%>">	  
      	  <td align="center" height="20"><%= str[0]%></td>
      	  <td align="center" height="20"><%= str[5] %></td>
	      <td height="20"><%= str[1] %></td>
	      <td height="20"><%= str[2] %></td>
	      <td height="20"><%= str[3] %></td>
	      <td align="center" height="20">��<%= (str[4].indexOf(".")==-1)?str[4]+".00":str[4]%>Ԫ</td>
	      <td align="center" height="20"><%= (str[6].length()>19)?str[6].substring(0,19):str[6]%></td>
	      <form action="CustomerServlet">
		      <td align="center" height="20">			      
			      <input type="hidden" name="oid" value="<%= str[0]%>"/>
			      <input type="hidden" name="action" value="modify1"/>
			      <input type="submit" value="�鿴"/>
		      </td>
	      </form>
      </tr> 
	    <% 
	   	}
	    %>
  </table>
</td>
</tr>
</table>
<hr></hr>
<a href="pagination.jsp"><img src="img/left_green.png"/>��������</a>
</body>
</html>
<%@ page contentType="text/html;charset=gbk"  
	import="java.util.*"
%>

<% 
	if(session.getAttribute("user")==null){
		out.println("<script language=\"JavaScript\"> alert(\"�����ȵ�¼������\");"
					+"window.location.href=\"index.jsp\"</script>");
	}
	else{	
		List<String[]> ls = (List<String[]>)session.getAttribute("list");
		int totalpage = (Integer)session.getAttribute("totalpage");
		int nowpage = (Integer)session.getAttribute("nowpage");
		if(ls.size()==0){
			out.println("<script language=\"JavaScript\"> alert(\"��û���κ�Ԥ��������\");"
						+"window.location.href=\"index.jsp\"</script>");
		}
		else{
%>
<html>
	<head>
		<title>�ҵ�Ԥ��</title>
 		<link href="css/book.css" type="text/css" rel="stylesheet"/>
 		<link href="css/tablestyle.css" type="text/css" rel="stylesheet"/>
 		<script language="JavaScript" src="script/trim.js"></script>
 		<script language="JavaScript" src="script/changepage.js"></script>
 	</head>
 	<body>
 		<div id="wrapper">
		<div id="branding"></div>
		<div id="content" style="height:400px">
			<p id="top">
				<a href="index.jsp">��ҳ</a>>><b>�ҵ�Ԥ��</b>
			</p>
			<table border="0" bgcolor="black" width="90%" cellspacing="1" class="default">
			<caption>�ҵĶ���</caption>
			<thead>
				<tr>
					<th>������</th>
					<th>����</th>
					<th>��Ʊ����</th>
					<th>����״̬</th>
					<th>�鿴��ϸ</th>
					<th>�޸�</th>
					<th>ɾ��</th>
				</tr>
			</thead>
			<tbody>
			<% 
				for(int i=0;i<ls.size();i++){
					String[] str = ls.get(i);
			%>
				<tr>
					<td width="80"><%= i+1 %></td>
					<td width="80"><%= str[1] %></td>
					<td><%= str[2] %></td>
					<td width="100"><%= str[3] %></td>
					<td width="120"><img src="images/detail.gif" />
						<a href="<%= request.getContextPath() %>/ManageServlet?action=getOrderDetail&url=/orderdetail.jsp&oid=<%= str[0] %>">
							�鿴��ϸ</a></td>					
					<% 
						if(str[3].equals("δ����")){
					 %>
					 <td width="80">
					 	<img src="images/modify.gif" /><a href="<%= request.getContextPath() %>/ManageServlet?action=getOrderDetail&url=/modifyorder.jsp&oid=<%= str[0] %>">�޸�</a>
					 </td>
					 <td width="80"><img src="images/del.gif" /><a href="<%= request.getContextPath() %>/ManageServlet?action=delOrder&oid=<%= str[0] %>">ɾ��</a></td>
					<% 
						}
						else{
							out.println("<td>--</td><td>--</td>");
						}
					 %>					
				</tr>
			<% 
				}
			 %>
			</tbody>
			</table>
			<table width="90%" align="center">
			<form method="post" action="ManageServlet" name="myform" id="myform">
			  <tr height="50px">
			    <td align="left">
			      <font size="2">��<%= totalpage %>ҳ&nbsp;&nbsp;��ǰҳ:<%= nowpage %></font>
			    </td>
			    <td align="right">
			      <% 
			      	if(nowpage>1){
			       %>
			      <a href="<%= request.getContextPath() %>/ManageServlet?action=changePage&pagename=/myorder.jsp&page=<%= nowpage-1 %>"><img src="images/pre.gif" border="0"/></a>
			      <% 
			      	}
			      	if(nowpage<totalpage){
			       %>	       
			      <a href="<%= request.getContextPath() %>/ManageServlet?action=changePage&pagename=/myorder.jsp&page=<%= nowpage+1 %>"><img src="images/next.gif" border="0"/></a>
			      <% 
			      	}
			      	else{
			      		out.println("<img src='images/next.gif' style='visibility:hidden'/>");
			      	}
			       %>
			      <font size="2">��<input name="page" id="page" size="2" value="<%= nowpage %>" onfocus="document.all.page.value=''"/>ҳ</font>
			      <input type="hidden" name="action" value="changePage" />
			      <input type="hidden" name="pagename" value="/myorder.jsp"/>
			    </td>
			    <td width="10">
			      <img src="images/go.gif" border="0" style="cursor:hand" onclick="JavaScript:checkPage(<%= totalpage %>)">
			    </td>
			  </tr>	
			</form>
			</table>
		</div>
		</div>
 	</body>
</html>
<%
		}
	}
	
 %>



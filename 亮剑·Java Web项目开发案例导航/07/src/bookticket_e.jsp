<%@ page contentType="text/html;charset=gbk" 
	import="wyf.zrk.TicketItem"
%>

<% 
	TicketItem ti = (TicketItem)session.getAttribute("ti");
	if(ti==null){
		response.sendRedirect("index.jsp");
	}
	else{
 %>
<html>
	<head>
		<title>��Ϣ�˶�</title>		
 		<link href="css/book.css" type="text/css" rel="stylesheet"/>
	</head>
	<body>
		<div id="wrapper">
		<div id="branding"></div>
		<div id="content" style="height:400px">
			<p id="top">
				<a href="index.jsp">��ҳ</a>>><b>��ƱԤ��</b>
			</p>
			<table border="0" cellspacing="1" bgcolor="#F7B770" width="80%" height="50px">
				<tr bgcolor="#FDF1E4">
					<td align="center">
						<img src="images/warning.gif" border="0" />
						<font size="2">��˶����ĸ�����Ϣ����ȷ�����ܼ�ʱ�ء�׼ȷ��Ԥ���������賵�εĳ�Ʊ��</font>
					</td>
				</tr>
			</table><br/><br/>
			<table border="0" bgcolor="black" width="80%" cellspacing="1">
				<tr bgcolor="#EDF2F7" align="center">
					<th>���Σ�</th>
					<td><%= ti.getTname() %></td>
					<th>��Ʊ������</th>
					<td><%= ti.getTamount() %></td>
				</tr>
				<tr bgcolor="#FFFFFF" align="center">
					<th>����վ��</th>
					<td><%= ti.getTstart() %></td>
					<th>Ŀ��վ��</th>
					<td><%= ti.getTend() %></td>
				</tr>
				<tr bgcolor="#EDF2F7" align="center">
					<th>��Ʊ���ڣ�</th>
					<td><%= ti.getTdate() %></td>
					<th>��ϵ�ˣ�</th>
					<td><%= ti.getLinkman() %></td>
				</tr>
				<tr bgcolor="#FFFFFF" align="center">
					<th>��ϵ�˵�ַ��</th>
					<td><%= ti.getAddress() %></td>
					<th>��ϵ�绰��</th>
					<td><%= ti.getTel() %></td>
				</tr>
			</table>
			<p align="center">
			<form>
				<input type="button" class="btn" onclick="window.location.href='<%= request.getContextPath() %>/ManageServlet?action=look'" value="&nbsp;�޸�&nbsp;"/>&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" class="btn" onclick="window.location.href='<%= request.getContextPath() %>/ManageServlet?action=subOrder'" value="&nbsp;ȷ��&nbsp;"/>&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" class="btn" onclick="window.location.href='<%= request.getContextPath() %>/ManageServlet?action=delete'" value="&nbsp;ȡ��&nbsp;"/>&nbsp;&nbsp;&nbsp;&nbsp;
			</form>
			</p>
		</div>
		</div>
	</body>
</html> 
 <% 
 	}
  %>
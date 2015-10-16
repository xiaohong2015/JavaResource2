<%@ page contentType="text/html;charset=gbk"
	import="java.util.*"
 %>
<% 
	List<String[]> list = (List<String[]>)session.getAttribute("list_train");
	String station = (String)request.getAttribute("station");
	if(list==null||list.size()==0){
		response.sendRedirect("index.jsp");
	}
	else{
 %>
<html>
	<head>
		<title>���β�ѯ</title>
		<link href="css/reg.css" type="text/css" rel="stylesheet"/>
		<link href="css/tablestyle.css" type="text/css" rel="stylesheet"/>
	</head>
	<body>
		<div id="wrapper">
		<div id="branding"></div>
		<div id="content" style="height:400px">
			<p id="top">
				<a href="index.jsp">��ҳ</a>>><b>���β�ѯ</b>
			</p>
			<table class="default" align="center" border="0" bgcolor="black" width="90%" cellspacing="1">
			<caption>
			<% 
				if(station==null){
					out.println("�� "+session.getAttribute("start")+" �� "+session.getAttribute("end")+" �ĳ�������");
				}
				else{
					out.println("���� "+station+" վ�ĳ�������");
				}
			 %>
			</caption>
			<thead>
				<tr>
					<th>����</th>
					<th>����վ</th>
					<th>����ʱ��</th>
					<th>����վ</th>
					<th>����ʱ��</th>
					<th>�г�����</th>
					<th>Ԥ��</th>
				</tr>
			</thead>
			<tbody>
			<% 
				for(int i=0;i<list.size();i++){
					String[] str = list.get(i);
			%>
				<tr>
					<td width="80"><a href="<%= request.getContextPath() %>/ManageServlet?action=cccx&train=<%= str[1] %>&flag=1"><%= str[1] %></a></td>
					<td><%= str[2] %></td>
					<td><%= str[3].substring(0,5) %></td>
					<td><%= str[4] %></td>
					<td><%= str[5].substring(0,5) %></td>
					<td><%= str[6] %></td>
					<td width="80"><a href="<%= request.getContextPath() %>/ManageServlet?action=book&tname=<%= str[1] %>">Ԥ��</a></td>
				</tr>
			<% 
				}
			 %>
			 </tbody>
			</table>
		</div>
		</div>
	</body>
</html>
<% 
	}
 %>
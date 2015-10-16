<%@ page contentType="text/html;charset=gbk"
	import="java.util.*"
 %>
<% 
	List<String[]> list = (List<String[]>)session.getAttribute("mid_train");
	if(list==null||list.size()==0){
		response.sendRedirect("index.jsp");
	}
	else{
 %>
<html>
	<head>
		<title>时刻查询</title>
		<link href="css/reg.css" type="text/css" rel="stylesheet"/>
		<link href="css/tablestyle.css" type="text/css" rel="stylesheet"/>
	</head>
	<body>
		<div id="wrapper">
		<div id="branding"></div>
		<div id="content" style="height:400px">
			<p id="top">
				<a href="index.jsp">首页</a>>><a href="midstation.jsp">中转站查询</a>>><b>车次查询<b/>
			</p>
			<table class="default" align="center" border="0" bgcolor="black" width="90%" cellspacing="1">
			<caption>
			由 <%= session.getAttribute("start") %> 到 <%= session.getAttribute("end") %> 的车次如下
			</caption>
			<thead>
				<tr>
					<th>车次</th>
					<th>出发站</th>
					<th>开车时间</th>
					<th>到达站</th>
					<th>到达时间</th>
					<th>列车类型</th>
					<th>预订</th>
				</tr>
			</thead>
			<tbody>
			<% 
				for(int i=0;i<list.size();i++){
					String[] str = list.get(i);
			%>
				<tr>
					<td><a href="<%= request.getContextPath() %>/ManageServlet?action=cccx&train=<%= str[1] %>&flag=2"><%= str[1] %></a></td>
					<td><%= str[2] %></td>
					<td><%= str[3].substring(0,5) %></td>
					<td><%= str[4] %></td>
					<td><%= str[5].substring(0,5) %></td>
					<td><%= str[6] %></td>
					<td><a href="<%= request.getContextPath() %>/ManageServlet?action=book&tname=<%= str[1] %>"></td>
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
<%@ page contentType="text/html;charset=gbk"
	import="java.util.*"
 %>
<% 
	List<String> list = (List<String>)session.getAttribute("mid");
	if(list==null||list.size()==0){
		response.sendRedirect("index.jsp");
	}
	else{
 %>
<html>
	<head>
		<title>���β�ѯ</title>
		<link href="css/reg.css" type="text/css" rel="stylesheet"/>
		<link href="css/tablestyle.css" type="text/css" rel="stylesheet" />
	</head>
	<body>
		<div id="wrapper">
		<div id="branding"></div>
		<div id="content" style="height:400px">
			<p id="top">
				<a href="index.jsp">��ҳ</a>>><b>��תվ��ѯ</b>
			</p>			
			<table border="0" cellspacing="1" bgcolor="#F7B770" width="80%" height="50px" align="center">
				<tr bgcolor="#FDF1E4">
					<td align="center">
						<img src="images/warning.gif" border="0" />
						<font size="2">
							��&nbsp;<%= session.getAttribute("start") %>&nbsp;
							��&nbsp;<%= session.getAttribute("end") %>&nbsp;û��ֱ��ĳ��Σ�
							������ѡ��������תվ�����������г̡�
						</font>
					</td>
				</tr>
			</table><br/><br/>			
			<table class="default" cellspacing="1" border="0" align="center">
			<thead>
				<tr>
					<th>��תվ</th>
					<th>����վ</th>
					<th>����վ</th>
				</tr>
			</thead>
			<tbody>
			<% 
				for(int i=0;i<list.size();i++){
			%>
				<tr>
					<td><a href="<%= request.getContextPath() %>/ManageServlet?action=midSearch&mid=<%= list.get(i) %>"><%= list.get(i) %></a></td>
					<td><%= session.getAttribute("start") %></td>
					<td><%= session.getAttribute("end") %></td>
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
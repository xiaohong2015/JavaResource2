<%@ page contentType="text/html;charset=gbk"
	import="java.util.*"
 %>
<% 
	List<String[]> list = (List<String[]>)request.getAttribute("list");
	if(list==null||list.size()==0){
		response.sendRedirect("index.jsp");
	}
	else{
 %>
<html>
	<head>
		<title>��ƱԤ��</title>
		<link href="css/book.css" type="text/css" rel="stylesheet"/>
		<link href="css/tablestyle.css" type="text/css" rel="stylesheet"/>
	</head>
	<body>
		<div id="wrapper">
		<div id="branding"></div>
		<div id="content" style="height:400px">
			<p id="top">
				<a href="index.jsp">��ҳ</a>>><b>��ƱԤ��</b>
			</p>
			<form action="ManageServlet" method="post">
			<table bgcolor="black" cellspacing="1" border="0" width="90%" align="center" class="default">
			<caption>��&nbsp;<%= session.getAttribute("start") %>&nbsp;��
				&nbsp;<%= session.getAttribute("end") %>&nbsp;�ĳ�������
			</caption>
			<thead>
				<tr bgcolor="#F9F3E6">
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
					<td><a href="<%= request.getContextPath() %>/ManageServlet?action=cccx&train=<%= str[1] %>&flag=1"><%= str[1] %></a></td>
					<td><%= str[2] %></td>
					<td><%= str[3].substring(0,5) %></td>
					<td><%= str[4] %></td>
					<td><%= str[5].substring(0,5) %></td>
					<td><%= str[6] %></td>
					<td>
					<% 
						if(i==0){
							out.println("<input type='radio' name='tname' checked value="+str[1]+" />");
						}
						else{
							out.println("<input type='radio' name='tname' value="+str[1]+" />");
						}
					 %>
					</td>
				</tr>
			<% 
				}
			 %>
			</tbody>
			</table>
			<input type="hidden" name="action" value="book"/>
			<center><br/><input class="btn" type="submit" value="��һ��"/><center>
			</form>
			<br/><br/><br/>
			<center>�������������ĳ����У�ѡ����Ҫ�����ĳ��Σ����ڸó��κ����Ԥ������ѡ�е�ѡ��ť��</center>
		</div>
		</div>
	</body>
</html>
<% 
	}
 %>
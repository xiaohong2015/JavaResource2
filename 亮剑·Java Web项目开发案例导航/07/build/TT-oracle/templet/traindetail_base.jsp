<table class="default" align="center" border="0" bgcolor="black" width="90%" cellspacing="1">
	<caption>
		<%= tname %>���г���������վ����&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="<%= request.getContextPath() %>/ManageServlet?action=book&tname=<%= tname %>">[&nbsp;Ԥ��&nbsp;]</a>
	</caption>
	<thead>
	<tr>
		<th>��վ</th>
		<th>��վʱ��</th>
		<th>����ʱ��</th>
	</tr>
	</thead>
	<tbody>
<% 
	for(int i=0;i<list.size();i++){
		String[] str = list.get(i);
%>
	<tr>
		<td><%= str[0] %></td>
		<td><%= (str[1].length()>6)?str[1].substring(0,5):str[1] %></td>
		<td><%= (str[2].length()>6)?str[2].substring(0,5):str[2] %></td>
	</tr>
<% 
	}
 %>
</tbody>
</table>
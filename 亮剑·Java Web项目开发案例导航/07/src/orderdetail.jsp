<%@ page contentType="text/html;charset=gbk" 
	import="wyf.zrk.TicketItem"
%>
<% 
	List<String[]> ls = (List<String[]>)request.getAttribute("list");
	if(session.getAttribute("user")==null){
		out.println("<script language=\"JavaScript\"> alert(\"�����ȵ�¼������\");"
					+"window.location.href=\"index.jsp\"</script>");
	}
	else{
		if(ls==null||ls.size()==0){
			out.println("<script language=\"JavaScript\"> alert(\"ϵͳ���󣡣���\");"
				+"window.location.href=\"index.jsp\"</script>");
		}
		else{
			String[] str = ls.get(0);
%>
<html>
	<head>
		<title>Ԥ����ϸ</title>
		<link href="css/book.css" type="text/css" rel="stylesheet"/>
	</head>
	<body>
		<div id="wrapper">
		<div id="branding"></div>
		<div id="content" style="height:400px">
			<p id="top">
				<a href="index.jsp">��ҳ</a>>><a href="myorder.jsp">�ҵ�Ԥ��</a>>><b>Ԥ����ϸ</b>
			</p>
			<br/><br/><br/>
			<table width="80%" bgcolor="black" border="0" cellspacing="1">
			<caption>�ҵ�Ԥ�� ��&nbsp;<%= str[9] %>&nbsp;��</caption>
				<tr bgcolor="#EDF2F7" align="center">
					<th>Ԥ��״̬</th>
					<td><%= str[9] %></td>
					<th>����</th>
					<td><%= str[1] %></td>
				</tr>
				<tr bgcolor="#FFFFFF" align="center">
					<th>����վ</th>
					<td><%= str[2] %></td>
					<th>Ŀ��վ</th>
					<td><%= str[3] %></td>
				</tr>
				<tr bgcolor="#EDF2F7" align="center">
					<th>��Ʊ����</th>
					<td><%= str[8] %></td>
					<th>��Ʊ����</th>
					<td><%= str[7] %></td>
				</tr>
				<tr bgcolor="#FFFFFF" align="center">
					<th>��ϵ��</th>
					<td><%= str[4] %></td>
					<th>��ϵ��ַ</th>
					<td><%= str[5] %></td>
				</tr>
				<tr bgcolor="#EDF2F7" align="center">
					<th>��ϵ�绰</th>
					<td><%= str[6] %></td>
					<th></th>
					<td></td>
				</tr>
			</table>			
		</div>
		</div>
	</body>
</html>
<%
		}
	}
 %>






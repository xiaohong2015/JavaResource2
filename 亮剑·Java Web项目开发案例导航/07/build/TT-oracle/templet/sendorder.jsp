<%@ page contentType="text/html;charset=gbk" 
	import="java.util.*"
%>
<%
	List<String[]> ls = (List<String[]>)request.getAttribute("list");
	if(session.getAttribute("admin")==null){
		out.println("<script language=\"JavaScript\"> alert(\"�����ȵ�¼������\");"
					+"window.location.href=\"adminlogin.jsp\"</script>");
	}
	else{
		String[] str = ls.get(0);
%>
<html>
	<head>
		<title>��������</title>
		<link href="css/admin.css" type="text/css" rel="stylesheet" />
	</head>
	<body>
		<div id="wrapper">
			<div id="branding"></div>
			<div id="content">
				<p id="con_title">
					<table border="0" bgcolor="#F9F3E6">
						<tr>
							<td width="80" align="center">
								<a href="<%= request.getContextPath() %>/ManageServlet?action=lookOrder&flag=3">&nbsp;���ж���</a>
							</td>
							<td width="2" align="center"><font color="#F57708" size="4">|</font></td>
							<td width="85" align="center">
								<a href="<%= request.getContextPath() %>/ManageServlet?action=lookOrder&flag=1">δ������</a>
							</td>
							<td width="2" align="center"><font color="#F57708" size="4">|</font></td>
							<td width="85" align="center">
								<a href="<%= request.getContextPath() %>/ManageServlet?action=lookOrder&flag=2">�Ѵ�����</a>
							</td>
						</tr>
					</table>
				</p>
				<p id="con">
				<br/>
				<table width="90%" bgcolor="black" border="0" cellspacing="1" align="center">
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
				<% 
					if(str[9].equals("δ����")){
				 %>
				 <form>
				 <table align="center" border="0"><tr height="50" align="center">
				 	<td>
				 		<input type="button" class="btn" onclick="window.location.href='<%= request.getContextPath() %>/ManageServlet?action=sendOrder&oid=<%= str[0] %>&flag=1'" value="&nbsp;�Ѷ���Ʊ&nbsp;"/>
					</td>
					<td>
						<input type="button" class="btn" onclick="window.location.href='<%= request.getContextPath() %>/ManageServlet?action=sendOrder&oid=<%= str[0] %>&flag=2'" value="&nbspδ����Ʊ&nbsp;" />
					</td>
				</tr></table>
				</form>
				<% 
					}
				 %>
				</p>
			</div>
			<fieldset class="login">
				<legend>����</legend>
				<ul>
					<li><a href="<%= request.getContextPath() %>/ManageServlet?action=lookOrder&flag=1">��������</a></li>
					<li><a href="<%= request.getContextPath() %>/ManageServlet?action=lookAdmin">ϵͳά��</a></li>
					<li><a href="modifypwd.jsp">�޸�����</a></li>
					<li><a href="<%= request.getContextPath() %>/ManageServlet?action=adminLogout">�˳���¼</a></li>
				</ul>
			</fieldset>
 			
			<div id="footer">
				<p><i>��ӭ���ٱ���վ,�������ʲô���ʣ�����ϵ����&nbsp;&nbsp;
					www.zhairuike@yahoo.com.cn
				</i></p>
			</div>			
		</div>
	</body>
</html>
<% 
	}
 %>
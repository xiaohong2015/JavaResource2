<%@ page contentType="text/html;charset=gbk" 
	import="java.util.*"
%>
<%
	List<String[]> ls = (List<String[]>)session.getAttribute("list");
	if(session.getAttribute("admin")==null||session.getAttribute("level")==null){
		out.println("<script language=\"JavaScript\"> alert(\"�����ȵ�¼������\");"
					+"window.location.href=\"adminlogin.jsp\"</script>");
	}
	else if(!((String)session.getAttribute("level")).equals("����")){
		out.println("<script language=\"JavaScript\"> alert(\"��û���㹻��Ȩ�ޣ�����\");"
					+"window.location.href=\"ManageServlet?action=lookOrder&flag=3\"</script>");
	}
	else{
%>
<html>
	<head>
		<title>����Ա����</title>
		<link href="css/admin.css" type="text/css" rel="stylesheet" />
		<link href="css/tablestyle.css" type="text/css" rel="stylesheet" />
		<script language="JavaScript" src="script/trim.js"></script>
 		<script language="JavaScript" src="script/changepage.js"></script>
	</head>
	<body>
		<div id="wrapper">
			<div id="branding"></div>
			<div id="content">
				<p id="con_title">
					<table border="0" bgcolor="#F9F3E6">
						<tr>
							<td width="100" align="center">
								<a href="addadmin.jsp">&nbsp;����Ա���</a>
							</td>
							<td width="2" align="center"><font color="#F57708" size="4">|</font></td>
							<td width="100" align="center">
								<a href="<%= request.getContextPath() %>/ManageServlet?action=lookAdmin">&nbsp;����Աɾ��</a>
							</td>
							<td width="2" align="center"><font color="#F57708" size="4">|</font></td>
							<td width="100" align="center">
								<a href="resetpwd.jsp">��������</a>
							</td>
						</tr>
					</table>
				</p>
				<p id="con">
					<br/>
				<% 
					int size=ls.size();
					if(size==0){
				%>
					<table border="0" align="center"><tr><td><h1>������Ϣ������</h1></td></tr></table>
				<%
					}
					else{
						int totalpage = (Integer)session.getAttribute("totalpage");
						int nowpage = (Integer)session.getAttribute("nowpage");
				 %>
					<table width="90%" border="0" cellspacing="1" align="center" class="default">
						<thead>
						<tr>
							<th width="34%">�û���</th>
							<th width="33%">����</th>
							<th width="33%">ɾ��</th>
						</tr>
						</thead>
						<tbody>
					<% 
						for(int i=0;i<size;i++){
							String[] str = ls.get(i);
					%>
						<tr>
							<td><%= str[1] %></td>
							<td><%= str[2] %></td>
							<% 
								if(str[2].equals("����")){
									out.println("<td>--</td>");
								}
								else{
							 %>
							<td><img src="images/del.gif" /><a href="<%= request.getContextPath() %>/ManageServlet?action=delAdmin&aid=<%= str[0] %>">ɾ��</a></td>
							<% 
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
					      <a href="<%= request.getContextPath() %>/ManageServlet?action=changePage&pagename=/adminmanage.jsp&page=<%= nowpage-1 %>"><img src="images/pre.gif" border="0"/></a>
					      <% 
					      	}
					      	if(nowpage<totalpage){
					       %>	       
					      <a href="<%= request.getContextPath() %>/ManageServlet?action=changePage&pagename=/adminmanage.jsp&page=<%= nowpage+1 %>"><img src="images/next.gif" border="0"/></a>
					      <% 
					      	}
					      	else{
					      		out.println("<img src='images/next.gif' style='visibility:hidden'/>");
					      	}
					       %>
					      <font size="2">��<input name="page" id="page" size="2" value="<%= nowpage %>" onfocus="document.all.page.value=''"/>ҳ</font>
					      <input type="hidden" name="action" value="changePage" />
					      <input type="hidden" name="pagename" value="/adminmanage.jsp"/>
					    </td>
					    <td width="10">
					      <img src="images/go.gif" border="0" style="cursor:hand" onclick="JavaScript:checkPage(<%= totalpage %>)">
					    </td>
					  </tr>	
					</form>
					</table>
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
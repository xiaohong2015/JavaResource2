<%@ page contentType="text/html;charset=gbk" 
	import="java.util.*"
%>
<%
	List<String[]> ls = (List<String[]>)session.getAttribute("list");
	if(session.getAttribute("admin")==null||session.getAttribute("level")==null){
		out.println("<script language=\"JavaScript\"> alert(\"请您先登录！！！\");"
					+"window.location.href=\"adminlogin.jsp\"</script>");
	}
	else{
%>
<html>
	<head>
		<title>密码修改</title>
		<link href="css/admin.css" type="text/css" rel="stylesheet" />
		<script language="JavaScript" src="script/trim.js"></script>
 		<script language="JavaScript" src="script/changepage.js"></script>
 		<script language="JavaScript" src="script/general.js"></script>
 		<script language="JavaScript" src="script/modifypwd.js"></script>
	</head>
	<body>
		<div id="wrapper">
			<div id="branding"></div>
			<div id="content">
				<p id="con_title">
					<table border="0" bgcolor="#F9F3E6">
						<tr>
							<td width="100" align="center">
								<a href="modifypwd.jsp">&nbsp;密码修改</a>
							</td>
						</tr>
					</table>
				</p>
				<p id="con">
					<br/>
					<form action="ManageServlet" method="post" name="mf_pwd">
					<table border="0" width="60%" align="center">
						<tr>
							<td align="right">用户名：</td>
							<td><%= (String)session.getAttribute("admin") %></td>
						</tr>
						<tr>
							<td align="right">旧密码：</td>
							<td><input type="password" name="oldpwd" id="oldpwd" /></td>
						</tr>
						<tr>
							<td align="right">新密码：</td>
							<td><input type="password" name="first" id="first" /></td>
						</tr>
						<tr>
							<td align="right">再次输入新密码：</td>
							<td><input type="password" name="second" id="second" /></td>
						</tr>
						<tr>
							<td colspan="2" align="center"><br/>
							<input type="hidden" name="action" value="modAdminPwd" />
							<input type="button" value="&nbsp;确&nbsp;认&nbsp;" class="btn" onclick="JavaScript:checkPwd()" />
							<input type="button" value="&nbsp;重&nbsp;置&nbsp;" class="btn" />
							</td>
						</tr>
					</table>
					</form>
				</p>
			</div>
			<fieldset class="login">
				<legend>导航</legend>
				<ul>
					<li><a href="<%= request.getContextPath() %>/ManageServlet?action=lookOrder&flag=1">订单管理</a></li>
					<li><a href="<%= request.getContextPath() %>/ManageServlet?action=lookAdmin">系统维护</a></li>
					<li><a href="modifypwd.jsp">修改密码</a></li>
					<li><a href="<%= request.getContextPath() %>/ManageServlet?action=adminLogout">退出登录</a></li>
				</ul>
			</fieldset>
 			
			<div id="footer">
				<p><i>欢迎光临本网站,如果您有什么疑问，请联系我们&nbsp;&nbsp;
					www.zhairuike@yahoo.com.cn
				</i></p>
			</div>
			<%@ include file="tip.jsp" %>
		</div>
	</body>
</html>
<% 
	}
 %>
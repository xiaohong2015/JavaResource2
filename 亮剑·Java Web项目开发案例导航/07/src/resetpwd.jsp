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
					+"window.location.href=\"ordermanage.jsp\"</script>");
	}
	else{
%>
<html>
	<head>
		<title>��������</title>
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
					<form action="ManageServlet" method="post" name="mf_reset">
					<table border="0" width="60%" align="center">
						<tr>
							<td align="right">�û�����</td>
							<td><input name="aname" id="aname" /></td>
						</tr>
						<tr>
							<td align="right">�����룺</td>
							<td><input type="password" name="first" id="first" /></td>
						</tr>
						<tr>
							<td align="right">�ٴ����������룺</td>
							<td><input type="password" name="second" id="second" /></td>
						</tr>
						<tr>
							<td colspan="2" align="center"><br/>
							<input type="hidden" name="action" value="resetPwd" />
							<input type="button" value="&nbsp;ȷ&nbsp;��&nbsp;" class="btn" onclick="JavaScript:check()" />
							<input type="button" value="&nbsp;��&nbsp;��&nbsp;" class="btn" />
							</td>
						</tr>
					</table>
					</form>
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
			<%@ include file="tip.jsp" %>
		</div>
	</body>
</html>
<% 
	}
 %>
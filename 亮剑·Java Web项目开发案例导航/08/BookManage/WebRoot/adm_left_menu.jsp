<%@ page contentType="text/html;charset=gbk"%>
<jsp:useBean id="status" class="wyf.wyy.StatusBean" scope="session"/>
<html>
	<head>
		<link href="images/div.css" type="text/css" rel=stylesheet>
	</head>
	<body>		
		<div id="Nav">		
			<ul>
				<li><a href="admin_manage.jsp">�޸�����</a></li><!-- cp changePWD -->
				<li><a href="ManageServlet?action=befor_aa">��ӹ���Ա</a></li><!-- aa addAdmin -->
				<li><a href="ManageServlet?action=befor_rp">��������</a></li><!-- reset admin_pwd -->
				<li><a href="ManageServlet?action=befor_la">����Ա�б�</a></li>			
			</ul>
		</div>
	</body>
</html>
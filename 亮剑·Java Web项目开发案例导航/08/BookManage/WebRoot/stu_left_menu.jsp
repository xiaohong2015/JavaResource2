<%@ page contentType="text/html;charset=gbk"%>
<jsp:useBean id="status" class="wyf.wyy.StatusBean" scope="session"/>
<html>
	<head>
		<link href="images/div.css" type="text/css" rel=stylesheet>
	</head>
	<body>		
		<div id="Nav">		
			<ul>
				<li><a href="StudentServlet?action=cb">��ǰ����</a></li>
				<li><a href="StudentServlet?action=bh">��ʷ����</a></li>
				<li><a href="StudentServlet?action=lb">ͼ�鶪ʧ</a></li>
				<li><a href="StudentServlet?action=fk">�����¼</a></li>
				<li><a href="StudentServlet?action=cf">Ƿ��״̬</a></li>
				<li><a href="lost_card.jsp">���߹�ʧ</a></li>				
			</ul>
		</div>
	</body>
</html>
<%@ page contentType="text/html;charset=gbk"%>
<%@ page import="java.util.*"%>
<html>
	<head>
		<script language="JavaScript" src="images/trim.js"></script>
		<link href="images/div.css" type="text/css" rel=stylesheet>
		<link href="images/globalstyle.css" type="text/css" rel=stylesheet>
		<script language="JavaScript">
			function checkPwd(){
				var pwd = document.card.pwd.value;
				if(pwd==""){
					alert("���벻��Ϊ�գ�����");
					return;
				}
				if(pwd.trim()<6){
					alert("���벻�ܰ����ո��ҳ��Ȳ���С��6λ");
					return;
				}
				document.card.submit();
			}
		</script>
	</head>
	<body>
		<div id="Menu">
			<%@ include file="stu_left_menu.jsp" %>
		</div>
		<div id="info_table">
			<center><br><br><font color="red">��ʧ��ͼ��֤����ʹ�ã���Ҫ����Ա���ܽ����ʧ״̬��</font>
			<br/><br/>ȷ��Ҫ��ʧ��
			���������룺
			<table border="0">		
			<form name="card" action="StudentServlet" method="post">
				<tr>
					<td><input type="password" name="pwd"/></td>
					<td>
						<img src="images/qda.gif" id="qd" onclick="checkPwd()" 
							onmouseover="document.all.qd.src='images/qdb.gif'"
						 	onmouseout="document.all.qd.src='images/qda.gif'"
						  	onmousedown="document.all.qd.src='images/qdc.gif'"
						   	style="cursor:hand"/>
						<input type="hidden" name="action" value="gs">
					</td>
				</tr>		
			</form>
			</table>
			<% 
				String message = (String)request.getAttribute("message");
				String stuName = (String)session.getAttribute("stuName");
				if(message!=null){
			%>
				<%= stuName %>������֤<%= message %>
			<%
				}
			%>
			</center>
		</div> 
	</body>
</html>
<%@ page contentType="text/html;charset=gbk"%>
<html>
	<head>
		<link href="images/div.css" type="text/css" rel=stylesheet>
		<script language="JavaScript" src="images/trim.js"></script>
		<script language="JavaScript">
			function checkBorrow(){
				var stuNO = document.borrow.stuNO.value;
				var bNO = document.borrow.bNO.value;
				var reg = /^\d*$/;
				if(stuNO.trim()==""){
					alert("ѧ��ѧ�Ų���Ϊ�գ�����");
					return;
				}
				if(!reg.test(stuNO)){
					alert("ѧ�Ÿ�ʽ����");
					return;
				}
				if(bNO.trim()==""){
					alert("ͼ���Ų���Ϊ�գ�����");
					return;
				}
				if(!reg.test(bNO)){
					alert("ͼ���źŸ�ʽ����");
					return;
				}				
				document.borrow.submit();
			}
		</script>
	</head>
	<body>
		<div id="Menu">
			<%@ include file="borrow_left_menu.jsp" %>
		</div>		
		<div id="info_table">
			<center><br><br><font size="4">ͼ�����</center>
			<form name="borrow" action="ManageServlet" method="post">
				<input type="hidden" name="action" value="borrow_book">
				<table align="center">
					<tr>
						<td align="right">������ѧ�ţ�</td>
						<td><input type="text" name="stuNO"/></td>
					</tr>
					<tr>
						<td align="right">������ͼ���ţ�</td>
						<td><input type="text" name="bNO"></td>
					</tr>
					<tr>
						<td></td>
						<td align="right">
						<!-- <input type="button" value="�ύ" onclick="checkBorrow()"> -->	
						<img src="images/tjaa.gif" id="tja" onclick="checkBorrow()" 
							onmouseover="document.all.tja.src='images/tjbb.gif'"
						 	onmouseout="document.all.tja.src='images/tjaa.gif'"
						  	onmousedown="document.all.tja.src='images/tjcc.gif'"
						   	style="cursor:hand"/>
						</td>
					</tr>
					<% 
						String message = (String)request.getAttribute("message");
						if(message!=null){
					%>
					<tr>
						<td colspan="2"><center><font color="red" size="3">
							<%= message %></center>
						</font></td>
					</tr>
					<%
						}
					 %>
				</table>
			</form>
		</div>
	</body>
</html>
<%@ page contentType="text/html;charset=gbk"%>
<html>
	<head>
		<link href="images/div.css" type="text/css" rel=stylesheet>
		<script language="JavaScript" src="images/trim.js"></script>
		<script language="JavaScript" src="images/add_admin.js"></script>
	</head>
	<body>
		<div id="Menu">
			<%@ include file="adm_left_menu.jsp" %>
		</div>
		<div id="info_table">			
			<div id="ad_manage"><font size="4"><center>��ӹ���Ա			
			<form name="addAdmin" action="ManageServlet" method="post">
			<table>
				<tr>
					<td align="right">����ԱID��</td>
					<td align="left">
						<input name="adID" type="text" size="20">
					</td>
				</tr>
				<tr>
					<td align="right">����Ա���룺</td>
					<td align="left">
						<input name="adPwd" type="password" size="20">
					</td>
				</tr>
				<tr>
					<td></td>
					<td>
						<!--<input type="button" value="���" onclick="checkAddAdmin()"/>  -->
						<img src="images/tja.gif" id="tj" onclick="checkAddAdmin()" 
								onmouseover="document.all.tj.src='images/tjb.gif'"
							 	onmouseout="document.all.tj.src='images/tja.gif'"
							  	onmousedown="document.all.tj.src='images/tjc.gif'"
							   	style="cursor:hand"/>&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="hidden" name="action" value="addAdmin"/>
						<!--	<input type="reset" value="���"/>  -->
						<img src="images/qka.gif" id="qk" onclick="reset()" 
								onmouseover="document.all.qk.src='images/qkb.gif'"
							 	onmouseout="document.all.qk.src='images/qka.gif'"
							  	onmousedown="document.all.qk.src='images/qkc.gif'"
							   	onmouseup="document.all.qk.src='images/qkb.gif'"
							  	style="cursor:hand" >
					</td>
				</tr>
				<%
					String message = (String)request.getAttribute("message");
					if(message!=null){
				%>
				<tr>
					<td colspan="10">
						<font color="red" size="3">
							<center><%= message %></center></font>
					</td>
				</tr>
				<%
					}
				%>		
			</table>
			</form>
			</div>
		</div>
	</body>
</html>
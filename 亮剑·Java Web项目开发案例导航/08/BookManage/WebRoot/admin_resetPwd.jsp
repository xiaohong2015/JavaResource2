<%@ page contentType="text/html;charset=gbk"%>
<html>
	<head>
		<link href="images/div.css" type="text/css" rel=stylesheet>
		<script language="JavaScript" src="images/trim.js"></script>
		<script language="JavaScript">
			function checkReset(){
				var adID = document.resetPwd.adID.value;
				var adPwd = document.resetPwd.adPwd.value;
				if(adID.trim()==""){
					alert("����Ա������Ϊ�գ�����");
					return;
				}
				if(adPwd.trim().length<6){
					alert("����Ա���벻�ð����ո��ҳ��Ȳ���С��6");
					return;
				}
				document.resetPwd.submit();
			}
		</script>
	</head>
	<body>
		<div id="Menu">
			<%@ include file="adm_left_menu.jsp" %>
		</div>
		<div id="info_table">			
			<div id="ad_manage"><font size="4"><center>��������			
			<form name="resetPwd" action="ManageServlet" method="post">
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
						<input name="adPwd" type="text" size="20">
					</td>
				</tr>
				<tr>
					<td></td>
					<td>
						<!-- <input type="button" value="�ύ" onclick="checkReset()"/> -->
						<img src="images/tjaa.gif" id="tja" onclick="checkReset()" 
								onmouseover="document.all.tja.src='images/tjbb.gif'"
							 	onmouseout="document.all.tja.src='images/tjaa.gif'"
							  	onmousedown="document.all.tja.src='images/tjcc.gif'"
							   	style="cursor:hand"/>&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="hidden" name="action" value="reset_admin_pwd"/>
						<!-- <input type="reset" value="���"/> -->
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
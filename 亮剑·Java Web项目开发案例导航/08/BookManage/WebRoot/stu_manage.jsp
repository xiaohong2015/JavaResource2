<%@ page contentType="text/html;charset=gbk"%>
<html>
	<head>
		<link href="images/div.css" type="text/css" rel=stylesheet>
		<script language="JavaScript" src="images/trim.js"></script>
		<script language="JavaScript" src="images/add_stu.js"></script>
	</head>
	<body>
		<div id="Menu">
			<%@ include file="stum_left_menu.jsp" %>
		</div>		
		<div id="info_table"><br>			
			<div id="stuInfo"><br><br><font size="3">���ѧ��<br><br>
				<form name="addStu" action="ManageServlet" method="post">
					<table border="0" align="center">
						<tr>
							<td align="right">ѧ�ţ�</td>
							<td><input type="text" name="stuNO"></td>
						</tr>
						<tr>
							<td align="right">������</td>
							<td><input type="text" name="stuName"></td>
						</tr>
						<tr>
							<td align="right">���䣺</td>
							<td><input type="text" name="age"></td>							
						</tr>
						<tr>
							<td align="right">�Ա�</td>
							<td>
								<input type="radio" name="gender" value="��" checked="true">��
								<input type="radio" name="gender" value="Ů">Ů
							</td>
						</tr>
						<tr>
							<td align="right">�༶��</td>
							<td><input type="text" name="stuClass"></td>
						</tr>
						<tr>
							<td align="right">ϵ��</td>
							<td><input type="text" name="dep"></td>
						</tr>
						<tr>
							<td><input type="hidden" name="action" value="add_stu"></td>
							<td>
								<!-- <input type="button" value="���" onclick="checkAddStu()"> -->
								<img src="images/tja.gif" id="tj" onclick="checkAddStu()" 
									onmouseover="document.all.tj.src='images/tjb.gif'"
								 	onmouseout="document.all.tj.src='images/tja.gif'"
								  	onmousedown="document.all.tj.src='images/tjc.gif'"
								   	style="cursor:hand"/>&nbsp;&nbsp;&nbsp;&nbsp;
								<!-- <input type="reset" value="����"> -->
								<img src="images/qka.gif" id="qk" onclick="reset()" 
									onmouseover="document.all.qk.src='images/qkb.gif'"
								 	onmouseout="document.all.qk.src='images/qka.gif'"
								  	onmousedown="document.all.qk.src='images/qkc.gif'"
								   	onmouseup="document.all.qk.src='images/qkb.gif'"
								  	style="cursor:hand" >
							</td>
						</tr>
					</table>
				</form>
			<% 
				String message = (String)request.getAttribute("message");
				if(message!=null){
			%>
				<center><font color="red" size="3"><%= message %></font></center>
			<%
				}
			 %>
			</div>
			<div id="message">��ʾ��<br><br>
				<li>����ѧ����Ϣ��������д</li><br><br>
				<li>ѧ�ź�����ӦΪ������ɣ����ð��������ַ�</li><br><br>
				<li>���ѧ����ѧ���Ľ���Ȩ��Ĭ��Ϊ���Խ���</li><br><br>
				<li>���ѧ��ʱ��ѧ���ĵ�¼����Ĭ��Ϊѧ��ѧ��</li><br><br>				
			</div>
		</div>
	</body>
</html>
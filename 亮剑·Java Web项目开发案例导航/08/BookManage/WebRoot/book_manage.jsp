<%@ page contentType="text/html;charset=gbk"%>
<html>
	<head>
		<link href="images/div.css" type="text/css" rel=stylesheet>
		<script language="JavaScript" src="images/trim.js"></script>
		<script language="JavaScript" src="images/add_book.js"></script>
	</head>
	<body>
		<div id="Menu">
			<%@ include file="book_left_menu.jsp" %>
		</div>		
		<div id="info_table"><br>			
			<div id="stuInfo"><br><br><font size="3">���ͼ��<br><br>
				<form name="addBook" action="ManageServlet" method="post">
					<table border="0" align="center">
						<tr>
							<td align="right">ͼ����</td>
							<td><input type="text" name="bNO"></td>
						</tr>
						<tr>
							<td align="right">ͼ������</td>
							<td><input type="text" name="bName"></td>
						</tr>
						<tr>
							<td align="right">���ߣ�</td>
							<td><input type="text" name="author"></td>							
						</tr>
						<tr>
							<td align="right">������</td>
							<td><input type="text" name="publish"></td>
						</tr>
						<tr>
							<td align="right">ISBN��</td>
							<td><input type="text" name="isbn"></td>
						</tr>
						<tr>
							<td align="right">�۸�</td>
							<td><input type="text" name="price"></td>
						</tr>
						<tr>
							<td><input type="hidden" name="action" value="add_book"></td>
							<td>
								<!-- <input type="button" value="���" onclick="checkAddBook()"> -->
								<img src="images/tja.gif" id="tj" onclick="checkAddBook()" 
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
				<li>����ͼ����Ϣ��������д</li><br><br>
				<li>ͼ���ź�ISBN��ӦΪ������ɣ����ð��������ַ�</li><br><br>
				<li>���ͼ���ͼ��Ĺ���ʱ��Ĭ��Ϊ��ǰ���ڣ�״̬Ϊ�ڹ�</li><br><br>				
			</div>
		</div>
	</body>
</html>
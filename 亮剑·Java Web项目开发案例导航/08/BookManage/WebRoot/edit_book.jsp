<%@ page contentType="text/html;charset=gbk"%>
<%@ page import="java.util.*" %>
<html>
	<head>
		<link href="images/div.css" type="text/css" rel=stylesheet>
		<script language="JavaScript" src="images/trim.js"></script>
		<script language="JavaScript" src="images/edit_book.js"></script>		
	</head>
	<body>
	<% 
		Vector<Vector<String>> vtemp = 
				(Vector<Vector<String>>)request.getAttribute("v");
		Vector<String> v = vtemp.get(0);	//�õ�ͼ����Ϣ
	 %>
		<div id="Menu">
			<%@ include file="book_left_menu.jsp" %>
		</div>
		<div id="info_table">
			<div id="stuInfo"><br><br><font size="3">�޸�ͼ����Ϣ<br><br>
				<form name="editBook" action="ManageServlet" method="post">
					<table border="0" align="center">
						<tr>
							<td align="right">ͼ���ţ�</td>
							<td><input type="text" name="newNO" value="<%=v.get(0)%>"></td>
						</tr>
						<tr>
							<td align="right">ͼ�����ƣ�</td>
							<td><input type="text" name="bName" value="<%=v.get(1)%>"></td>
						</tr>
						<tr>
							<td align="right">���ߣ�</td>
							<td><input type="text" name="author" value="<%=v.get(2)%>"></td>							
						</tr>
						<tr>
							<td align="right">�����磺</td>
							<td><input type="text" name="publish" value="<%=v.get(3)%>"></td>
						</tr>
						<tr>
							<td align="right">ISBN�ţ�</td>
							<td><input type="text" name="isbn" value="<%=v.get(4)%>"></td>
						</tr>
						<tr>
							<td align="right">�۸�</td>
							<td><input type="text" name="price" value="<%=v.get(6)%>"></td>
						</tr>
						<tr>
							<td><input type="hidden" name="action" value="save_book">
							<input type="hidden" name="bNO" value="<%=v.get(0)%>"></td>
							<td>
								<!--<input type="button" value="����" onclick="checkEditBook()">  -->
								<img src="images/bca.gif" id="bc" onclick="checkEditBook()" 
									onmouseover="document.all.bc.src='images/bcb.gif'"
								 	onmouseout="document.all.bc.src='images/bca.gif'"
								  	onmousedown="document.all.bc.src='images/bcc.gif'"
								   	style="cursor:hand"/>&nbsp;&nbsp;&nbsp;&nbsp;
								<!-- <input type="reset" value="����"> -->
								<img src="images/cza.gif" id="cz" onclick="reset()" 
									onmouseover="document.all.cz.src='images/czb.gif'"
								 	onmouseout="document.all.cz.src='images/cza.gif'"
								  	onmousedown="document.all.cz.src='images/czc.gif'"
								   	onmouseup="document.all.cz.src='images/czb.gif'"
								  	style="cursor:hand" >	
							</td>
						</tr>
						<tr>
						<% 
							String message = (String)request.getAttribute("message");
							if(message!=null){
						%><br>
							<td colspan="2"><center><font color="red" size="2.5">
								<%= message %></center></td>
						<%
							}
						%>
						</tr>						
					</table>
				</form>
			</div>
			<div id="message">��ʾ��<br><br>
				<li>����ͼ����Ϣ��������д</li><br><br>
				<li>ͼ���ź�ISBN��ӦΪ������ɣ����ð��������ַ�</li><br><br>
				<li>���ͼ���ͼ��Ĺ���ʱ��Ĭ��Ϊ��ǰ���ڣ�״̬Ϊ�ڹ�</li><br><br>					
			</div>
		</div>
	</body>
</html>
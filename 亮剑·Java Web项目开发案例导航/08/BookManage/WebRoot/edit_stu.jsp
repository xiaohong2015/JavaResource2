<%@ page contentType="text/html;charset=gbk"%>
<%@ page import="java.util.*" %>
<html>
	<head>
		<link href="images/div.css" type="text/css" rel=stylesheet>
		<script language="JavaScript" src="images/trim.js"></script>
		<script language="JavaScript" src="images/edit_stu.js"></script>		
	</head>
	<body>
	<% 
		Vector<String> stu = (Vector<String>)request.getAttribute("student");
	 %>
		<div id="Menu">
			<%@ include file="stum_left_menu.jsp" %>
		</div>
		<div id="info_table">
			<div id="stuInfo"><br><br><font size="3">�޸�ѧ����Ϣ<br><br>
				<form name="editStu" action="ManageServlet" method="post">
				<table border="0">
				<tr>
					<td align="right">ѧ�ţ�</td>
					<td>
						<input type="text" name="newNO" value="<%=stu.get(0)%>">
					</td>
				</tr>
				<tr>
					<td align="right">������</td>
					<td>
						<input type="text" name="stuName" value="<%=stu.get(1)%>">
					</td>
				</tr>
				<tr>
					<td align="right">���䣺</td>
					<td>
						<input type="text" name="age" value="<%=stu.get(2)%>">
					</td>
				</tr>
				<tr>
					<td align="right">�Ա�</td>
					<td>
					<%
						if(stu.get(3).equals("��")){
					%>
						<input type="radio" name="gender" value="��" checked="true">��
						<input type="radio" name="gender" value="Ů">Ů
					<%
						}
						else{
					%>
						<input type="radio" name="gender" value="��">��
						<input type="radio" name="gender" value="Ů" checked="true">Ů
					<%
						}
					 %>
						
					</td>
				</tr>
				<tr>
					<td align="right">�༶��</td>
					<td>
						<input type="text" name="stuClass" value="<%=stu.get(4)%>">
					</td>
				</tr>
				<tr>
					<td align="right">ϵ��</td>
					<td>
						<input type="text" name="dep" value="<%=stu.get(5)%>">
					</td>
				</tr>
				<tr>
					<td align="right">����Ȩ�ޣ�</td>
					<td>
						<select name="per">
					<% 
								if(stu.get(6).equals("1")){
					%>
								<option value="1" selected>���Խ���</option>
								<option value="0">���ɽ���</option>
					<%
								}
								else{
					%>
								<option value="1">���Խ���</option>
								<option value="0" selected>���ɽ���</option>
					<%
								}
					%>								
						</select>
					</td>
				</tr>
				<tr>
					<td>
						<input type="hidden" name="action" value="save_stu">
						<input type="hidden" name="stuNO" value="<%=stu.get(0)%>">						
					</td>					
					<td>
						<!-- <input type="button" value="����" onclick="checkEditStu()"> -->
						<img src="images/bca.gif" id="bc" onclick="checkEditStu()" 
								onmouseover="document.all.bc.src='images/bcb.gif'"
							 	onmouseout="document.all.bc.src='images/bca.gif'"
							  	onmousedown="document.all.bc.src='images/bcc.gif'"
							   	style="cursor:hand"/>&nbsp;&nbsp;&nbsp;&nbsp;
						<!--<input type="reset" value="����">  -->
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
				<li>�޸�ѧ����Ϣ��������д</li><br><br>
				<li>ѧ�ź�����ӦΪ������ɣ����ð��������ַ�</li><br><br>
				<li>ѧ������ɲ鿴�������޸�</li><br><br>
				<li>�������Υ�棬������޸�ѧ���Ľ���Ȩ��</li><br><br>				
			</div>
		</div>
	</body>
</html>
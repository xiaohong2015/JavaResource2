<%@ page contentType="text/html;charset=gbk"%>
<%@ page import="java.util.*;"%>
<html>
	<head>
		<link href="images/div.css" type="text/css" rel=stylesheet>
		<script language="JavaScript" src="images/trim.js"></script>
		<script language="JavaScript" src="images/stuChangePwd.js"></script>
	</head>
	<body>
		<% Vector<String> stu = (Vector<String>)request.getAttribute("student"); %>
		<div id="father">
			<div id="stuInfo">
				<%= stu.get(1) %>�����ã����ĸ�����Ϣ���£�
				<ul>
				<table><!-- ��ʾѧ����Ϣ��� -->
					<tr>
						<td align="right">ѧ�ţ�</td>
						<td align="left"><%= stu.get(0) %></td>
					</tr>
					<tr>
						<td align="right">������</td>
						<td align="left"><%= stu.get(1) %></td>
					</tr>
					<tr>
						<td align="right">���䣺</td>
						<td align="left"><%= stu.get(2) %></td>
					</tr>
					<tr>
						<td align="right">�Ա�</td>
						<td align="left"><%= stu.get(3) %></td>
					</tr>
					<tr>
						<td align="right">�༶��</td>
						<td align="left"><%= stu.get(4) %></td>
					</tr>
					<tr>
						<td align="right">ѧԺ��</td>
						<td align="left"><%= stu.get(5) %></td>
					</tr>
					<tr>
						<td align="right">Ȩ�ޣ�</td>
						<td align="left">
						<%	
							if(stu.get(6).equals("1")){
						%>
							 <font color="red" size="3">���Խ���</font>
						<%
							}
							else{
						%>
							 <font color="red" size="3">���ɽ���</font>
						<%
							}
						%>
						</td>
					</tr>
				</table></ul>
				<table><!-- �޸������ -->
					<form name="stuChangePwd" action="StudentServlet" method="post">
						<tr>
							<td align="right">����������룺</td>
							<td align="left">
								<input name="oldPwd" type="password" size="20">
							</td>
						</tr>
						<tr>
							<td align="right">�����������룺</td>
							<td align="left">
								<input name="newPwd" type="password" size="20">
							</td>
						</tr>
						<tr>
							<td align="right">�ٴ����������룺</td>
							<td align="left">
								<input name="newPwdAgain" type="password" size="20">
							</td>
						</tr>
						<tr>
							<td></td>
							<td>
								<!-- <input type="button" value="�޸�" onclick="checkStuChangePwd()"/> -->
								<img src="images/xga.gif" id="xg" onclick="checkStuChangePwd()" 
									onmouseover="document.all.xg.src='images/xgb.gif'"
								 	onmouseout="document.all.xg.src='images/xga.gif'"
								  	onmousedown="document.all.xg.src='images/xgc.gif'"
								   	style="cursor:hand"/>&nbsp;&nbsp;
								<input type="hidden" name="action" value="stuChangePwd"/>
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
								<font color="red" size="2"><%= message %></font>
							</td>
						</tr>
						<%
							}
						%>					
					</form>
				</table>
			</div>
			<div id="message">
			  �����������Բ鿴�Լ��Ļ������ϣ��������޸����룬�����ʽӦ��������Ҫ��
	 		  <ul>
		 		  <li>����λ������С��6λ</li>
		 		  <li>����ֻ������ĸ���������</li>
		 		  <li>��ò�Ҫʹ���������ա��绰�������Ϊ����</li>		      
	 		  </ul>
	 		  ��ܰ��ʾ���뱣����������룬��������������ѧ��֤ȥ������ѯ��
			</div>
		</div>
	</body>
</html>
<%@ page contentType="text/html;charset=gbk"%>
<%@ page import="java.util.*" %>
<html>
 <head>
 	<link href="images/div.css" type="text/css" rel=stylesheet>
 	<link href="images/globalstyle.css" type="text/css" rel=stylesheet>
	<script language="JavaScript" src="images/trim.js"></script>
	<script language="JavaScript" src="images/adminLogin.js"></script>
 </head>
 <body>
 	<div id="father">
 		<div id="loginform">
 			<%
 			 String adName = (String)session.getAttribute("adName"); //�õ���ǰ��½��ѧ��ѧ��
             if(adName==null){
          	%>
            ��½����ϵͳ
			<form name="login" action="ManageServlet" method="post">
				<table>
					<tr>
						<td align="right">�û�����</td>
						<td align="left"><input type="text" name="uname"/><br></td>
					</tr>
					<tr>
						<td align="right">��&nbsp;&nbsp;&nbsp;&nbsp;�룺</td>
						<td align="left"><input type="password" name="pwd"><br></td>
					</tr>
					<tr>
						<td></td>						
						<td align="center">
						<input type="hidden" name="action" value="login">
						<!-- <input type="button" value="��½" onclick="checkAdmin()"/> -->
						<img src="images/dla.gif" id="dl" onclick="checkAdmin()" 
							onmouseover="document.all.dl.src='images/dlb.gif'"
						 	onmouseout="document.all.dl.src='images/dla.gif'"
						  	onmousedown="document.all.dl.src='images/dlc.gif'"
						   	style="cursor:hand"/>&nbsp;&nbsp;&nbsp;&nbsp;						
						<!-- <input type="reset" value="����"/> -->
						<img src="images/cza.gif" id="cz" onclick="reset()" 
							onmouseover="document.all.cz.src='images/czb.gif'"
						 	onmouseout="document.all.cz.src='images/cza.gif'"
						  	onmousedown="document.all.cz.src='images/czc.gif'"
						   	onmouseup="document.all.cz.src='images/czb.gif'"
						  	style="cursor:hand" >						
						</td>
					</tr>
					<%
						String message = (String)request.getAttribute("message");
						if(message!=null){
					%>
					<tr>
						<td colspan="2">
							<font color="red" size="2"><%= message %></font>
						</td>
					</tr>
					<%
						}
					%>
				</table>
			</form>
          	<%
             }
             else{
             	out.println(adName+"�����ã�<br/><br/>��ӭ��������ϵͳ!!!");
             	out.println("<br/><br/><a href='ManageServlet?action=adManage' target=");
             	out.println("'bottomFrame'>���˺�ά����</a>");
             	out.println("<a href='ManageServlet?action=logout'>��ע����</a>");
             }
 			%>
 		</div>
 		<div id="message">
 		 ��ʾ��
 		  <ul>
	 		  <li>����Ա���û����������ɳ�������Ա����</li><br><br>
	 		  <li>��������룬��Ҫ���κ���͸¶����</li><br><br>
	 		  <li>��½����ϵͳ���޸�����</li><br><br>
	 		  <li>����������������Ч֤������������Ա��ȡ��</li>
 		  </ul>
 		</div>
 	</div>
 </body>
</html>
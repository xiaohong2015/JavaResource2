<%@ page contentType="text/html;charset=gbk"%>
<%@ page import="java.util.*" %>
<html>
 <head>
 	<link href="images/div.css" type="text/css" rel=stylesheet>
	<link href="images/globalstyle.css" type="text/css" rel=stylesheet>
	<script language="JavaScript" src="images/trim.js"></script>
	<script language="JavaScript" src="images/stuLogin.js"></script>
 </head>
 <body>
 	<div id="father">
 		<div id="loginform">
 			<%
 			 String stuName= (String)session.getAttribute("stuName"); //�õ���ǰ��½��ѧ��ѧ��
             if(stuName==null){
          	%>
            ��½�ҵ�ͼ���
			<form name="login" action="StudentServlet" method="post">
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
						<td>
						<input type="hidden" name="action" value="login">
						<!-- <input type="button" value="��½" onclick="checkUser()"/> -->
						<img src="images/dla.gif" id="dl" onclick="checkUser()" 
							onmouseover="document.all.dl.src='images/dlb.gif'"
						 	onmouseout="document.all.dl.src='images/dla.gif'"
						  	onmousedown="document.all.dl.src='images/dlc.gif'"
						  	style="cursor:hand" >&nbsp;&nbsp;&nbsp;&nbsp;					
						<!--	<input type="reset" value="����"/></td>  -->
						<img src="images/cza.gif" id="cz" onclick="reset()" 
							onmouseover="document.all.cz.src='images/czb.gif'"
						 	onmouseout="document.all.cz.src='images/cza.gif'"
						  	onmousedown="document.all.cz.src='images/czc.gif'"
						   	onmouseup="document.all.cz.src='images/czb.gif'"
						  	style="cursor:hand" >
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
             	out.println(stuName+"�����ã�<br/><br/>��ӭ����ͼ���!!!");
             	out.println("<br/><br/><a href='StudentServlet?action=stuInfo' target='bottomFrame'>���鿴/�޸ĸ�����Ϣ��</a>");
             	out.println("<a href='StudentServlet?action=logout'>��ע����</a>");             	
             }
 			%>
 		</div>
 		<div id="message">
 		 ��ʾ��
 		  <ul>
	 		  <li>���ߵ�½�û���Ϊѧ��֤��</li>
	 		  <li>�����ĳ�ʼ�������������������
	 		  	<ol>
		 		  	<li>����ѧ��֤��</li>
		 		  	<li>����֤�ϵ����κ�</li>
		 		</ol>
	 		  </li>
	 		  <li>��½����ϵͳ���޸�����</li>
	 		  <li>��������룬��������������ѧ��֤������ȡ��</li>
 		  </ul>
 		</div>
 	</div>
 </body>
</html>
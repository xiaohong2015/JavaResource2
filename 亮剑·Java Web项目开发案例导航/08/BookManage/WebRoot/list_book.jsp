<%@ page contentType="text/html;charset=gbk"%>
<%@ page import="java.util.*"%>
<html>
	<head>
		<link href="images/div.css" type="text/css" rel=stylesheet>
		<link href="images/globalstyle.css" type="text/css" rel=stylesheet>
		<script language="JavaScript" src="images/trim.js"></script>
		<script language="JavaScript">
			function confirmDel(){
			 return confirm("ȷ��ɾ��������");
			}			
			function textclear(){
			 document.search.key.value="";
			}
			function checkSearch(){
			 var key = document.search.key.value;
			 if(key.trim()==""){
			   alert("�ؼ��ֲ���Ϊ�գ�����");
			   return;
			 }
			 document.search.submit();
			}
		</script>
	</head>
	<body>
		<div id="Menu">
			<%@ include file="book_left_menu.jsp" %>
		</div>		
		<div id="info_table">
		<%
		   	Vector<Vector<String>> v = (Vector<Vector<String>>)request.getAttribute("v");
		   	String message = (String)request.getAttribute("message");
		   	String url = "list_book.jsp";
		%>
			<br/><center><font size="5">ͼ���б�</center>					
			<table border="0" align="center" width="90%" height="40"
					style="background:url(images/sb.jpg) no-repeat">
				<form name="search" action="ManageServlet" method="post">
				<td align="left">��ѡ���ѯ����
				<select name="condition">
					<option value="BookNO">��ͼ����</option>
					<option value="BookName">��ͼ������</option>
					<option value="Publish">��������</option>
					<option value="Author">������</option>
					<option value="BookIsbn">��ISBN��</option>
				</select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="text" name="key" value="������ؼ���" 
						onfocus="textclear()" size="25" style="border:0">
				<input type="hidden" name="action" value="search_book">
				</td>
				<td width="39%">
				  <img src="images/sstp.jpg" id="mg" border="0"
				      style="cursor:hand"
				      onclick="checkSearch()"
				      onmousedown="document.all.mg.src='images/ssax.jpg'"
				      onmouseup="document.all.mg.src='images/sstp.jpg'"
				      onmouseout="document.all.mg.src='images/sstp.jpg'"/>				       
				 <!--<input type="button" value="��ѯ" onclick="checkSearch()">-->		
				</td>
				</tr></form>
			</table>		
			<% 
				if(v!=null&&v.size()!=0){
			%>					   	
			<table border="0" bgcolor="black" align="center" cellspacing="1" width="90%" style="font-size:13px">
				<th bgcolor="#D1D1E6">���</th>
				<th bgcolor="#D1D1E6">����</th>
				<th bgcolor="#D1D1E6">����</th>
				<th bgcolor="#D1D1E6">������</th>
				<th bgcolor="#D1D1E6">ISBN��</th>
				<!--<th bgcolor="#D1D1E6">����ʱ��</th>-->
				<th bgcolor="#D1D1E6">�۸�</th>
				<th bgcolor="#D1D1E6">״̬</th>
				<th bgcolor="#D1D1E6" width="60">ɾ��</th>
				<th bgcolor="#D1D1E6" width="60">�޸�</th>
				<%
					for(int i=0;i<v.size();i++){
						Vector<String> vtemp = v.get(i);
				%>
					<tr bgcolor=<%= i%2==0?"#F0F7FF":"#FFF8F0" %>>
						<td align="center"><%= vtemp.get(0) %></td>
						<td align="center"><%= vtemp.get(1) %></td>
						<td align="center"><%= vtemp.get(2) %></td>
						<td align="center"><%= vtemp.get(3) %></td>
						<td align="center"><%= vtemp.get(4) %></td>
						<!--<td align="center"><%= vtemp.get(5) %></td>-->					
						<td align="center"><%= vtemp.get(6) %></td>
						<%
							int condition = Integer.parseInt(vtemp.get(7));
							switch(condition){
								case 0:
						%>
							<td align="center">�ڹ�</td>
						<%
								break;
								case 1:
						%>
							<td align="center">���</td>
						<%
								break;
								case 2:
						%>
							<td align="center">�������ԤԼ</td>
						<%
								break;
								case 3:
						%>
							<td align="center">��ʧ</td>
						<%
								break;
							}
						%>
						<td align="center">
							<a href="ManageServlet?action=delBook&bNO=<%=vtemp.get(0)%>" 
									onclick="return confirmDel()">
									<img src="images/del.gif" border="0" width="15" height="15"/>ɾ��</a>
						</td>
						<td align="center">
							<a href="ManageServlet?action=editBook&bNO=<%=vtemp.get(0)%>">
								<img src="images/edit.gif" border="0"/>�޸�</a>
						</td>
						</tr>
					<%
					    }
					%>
			</table>
			<%@ include file="navgation.jsp" %>
		<%
		   	}
		   	else{
				if(message==null&&v.size()==0){
		%>
			<br><br><br><center>û��ͼ���¼����ʾ	
		<%
				}
			}
			if(message!=null&&v==null){
		%>
			<br><br><br><center><%= message %>
		<%
			}
		%>
		</div>
	</body>
</html>
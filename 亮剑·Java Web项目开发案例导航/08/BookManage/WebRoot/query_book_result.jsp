<%@ page contentType="text/html;charset=gbk"%>
<jsp:useBean id="status" class="wyf.wyy.StatusBean" scope="session"/>
<%@ page import="java.util.*"%>
<html>
	<head>
		<link href="images/div.css" type="text/css" rel=stylesheet>
		<link href="images/globalstyle.css" type="text/css" rel=stylesheet>
		<script language="JavaScript">
			function confirmOrder(sb){
			 	if(confirm("ȷ��ҪԤԼ������")){
			 		sb.submit();
			 	}
			}
		</script>
	</head>
	<body>
		<div>
		<%
		   	Vector<Vector<String>> v = (Vector<Vector<String>>)request.getAttribute("v");
		   	String url = "query_book_result.jsp";						//��ҳʹ��
		   	String stuNO = (String)session.getAttribute("stuNO");		//�õ���½��ѧ��ѧ��
		   	if(v!=null&&v.size()!=0){
		%>
		<table border="0" bgcolor="black" width="90%" cellspacing="1" align="center">
			<th bgcolor="#D1D1E6">���</th>
			<th bgcolor="#D1D1E6">����</th>
			<th bgcolor="#D1D1E6">����</th>
			<th bgcolor="#D1D1E6">������</th>
			<th bgcolor="#D1D1E6">ISBN��</th>			
			<th bgcolor="#D1D1E6">����ʱ��</th>
			<th bgcolor="#D1D1E6">�۸�</th>
			<th bgcolor="#D1D1E6">״̬</th>
			<% 
				if(stuNO!=null){
			%>
				<th bgcolor="D1D1E6">ԤԼ</th>
			<%
				}
			%>
			
			<%
				for(int i=0;i<v.size();i++){
					Vector<String> vtemp = v.get(i);
			%>
				<tr bgcolor=<%= i%2==0?"#F0F7FF":"#FFF8F0" %>>
					<td><%= vtemp.get(0) %></td>
					<td><%= vtemp.get(1) %></td>
					<td><%= vtemp.get(2) %></td>
					<td><%= vtemp.get(3) %></td>
					<td><%= vtemp.get(4) %></td>
					<td><%= vtemp.get(5) %></td>
					<td><%= vtemp.get(6) %></td>					
					<%
						int condition = Integer.parseInt(vtemp.get(7));
						switch(condition){
							case 0:
					%>
						<td>�ڹ�</td>
					<%
							break;
							case 1:
					%>
						<td>���</td>
					<%
							break;
							case 2:
					%>
						<td>��ʧ</td>
					<%
							break;
						}
						if(stuNO!=null){					
							if(condition==1){
					%>
							<form name="yyts<%=i%>" action="StudentServlet" method="post" "confirmOrder();">
								<input type="hidden" name="action" value="order"/>
								<input type="hidden" name="bookNO" value="<%=vtemp.get(0)%>"/>
								<td align="center">
								<!-- <input type="submit" value="ԤԼ"/> -->
								<img src="images/yya.gif" id="yy<%=i%>" onclick="confirmOrder(document.all.yyts<%=i%>)" 
									onmouseover="document.all.yy<%=i%>.src='images/yyb.gif'"
								 	onmouseout="document.all.yy<%=i%>.src='images/yya.gif'"
								  	onmousedown="document.all.yy<%=i%>.src='images/yyc.gif'"
								   	style="cursor:hand"/>
								</td>
							</form>
						<%
							}
							else{
						%>
							<td align="center">����</td>
						<%
							}
						}
						%>
				</tr>
			<%
				   	}
			%>
		</table>		
		<%@ include file="navgation.jsp" %>
		<%
			 }
			 else{
		%>
			   <font color="red" size="3">
			   	<center>û�в��ҵ�����鼮��</center>			   
			   </font> 
		<%
			 }
		%>
		</div>
	</body>
</html>
<%@ page contentType="text/html;charset=gbk"%>
<%@ page import="java.util.*"%>
<html>
	<head>
		<link href="images/div.css" type="text/css" rel=stylesheet>
		<link href="images/globalstyle.css" type="text/css" rel=stylesheet>
	</head>
	<body>
		<div id="Menu">
			<%@ include file="stu_left_menu.jsp" %>
		</div>
		<div id="info_table">
		<%
			String stuName = (String)session.getAttribute("stuName");
		   	Vector<Vector<String>> v = (Vector<Vector<String>>)request.getAttribute("v");
		   	String url = "lost_book.jsp";			//换页使用
		   	if(v!=null&&v.size()!=0){
		%>
		<%= stuName %>，您的丢书记录如下：<br/><br/>
		<table border="0" bgcolor="black" width="90%" cellspacing="1" align="center">
			<th bgcolor="#D1D1E6">编号</th>
			<th bgcolor="#D1D1E6">名称</th>
			<th bgcolor="#D1D1E6">作者</th>
			<th bgcolor="#D1D1E6">出版社</th>
			<th bgcolor="#D1D1E6">借出日期</th>
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
				</tr>
		<%
			   	}
		%>
		</table>		
		<%@ include file="navgation.jsp" %>		
		<%
			 }
			 else{
		%><br><br>
			<center>
				 <font color="red" size="3"> <%= stuName %>，您没有丢书记录。</font>
			</center>			 		   
		<%
			 }
		%>
		</div>
	</body>
</html>
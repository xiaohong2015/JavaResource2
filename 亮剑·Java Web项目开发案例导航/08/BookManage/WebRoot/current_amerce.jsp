<%@ page contentType="text/html;charset=gbk"%>
<%@ page import="java.util.*"%>
<html>
	<head>
		<link href="images/div.css" type="text/css" rel=stylesheet>
	</head>
	<body>
		<div id="Menu">
			<%@ include file="stu_left_menu.jsp" %>
		</div>		
		<div id="info_table">
		<%
			String stuName = (String)session.getAttribute("stuName");
		   	Vector<Vector<String>> v = (Vector<Vector<String>>)request.getAttribute("v");
		   	if(v!=null&&v.size()!=0){
		%>
		<%= stuName %>������ǰǷ���¼���£�<br/><br/>
			<table border="0" bgcolor="black" align="center" cellspacing="1" width="90%">
				<th bgcolor="#D1D1E6">Ƿ������</th>
				<th bgcolor="#D1D1E6">Ƿ����Ŀ</th>
				<th bgcolor="#D1D1E6">�������</th>
				<th bgcolor="#D1D1E6">Ӧ������</th>				
				<th bgcolor="#D1D1E6">Ƿ����</th>
				<%
					double total = 0.0;			//��¼δ��������ܶ�
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
					total = total+Double.parseDouble(vtemp.get(4));
					total = Math.round(total*100)/100.0;
				    }
				%>
					<tr bgcolor="white">
						<td colspan="4" align="right">����ܼ�</td>
						<td>
							<font color="red" size="2.5"/><%= total %>��
						</td>
					</tr>
			</table>
		<%
		   	}
		   	else{
		%><br><br>
			<center><font color="red" size="3">
				<%= stuName %>����ǰû��Ƿ�
			</font></center>			   
		<%
		   	}
		%>		
		</div>
	</body>
</html>
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
		   	String money = status.getMoney();								//�õ��ѽ�Ƿ���ܶ�
		   	String url = "account.jsp";										//��ҳʱʹ��
		   	if(v!=null&&v.size()!=0){
		%>
		<%= stuName %>�����ķ����ܺ�Ϊ
			<font color="red" size="2.5"><%= money %>��</font>����ϸ��¼���£�<br/>
			<table border="0" bgcolor="black" align="center" cellspacing="1" width="90%">
				<th bgcolor="#D1D1E6">��������</th>
				<th bgcolor="#D1D1E6">������Ŀ</th>
				<th bgcolor="#D1D1E6">������</th>
				<th bgcolor="#D1D1E6">������������</th>
				<%
					for(int i=0;i<v.size();i++){
						Vector<String> vtemp = v.get(i);
				%>
					<tr bgcolor=<%= i%2==0?"#F0F7FF":"#FFF8F0" %>>
						<td align="center"><%= vtemp.get(0) %></td>
						<td align="center"><%= vtemp.get(1) %></td>
						<td align="center"><%= vtemp.get(2) %></td>
						<td align="center"><%= vtemp.get(3) %></td>
					</tr>
				<%
				    }
				%>
			</table>
			<%@ include file="navgation.jsp"%>
		<%
		   	}
		   	else{
		%><br><br>
			<center><font color="red" size="3">
				<%= stuName %>�����Ľ��ɷ����¼Ϊ�ա�
			</font></center>			
		<%
		   	}
		%>
		</div>
	</body>
</html>
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
			 document.search.stuNO.value="";
			}
			function checkSearch(){
			 var stuNO = document.search.stuNO.value;
			 if(stuNO.trim()==""){
			   alert("ѧ�Ų���Ϊ�գ�����");
			   return;
			 }
			 var reg = /^\d*$/
			 if(!reg.test(stuNO)){
			   alert("ѧ�Ÿ�ʽ����ȷ������");
			   return;
			 }
			 document.search.submit();
			}
		</script>
	</head>
	<body>
		<div id="Menu">
			<%@ include file="stum_left_menu.jsp" %>
		</div>
		<div id="info_table">
		<%
		   	Vector<Vector<String>> v = (Vector<Vector<String>>)request.getAttribute("v");
		   	String url = "list_stu.jsp";			//��ҳʹ��
		   	if(v!=null&&v.size()!=0){
		%>
		<center><font size="3">ѧ���б�</font></center>		
		<table style="background:url(images/search.jpg) no-repeat" height="40" width="90%" align="center">
			<form name="search" action="ManageServlet" method="post">
			<tr><td width="28%">
			&nbsp;<input name="stuNO" id="st" value="������ѧ������" style="border:0"
				      		 size="23" onfocus="textclear()"/>		    
			</td>
		    <td width="100" align="left">
			   <img src="images/sstp.jpg" id="mg" border="0"
			      style="cursor:hand"
			      onclick="checkSearch()"
			      onmousedown="document.all.mg.src='images/ssax.jpg'"
			      onmouseup="document.all.mg.src='images/sstp.jpg'"
			      onmouseout="document.all.mg.src='images/sstp.jpg'"/>
		    </td>		     	
		    <input type="hidden" name="action" value="search_stu">
		  </tr></form>
		</table>
		</form>
		<table border="0" bgcolor="black" width="90%" cellspacing="1" align="center">								
			<th bgcolor="#D1D1E6">ѧ��</th>
			<th bgcolor="#D1D1E6">����</th>
			<th bgcolor="#D1D1E6">����</th>
			<th bgcolor="#D1D1E6">����</th>
			<th bgcolor="#D1D1E6">�Ա�</th>
			<th bgcolor="#D1D1E6">�༶</th>
			<th bgcolor="#D1D1E6">ѧԺ</th>
			<th bgcolor="#D1D1E6">����Ȩ��</th>
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
					<td align="center"><%= vtemp.get(5) %></td>
					<td align="center"><%= vtemp.get(6) %></td>
					<td align="center">
		<%
					if(vtemp.get(7).equals("1")){
		%>
					���Խ���
		<%
					}
					else{
		%>
					���ɽ���
		<%
					}
		%>
					</td>
					<td align="center">
						<a href="ManageServlet?action=delStu&stuNO=<%= vtemp.get(0) %>" 
							onclick="return confirmDel()">
							<img src="images/del.gif" border="0" width="15" height="15"/>ɾ��</a></td>
					<td align="center">
						<a href="ManageServlet?action=editStu&stuNO=<%= vtemp.get(0) %>">
							<img src="images/edit.gif" border="0"/>�޸�</a></td>
					</td>
		<%
			   	}
		%>
		</table>		

			<%@ include file="navgation.jsp" %>
		<%
			 }
			 else{
		%>
			<center><font color="red" size="3"><br>û��ѧ����¼</font></center>
		<%
			 }
		%>
		</div>
	</body>
</html>
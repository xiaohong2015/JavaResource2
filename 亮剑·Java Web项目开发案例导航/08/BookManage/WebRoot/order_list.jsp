<%@ page contentType="text/html;charset=gbk"%>
<%@ page import="java.util.*"%>
<jsp:useBean id="status" class="wyf.wyy.StatusBean" scope="session"/>
<html>
	<head>
		<link href="images/div.css" type="text/css" rel=stylesheet>
		<link href="images/globalstyle.css" type="text/css" rel=stylesheet>
		<script language="JavaScript" src="images/trim.js"></script>
		<script language="JavaScript">
			function checkSearch(){
				var stuNO = document.smo.stuNO.value;
				if(stuNO==""){
					alert("������ѧ�ţ�����");
					return;
				}
				if(stuNO.trim()==""){
					alert("ѧ�Ų��ܰ����ո��ҳ��Ȳ���С��6λ");
					return;
				}
				var reg = /^\d+$/;	<!-- ƥ�������ַ���������ʽ -->
				if(!reg.test(stuNO)){
					alert("ѧ��ֻ�����������ͣ�����");
					return;
				}
				document.smo.submit();
			}
		</script>
	</head>
	<body>
		<div id="father">
		<!--  -->
		<%
		   	Vector<Vector<String>> v = (Vector<Vector<String>>)request.getAttribute("v");
		   	String url = "order_list.jsp";					//��ҳʹ��
		   	if(v!=null&&v.size()!=0){
		%><br>
		<table width="90%" align="center" border="0">
			<tr>
				<td>				
				<table style="background:url(images/search.jpg) no-repeat" border="0" height="40" width="100%">
				  <form name="smo" action="StudentServlet" method="post"><tr>
				    <td width="28%">
				   &nbsp;<input name="stuNO" id="st" value="������ѧ������" style="border:0"
				      		 size="23" onfocus="document.all.st.value=''"/>		    
				    </td>
				    <td width="100" align="left">
					   <img src="images/sstp.jpg" id="mg" border="0"
					      style="cursor:hand"
					      onclick="checkSearch()"
					      onmousedown="document.all.mg.src='images/ssax.jpg'"
					      onmouseup="document.all.mg.src='images/sstp.jpg'"
					      onmouseout="document.all.mg.src='images/sstp.jpg'"/>
				    </td>		     	
				    <input type="hidden" name="action" value="sarchMyOrder">
				  </tr></form>
				</table>
					<!--  
					<table height="40" 
						style="background:url(images/search.jpg) no-repeat">
						<form name="smo" action="StudentServlet" method="post">	
						<tr>							
							<td>&nbsp;
								<input type="text" name="stuNO" size="23"/>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<img src="images/sstp.jpg" id="ss" onclick="checkSearch()"
								  	onmousedown="document.all.ss.src='images/ssax.jpg'"
								   	onmouseup="document.all.ss.src='images/sstp.jpg'"
								    onmouseout="document.all.ss.src='images/sstp.jpg'"
									style="cursor:hand">
								<input type="hidden" name="action" value="sarchMyOrder">
							</td>
								
						</tr></form>			
					</table>-->
				</td>
			</tr>
			<tr>
				<td>
					<table border="0" bgcolor="black" align="center" width="100%" cellspacing="1">
						<th bgcolor="#D1D1E6">ѧ��</th>
						<th bgcolor="#D1D1E6">�༶</th>				
						<th bgcolor="#D1D1E6">Ԥ������</th>
						<th bgcolor="#D1D1E6">����</th>
						<th bgcolor="#D1D1E6">ͼ����</th>
						<th bgcolor="#D1D1E6">��ֹ����</th>
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
							</tr>
						<%
						    }
						%>
					</table>
					<%@ include file="navgation.jsp" %>
				</td>
			</tr>		
		</table>	
	<%
	   	}
	   	else{
	%><br><br><br><br><br><br><br><center>
		<font color="red" size="3">��ʾ��Ԥ���б�Ϊ��</font>
	<% 
		}
	 %>
	</div>
	</body>
</html>
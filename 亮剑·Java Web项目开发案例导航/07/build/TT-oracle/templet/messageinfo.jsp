<%@ page contentType="text/html;charset=gbk"
	import="java.util.*"
 %>
<html>
	<head>
		<title>�鿴��Ϣ</title>
 		<link href="css/reg.css" type="text/css" rel="stylesheet"/>
 		<link href="css/tablestyle.css" type="text/css" rel="stylesheet"/>
 		<script language="JavaScript" src="script/trim.js"></script>
 		<script language="JavaScript" src="script/changepage.js"></script>
	</head>
	<% 
		List<String[]> list = (List<String[]>)session.getAttribute("list");
	 %>
	<body>
		<div id="wrapper">
		<div id="branding"></div>
		<div id="content" style="height:400px">
			<p id="top">
				<a href="index.jsp">��ҳ</a>>><b>�鿴��Ϣ</b>
			</p>
			<% 
				if(list==null){
					response.sendRedirect(request.getContextPath()+"/ManageServlet?action=getTicketMsg&type=3");
				}
				else if(list.size()==0){
			%>
					<h1><center>������Ϣ������</center></h1>
			<%
				}
				else{				
					int totalpage = (Integer)session.getAttribute("totalpage");
					int nowpage = (Integer)session.getAttribute("nowpage");
			 %>
			<table class="default" border="0" cellspacing="1" align="center">
				<thead>	
				<tr>
					<th>��Ϣ����</th>
					<th width="80">����</th>
					<th width="80">�۸�</th>
					<th width="80">ϯ��</th>
					<th width="80">����</th>
				</tr>
				</thead>
				<tbody>
				<% 
					for(int i=0;i<list.size();i++){
						String[] str = list.get(i);
						String type = (str[0].equals("1"))?"ת��":"��";
						StringBuffer mtitle = new StringBuffer();
						mtitle.append(type);						
						String[] dd = str[1].split("-");
						mtitle.append(dd[0]);
						mtitle.append("��");
						mtitle.append(dd[1]);
						mtitle.append("��");
						mtitle.append(dd[2]);
						mtitle.append("��");						
						mtitle.append(str[2]);
						mtitle.append("���г���Ʊ");
				%>
				<tr>
					<td>[<%= type %>]&nbsp;&nbsp;<a href="<%= request.getContextPath() %>/ManageServlet?action=lookdetail&mid=<%= str[6] %>&flag=2"><%= mtitle.toString() %></a></td>
					<td><%= str[2] %></td>
					<td><%= str[3] %></td>
					<td><%= str[4] %></td>
					<td><%= str[5] %></td>
				</tr>			
				<%
					}
				 %>
				</tbody>
			</table>
			<table width="90%" align="center">
			<form method="post" action="ManageServlet" name="myform" id="myform">
			  <tr height="50px">
			    <td align="left">
			      <font size="2">��<%= totalpage %>ҳ&nbsp;&nbsp;��ǰҳ:<%= nowpage %></font>
			    </td>
			    <td align="right">
			      <% 
			      	if(nowpage>1){
			       %>
			      <a href="<%= request.getContextPath() %>/ManageServlet?action=changePage&pagename=/messageinfo.jsp&page=<%= nowpage-1 %>"><img src="images/pre.gif" border="0"/></a>
			      <% 
			      	}
			      	if(nowpage<totalpage){
			       %>	       
			      <a href="<%= request.getContextPath() %>/ManageServlet?action=changePage&pagename=/messageinfo.jsp&page=<%= nowpage+1 %>"><img src="images/next.gif" border="0"/></a>
			      <% 
			      	}
			      	else{
			      		out.println("<img src='images/next.gif' style='visibility:hidden'/>");
			      	}
			       %>
			      <font size="2">��<input name="page" id="page" size="2" value="<%= nowpage %>" onfocus="document.all.page.value=''"/>ҳ</font>
			      <input type="hidden" name="action" value="changePage" />
			      <input type="hidden" name="pagename" value="/messageinfo.jsp"/>
			    </td>
			    <td width="10">
			      <img src="images/go.gif" border="0" style="cursor:hand" onclick="JavaScript:checkPage(<%= totalpage %>)">
			    </td>
			  </tr>	
			</form>			
			</table>
			<% 
				}
			 %>			 
		</div>
		</div>
	</body>
</html>
<%@ page contentType="text/html;charset=gbk" 
	import="wyf.zrk.TicketItem"
%>

<% 
	TicketItem ti = (TicketItem)request.getAttribute("ti");
	if(ti==null){
		response.sendRedirect("index.jsp");
	}
	else{
 %>
<html>
	<head>
		<title>��Ϣ�޸�</title>		
 		<link href="css/book.css" type="text/css" rel="stylesheet"/>
 		<script language="JavaScript" src="script/trim.js"></script>
		<script language="JavaScript" src="script/general.js"></script>
		<script language="JavaScript" src="script/book.js"></script>
		<script language="javascript" src="script/calendar.js"></script>
	</head>
	<body>
		<div id="wrapper">
		<div id="branding"></div>
		<div id="content" style="height:400px">
			<p id="top">
				<a href="index.jsp">��ҳ</a>>><b>��ƱԤ��</b>
			</p>
			<form action="ManageServlet" method="post" name="mf_msg">
			<table border="0" bgcolor="black" width="80%" cellspacing="1">
				<tr bgcolor="#EDF2F7" align="center">
					<th>���Σ�</th>
					<td><%= ti.getTname() %></td>
					<th>��Ʊ������</th>
					<td><input name="tamount" value="<%= ti.getTamount() %>"/></td>
				</tr>
				<tr bgcolor="#FFFFFF" align="center">
					<th>����վ��</th>
					<td><%= ti.getTstart() %></td>
					<th>Ŀ��վ��</th>
					<td><%= ti.getTend() %></td>
				</tr>
				<tr bgcolor="#EDF2F7" align="center">
					<th>��Ʊ���ڣ�</th>
					<td><input name="tdate" value="<%= ti.getTdate() %>" onmouseout="calshow=false"
						onclick="JavaScript:showCalendar('tdate');this.blur();" /></td>
					<th>��ϵ�ˣ�</th>
					<td><input name="linkman" value="<%= ti.getLinkman() %>" /></td>
				</tr>
				<tr bgcolor="#FFFFFF" align="center">
					<th>��ϵ�˵�ַ��</th>
					<td><input name="address" value="<%= ti.getAddress() %>" /></td>
					<th>��ϵ�绰��</th>
					<td><input name="tel" value="<%= ti.getTel() %>" /></td>
				</tr>
			</table><br/>
			<input type="hidden" name="action" value="modify" />
			<input type="button" class="btn" value="&nbsp;��&nbsp;��&nbsp;" onclick="JavaScript:check()" />&nbsp;&nbsp;&nbsp;
			<input type="reset" class="btn" value="&nbsp;��&nbsp;��&nbsp;" />
			</form><br/><br/>
			<table border="0" cellspacing="1" bgcolor="#F7B770" width="80%" height="50px">
				<tr bgcolor="#FDF1E4">
					<td align="center">
						<img src="images/warning.gif" border="0" />
						<font size="2">ע������д��ȷ����Ч����Ϣ����ȷ�����ܼ�ʱ�ء�׼ȷ��Ԥ���������賵�εĳ�Ʊ��
						�����Ρ�����վ��Ŀ��վһ����д�������޸ġ�</font>
					</td>
				</tr>
			</table>
			<%@ include file="calendar.jsp" %>
		</div>
		<%@ include file="tip.jsp" %>
		</div>	
	</body>
</html> 
 <% 
 	}
  %>
<%@ page contentType="text/html;charset=gbk" 
	import="wyf.zrk.TicketItem"
%>
<% 
	List<String[]> ls = (List<String[]>)request.getAttribute("list");
	if(session.getAttribute("user")==null){
		out.println("<script language=\"JavaScript\"> alert(\"�����ȵ�¼������\");"
					+"window.location.href=\"index.jsp\"</script>");
	}
	else{
		if(ls==null||ls.size()==0){
			out.println("<script language=\"JavaScript\"> alert(\"ϵͳ���󣡣���\");"
				+"window.location.href=\"index.jsp\"</script>");
		}
		else{
			String[] str = ls.get(0);
%>
<html>
	<head>
		<title>Ԥ����ϸ</title>
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
				<a href="index.jsp">��ҳ</a>>><a href="myorder.jsp">�ҵ�Ԥ��</a>>><b>Ԥ���޸�</b>
			</p>
			<br/><br/><br/>
			<form action="ManageServlet" method="post" name="mf_mod">
			<table width="80%" bgcolor="black" border="0" cellspacing="1">
			<caption>�ҵ�Ԥ�� ��&nbsp;<%= str[9] %>&nbsp;��</caption>
				<tr bgcolor="#EDF2F7" align="center">
					<th>Ԥ��״̬</th>
					<td><%= str[9] %></td>
					<th>����</th>
					<td><%= str[1] %></td>
				</tr>
				<tr bgcolor="#FFFFFF" align="center">
					<th>����վ</th>
					<td><%= str[2] %></td>
					<th>Ŀ��վ</th>
					<td><%= str[3] %></td>
				</tr>
				<tr bgcolor="#EDF2F7" align="center">
					<th>��Ʊ����</th>
					<td><input name="tdate" id="tdate" value="<%= str[8] %>"  onmouseout="calshow=false"
						onclick="JavaScript:showCalendar('tdate');this.blur();"/></td>
					<th>��Ʊ����</th>
					<td><input name="tamount" id="tamount" value="<%= str[7] %>" /></td>
				</tr>
				<tr bgcolor="#FFFFFF" align="center">
					<th>��ϵ��</th>
					<td><input id="linkman" name="linkman" value="<%= str[4] %>" /></td>
					<th>��ϵ��ַ</th>
					<td><input name="address" id="address" value="<%= str[5] %>" /></td>
				</tr>
				<tr bgcolor="#EDF2F7" align="center">
					<th>��ϵ�绰</th>
					<td><input id="tel" name="tel" value="<%= str[6] %>" /></td>
					<th></th>
					<td></td>
				</tr>
			</table>
				<input type="hidden" name="action" value="modifyOrder" />
				<input type="hidden" name="oid" value="<%= str[0] %>" />
				<input type="button" class="btn" value="&nbsp;��&nbsp;��&nbsp;" onclick="JavaScript:modify()" />&nbsp;&nbsp;&nbsp;
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
	}
 %>
<%@ page contentType="text/html;charset=gbk"%>
<table align="center" width="90%">
	<tr align="left" width="30%">
		<td width="100">
<% 
		int curPage = status.getCurPage();			//�õ���ǰҳ
		int total = status.getTotal();				//�õ���ҳ��
		if(curPage>1){
%>
		<a href="StudentServlet?action=changePage&curPage=<%= curPage-1 %>&url=<%= url %>"><<��һҳ</a>
<%
		}
%>
		</td>
	<form action="StudentServlet" method="post">
		<td align="center" width="30%">
			<select name="curPage" onchange="this.form.submit()">
<%
				for(int i=1;i<=total;i++){
					if(i==curPage){
%>
					<option value="<%= i %>" selected>��<%= i %>ҳ</option>
<%
					}
					else{
%>
					<option value="<%= i %>">��<%= i %>ҳ</option>
<%
					}
%>							
<%
				}
%>		
	 			<input type="hidden" name="action" value="changePage">
	 			<input type="hidden" name="url" value="<%= url %>">
			</select>						
		</td>
		<td align="right" width="30%">
<%
		if(curPage<total){
%>
		<a href="StudentServlet?action=changePage&curPage=<%= curPage+1 %>&url=<%= url %>">��һҳ>></a>
<%
		}
%>
		</td>
	</form>
	</tr>
</table>
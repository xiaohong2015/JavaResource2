<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="java.util.List"%>
<%@page import="com.lyq.bean.Book"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>����ͼ����Ϣ</title>
<style type="text/css">
	form{margin: 0px;}
	td{font-size: 12px;}
	h2{margin: 2px}
</style>
<script type="text/javascript">
	function check(form){
		with(form){
			if(bookCount.value == ""){
				alert("���������������");
				return false;
			}
			if(isNaN(bookCount.value)){
				alert("��ʽ����");
				return false;
			}
			return true;;
		}
	}
</script>
</head>
<body>
	<table align="center" width="500" border="1" height="170" bordercolor="white" bgcolor="black" cellpadding="1" cellspacing="1">
		<tr bgcolor="white">
			<td align="center" colspan="6">
				<h2>����ͼ����Ϣ</h2>
			</td>
		</tr>
		<tr align="center" bgcolor="#e1ffc1" >
			<td><b>ID</b></td>
			<td><b>ͼ������</b></td>
			<td><b>�۸�</b></td>
			<td><b>����</b></td>
			<td><b>����</b></td>
			<td><b>�޸�����</b></td>
		</tr>
			<%
				// ��ȡͼ����Ϣ����
					List<Book> list = (List<Book>)request.getAttribute("list");
					// �жϼ����Ƿ���Ч
					if(list == null || list.size() < 1){
						out.print("û�����ݣ�");
					}else{
						// ����ͼ�鼯���е�����
						for(Book book : list){
			%>
				<tr align="center" bgcolor="white">
					<td><%=book.getId()%></td>
					<td><%=book.getName()%></td>
					<td><%=book.getPrice()%></td>
					<td><%=book.getBookCount()%></td>
					<td><%=book.getAuthor()%></td>
					<td>
						<form action="UpdateServlet" method="post" onsubmit="return check(this);">
							<input type="hidden" name="id" value="<%=book.getId()%>">
							<input type="text" name="bookCount" size="3">
							<input type="submit" value="�ޡ���">
						</form>
					</td>
				</tr>
			<%

					}
				}
			%>
	</table>
</body>
</html>
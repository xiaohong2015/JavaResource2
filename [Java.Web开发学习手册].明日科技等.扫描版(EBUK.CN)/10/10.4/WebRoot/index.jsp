<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>�����Ա��Ϣ</title>
<script type="text/javascript">
	function check(form){
		with(form){
			if(name.value == ""){
				alert("��������Ϊ�գ�");
				return false;
			}
			if(add.value == ""){
				alert("��ͥסַ����Ϊ�գ�");
				return false;
			}
		}
	}
</script>
</head>
<body>
	<form action="AddServlet" method="post" onsubmit="return check(this);">
		<table align="center" width="400">
			<tr>
				<td align="center" colspan="2">
					<h2>�����Ա��Ϣ</h2>
					<hr>
				</td>
			</tr>
			<tr>
				<td align="right">�ա�������</td>
				<td>
					<input type="text" name="name">
				</td>
			</tr>
			<tr>
				<td align="right">�ԡ�����</td>
				<td>
					<input type="radio" name="sex" value="��" checked="checked">��
					<input type="radio" name="sex" value="Ů">Ů
				</td>
			</tr>
			<tr>
				<td align="right">��ͥסַ��</td>
				<td>
					<textarea rows="5" cols="30" name="add"></textarea>
				</td>
			</tr>
			<tr>
				<td align="center" colspan="2">
					<input type="submit" value="����">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
<%@ page contentType="text/html;charset=gb2312"%>
<%@ page import="java.util.*,wyf.hxl.ManageBean,wyf.hxl.DB"%>
<html><head>
<title>����Ա���</title>
<% 
   String chaoji=(String)session.getAttribute("chaoji");
   if(chaoji==null)
   {
     request.setAttribute("msg", "�Բ���ֻ��chaoji����Ա��\\n����ʹ�ô���ܣ����½��");
%>
     <jsp:forward page="dl.jsp"/>
<%
   }
%>
<script language="javascript" src="script/trim.js"></script>
    <script language="javascript">
      function checkMname()
      {
      	var flag = false;
      	var mname = document.aform.mname.value;
      	if(mname.trim()=="")
      	{
      		document.all.minfo.innerHTML =
      				"<font color='red' size='2px'>����Ϊ����������ù���Ա����</font>";
      	}
      	else
      	{
      		flag = true;
			document.all.minfo.innerHTML =
					"<font size='2px'>����Ա��������СдӢ����ĸ�����ġ�������ɡ�</font>";
      	}
      	return flag;
      }
       function checkMpassword()
      {
      	var flag = false;
      	var mpassword = document.aform.mpassword.value;
      	var zzs=/^[a-z0-9A-Z]{6,15}$/;
      	if(mpassword.trim()=="")
      	{
      		document.all.mpinfo.innerHTML =
      				"<font color='red' size='2px'>����Ϊ�����������������롣</font>";
      	}
      	else if(!zzs.test(mpassword))
      	{
      		document.all.mpinfo.innerHTML = 
      				"<font color='red' size='2px'>�����õ�������������������������롣</font>";
      	}
      	else
      	{
      		flag = true;
			    document.all.mpinfo.innerHTML =
					"<font size='2px'>���������Ӣ����ĸ��������ɣ�Ҫ����6λС��15λ��</font>";
      	}
      	return flag;
      }
      function checkMpw()
      {
      	var flag = false;
      	var mpassword = document.aform.mpassword.value;
      	var mpw = document.aform.mpw.value;
      	if(mpw.trim()=="")
      	{
      		document.all.mpsinfo.innerHTML =
      				"<font color='red' size='2px'>����Ϊ�����������������롣</font>";
      	}
      	else if(mpw.trim()!=mpassword.trim())
      	{
      		document.all.mpsinfo.innerHTML = 
      				"<font color='red' size='2px'>�����õ�������������������������롣</font>";
      	}
      	else
      	{
      		flag = true;
			document.all.mpsinfo.innerHTML =
					"<font size='2px'>���������Ӣ����ĸ��������ɣ�Ҫ����6λС��15λ��</font>";
      	}
      	return flag;
      }

      function checkTJ()
      {
      	var flag1 = checkMname();
      	var flag2 = checkMpassword();
      	var flag3 = checkMpw();
      	if(flag1&&flag2&&flag3)
      	{
      		document.aform.submit();
      	}
      }
      </script>
</head>     
<body style="background:url('img/top/bg.gif')">
<br><br>
<table border="0" width="700" style="border:1px solid #6daafc" align="center">
  <tr>
    <td>
		<table border="0" align="center">
			<caption style="font-size:1.5em;font-weight:bold">��ӹ���Ա</caption>
			<tr>
			<td>			
			<form action="ManageServlet" name="aform" method="post">
				<table border="0">
				<tr>
					<td align="right">����д����Ա��</td>
					<td><input name="mname" type="text" id="mname" onblur="checkMname"/></td>
					<td id="minfo"><font color="blue" size="2px">����Ա��������СдӢ����ĸ�����ġ�������ɡ�</font></td>
				</tr>
				<tr>
					<td align="right">����д����</td>
					<td><input name="mpassword" type="password" id="mpassword" onblur="checkMpassword"/></td>
					<td id="mpinfo"><font color="blue" size="2px">���������СдӢ����ĸ��������ɣ�Ҫ����6λС��15λ��</font></td>
				</tr>
				<tr>
					<td align="right">���ٴ���������</td>
					<td><input name="mpw" type="password" id="mpw" onblur="checkMpw"/></td>
					<td id="mpsinfo"><font color="blue" size="2px">���������СдӢ����ĸ��������ɣ�Ҫ����6λС��15λ��</font></td>
				</tr>
				<tr>
					<td align="right">��ѡ�����ԱȨ��</td>
					<td><select  name="quanxian" id="quanxian" style="width:155;">
								<option selected value="putong">��ͨ
						        <option value="chaoji">����
						</select></td>
					<td id="qxinfo"><font color="blue" size="2px">Ȩ�޿���Ϊ'��ͨ'��'����'��</font></td>
				</tr>
				</table>
				<table border="0" align="center">
				<tr align="center">
					<td><input name="tianjia" type="button" value="���" onclick="checkTJ()"/>
					<input name="action" type="hidden" value="tianjia"/></td>
					<td>
						<input type="reset" id="zhuce" name="zhuce" value="����"/>
					</td>
				</tr>
				</table>
			</form>
			</td>
			</tr>
			</table>
		</td>
	</tr>
</table>
</body>
</html>

<%
   String msg=(String)request.getAttribute("msg");
   if(msg!=null)
   {
%>
   <script>
     alert('<%=msg%>');
   </script>
<%
   }
%>
<%@ page contentType="text/html;charset=gb2312"%>
<%@ page import="wyf.hxl.PaginationBean,wyf.hxl.DB,java.util.*"%>
<html>
  <head>
    <title>�˿���Ϣ�޸�</title>
    <script language="javascript" src="script/trim.js"></script>
    <script language="javascript">
      function check()
      {
      	var pwd = document.mfmodify.upwd.value;
      	var email = document.mfmodify.uemail.value;
      	if(pwd.trim()=="")
      	{
      		alert("���벻����Ϊ��!!!");
      		return;
      	}
      	else if(pwd.trim().length<6)
      	{
      		alert("���볤�Ȳ�������6!!!");
      		return;
      	}
      	else if(email.trim()=="")
      	{
      		alert("E-mail����Ϊ��!!!");
      		return;
      	}
      	document.mfmodify.submit();
      }
    </script>
  </head>
  <body style="background:url('img/top/bg.gif')">
     <table width="100%">
		  <tr align="center">
		    <td>
		      <table>
		        <form action="CustomerServlet" method="post" name="mfmodify">
		          <% 
		              String uname = (String)session.getAttribute("user");
		              uname = new String(uname.getBytes(),"ISO-8859-1");
		          	  String sql = "select cname,cpw,cemail from gcustomer where cname='"+uname+"'";
		          	  Vector<String[]> vuser = DB.getMessage(sql);
		          	  String[] str = vuser.get(0);
		           %>
		          <tr align="center">
		            <td><br/><br/>�û���:</td>
		            <td align="left"><br/><br/><%=str[0] %></td>
		          </tr>
		          <tr>
		            <td><br/><br/>��&nbsp;��:</td>
		            <td><br/><br/><input  name="cpw" value="<%=str[1] %>"/></td>
		          </tr>
		          <tr>
		            <td><br/><br/>Email:</td>
		            <td><br/><br/><input name="cemail" value="<%=str[2] %>"/></td>
		          </tr>
		          <tr>
		            <td align="right">
		              <br/><br/><input type="button" value="�޸�" onclick="check()"/>
		              <input type="hidden" name="action" value="customermodify"/>
		            </td>
		            <td align="right"><br/><br/>
		              <a href="javascript:history.back()">������һ��</a>
		            </td>
		          </tr>
		        </form>
		      </table>
		    </td>
		  </tr>
	</table>
  </body>
</html>
<%@ page contentType="text/html; charset=gbk" %>
<html>
  <head>
	<title>��½ҳ��</title>
	<link rel=stylesheet href="css/style.css" type="text/css">
	<script language="JavaScript" src="script/trim.js"></script>
	<script language="JavaScript">
		function check(){
			var uname = document.all.uname.value;
			var upwd = document.all.upwd.value;
			if(uname.trim()==""){
				alert("�û���Ϊ��,����������!!!");
				return;
			}
			if(upwd.trim()==""){
				alert("����Ϊ��,����������!!!");
				return;
			}
			document.all.mf.submit();
		}
	</script>
  </head>
  <body>
  	<div class="out">
    <div class="login_style">
      <center>
	  <form action="ManageServlet" method="post" id="mf" target="bottom">
	    <table>
	      <tr>
	        <td>�û���:</td>
	        <td><input type="text" id="uname" name="uname" value="zrk"/></td>
	      </tr>
	      <tr>
	        <td>��&nbsp;��:</td>
	        <td><input type="password" id="upwd" name="upwd" value="12345"/></td>
	      </tr>
	      <tr>
	        <td colspan="2" align="center">
	        <img border="0" src="img/ddl.gif" id="lg" onclick="JavaScript:check()"
          	  style="cursor:hand"
          	  onmouseover="document.all.lg.src='img/ddla.gif'"
          	  onmouseout="document.all.lg.src='img/ddl.gif'"
          	  onmouseup="document.all.lg.src='img/ddla.gif'"        	
          	  onmousedown="document.all.lg.src='img/ddlb.gif'"/>
	        <img border="0" src="img/cz.gif" id="cz" onclick="JavaScript:document.all.mf.reset()"
          	  style="cursor:hand"
          	  onmouseover="document.all.cz.src='img/cza.gif'"
          	  onmouseout="document.all.cz.src='img/cz.gif'"
          	  onmouseup="document.all.cz.src='img/cza.gif'"        	
          	  onmousedown="document.all.cz.src='img/czb.gif'"/></td>
	      </tr>
	    </table>
	    <input type="hidden" name="action" value="login"/>
	  </form>
	  </center>
	</div>
	</div>
  </body>
</html>
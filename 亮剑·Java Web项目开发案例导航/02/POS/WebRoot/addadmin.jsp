<%@ page contentType="text/html;charset=gbk" 
	import="wyf.zrk.UserBean,wyf.zrk.AdminInfo,java.util.*"
%>
<html>
  <head>
    <title>����Ա���</title>
    <script language="JavaScript" src="script/trim.js"></script>
    <script language="JavaScript">
      function check(){
      	if(document.all.aname.value.trim()==""){
      	  alert("����Ա���Ʋ���Ϊ��!!!");
      	  return false;
      	}
      	if(document.all.apwd.value.trim()==""){
      	  alert("���벻��Ϊ��!!!");
      	  return false;
      	}
      	if(document.all.apwd.value.trim()!=document.all.fpwd.value.trim()){
      	  alert("�����������벻һ��!!!");
      	  return false;
      	}
      	document.all.mf.submit();
      }
    </script>
  </head>
  <body bgcolor="#EBF5FD">
 	<jsp:useBean id="userBean" class="wyf.zrk.UserBean" scope="session"/>
	<table width="100%" height="44" bgcolor="#206AB3">
      <tr align="center"><td>
        <font color="#FFFFFF" size="5">����Ա����</font>
        <font color="#FFFFFF" size="2">--����Ա���</font>
      </td></tr>
	</table>
	<table>
	  <tr><td><a href="javascript:history.back()">
	    <img border="0" src="img/back.jpg"/></a>
	  </td></tr>
	</table>
	<hr color="black" size="1"/>
	<form action="ManageServlet" method="post" id="mf">
	<table width="80%" border="0" cellspacing="1" bgcolor="black" align="center">	
	  <tr bgcolor="white">
	    <td align="center">����Ա����:</td>
	    <td><input name="aname" id="aname"/></td>
	  </tr>
	  <tr bgcolor="white">
	    <td align="center">����Ա����:</td>
	    <td><input type="password" name="apwd" id="apwd"/></td>
	  </tr>
	  <tr bgcolor="white">
	    <td align="center">ȷ������:</td>
	    <td><input type="password" name="fpwd" id="fpwd"/></td>
	  </tr>
	</table>
	<table align="center">
	  <tr>
	    <td align="right">
	    <img border="0" src="img/xg.gif" id="xg" onclick="JavaScript:check()"
          	  style="cursor:hand"
          	  onmouseover="document.all.xg.src='img/xga.gif'"
          	  onmouseout="document.all.xg.src='img/xg.gif'"
          	  onmouseup="document.all.xg.src='img/xga.gif'"        	
          	  onmousedown="document.all.xg.src='img/xgb.gif'"/>
	    </td>
	    <td align="left">
	    <img border="0" src="img/cze.gif" id="cz" onclick="JavaScript:document.all.mf.reset()"
          	  style="cursor:hand"
          	  onmouseover="document.all.cz.src='img/czd.gif'"
          	  onmouseout="document.all.cz.src='img/cze.gif'"
          	  onmouseup="document.all.cz.src='img/czd.gif'"        	
          	  onmousedown="document.all.cz.src='img/czc.gif'"/>
	    </td>
	  </tr>
	</table>
	<input type="hidden" name="action" value="addAdmin"/>
	</form>
  </body>
</html>
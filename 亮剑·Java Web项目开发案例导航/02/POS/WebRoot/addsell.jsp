<%@ page contentType="text/html;charset=gbk"
	import="wyf.zrk.UserBean,org.springframework.web.context.*,
	org.springframework.web.context.support.*,wyf.zrk.DButil,java.util.*"
 %>
<html>
  <head>
    <title>������Ϣ���</title>
    <script language="JavaScript" src="script/trim.js"></script>
    <script language="JavaScript">
      function check(){
        var reg = /^\d+(\.\d+)?$/;								//����ƥ��double������
        var etp = document.all.etotalprice.value.trim();		//�õ��۸�
      	if(!reg.test(etp)){
      	  alert("�ɹ��ܼ۸�ʽ����,����������!!!");
      	  return false;
      	}
      	if(document.all.eseller.value.trim()==""){
      	  alert("�ɹ��˲���Ϊ��!!!");
      	  return false;
      	}
      	if(document.all.cname.value.trim()==""){
      	  alert("�ͻ�����Ϊ��,����ӿͻ�!!!");
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
        <font color="#FFFFFF" size="5">������Ϣ����</font>
        <font color="#FFFFFF" size="2">--�������</font>
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
	    <td align="center">�ͻ�����:</td>
	    <td>
      	  <select name="cname" id="cname">
      	  <% 
			//��ȡWebApplicationContext
			WebApplicationContext wac=
			   WebApplicationContextUtils.getWebApplicationContext(this.getServletContext());
			DButil db = (DButil)wac.getBean("DButil");
			List<String> cname = db.getConsumer();
			for(String name:cname){
				name = new String(name.getBytes("ISO-8859-1"),"gbk");
      	    %>
      	    	<option value="<%= name %>"><%= name %></option>
      	    <% 
      	    	}
      	     %>
      	  </select>
	    </td>
	  </tr>
	  <tr bgcolor="white">
	    <td align="center">�����ܼ�:</td>
	    <td><input name="etotalprice" id="etotalprice"/></td>
	  </tr>
	  <tr bgcolor="white">
	    <td align="center">��&nbsp;��&nbsp;��:</td>
	    <td><input name="eseller" id="eseller"/></td>
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
	<input type="hidden" name="action" value="addSell"/>
	</form>
  </body>
</html>
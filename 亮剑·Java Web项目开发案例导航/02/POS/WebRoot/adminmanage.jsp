<%@ page contentType="text/html;charset=gbk" 
	import="wyf.zrk.UserBean,wyf.zrk.AdminInfo,java.util.*"
%>
<% 
	List<AdminInfo> list = (List<AdminInfo>)request.getAttribute("goodslist");
	String alevel = (String)session.getAttribute("alevel");
	if(alevel==null){
		response.sendRedirect("adminlogin.jsp");
	}
	else{
		alevel = new String(alevel.getBytes("ISO-8859-1"),"gbk");
		if(alevel.equals("��ͨ")){
			out.println("<br/><br/><br/><br/><center><h1>�޴�Ȩ��!!!</h1></center>");
		}
		else{
 %>
<html>
  <head>
    <title>����Ա����</title>
	<link rel=stylesheet href="css/general.css" type="text/css">
    <script language="JavaScript" src="script/trim.js"></script>
    <script language="JavaScript">
      function check(){
      	var key = document.all.key.value.trim();
      	if(key==""){
			alert("�ؼ���Ϊ��,����������!!!");
			return;
      	}
      	document.all.smf.submit();
      }
      function checkPage(temp){
      	var page = document.all.page.value.trim();
  		var reg = /^[1-9][0-9]*$/;
		if((reg.test(page.trim()))&&(page<=temp)){
			document.all.mf.submit();
		}
		else{
			alert("���벻�Ϸ�,����������!!!");
			return;
		}
      }
    </script>
  </head>
  <body bgcolor="#EBF5FD">
  	<jsp:useBean id="userBean" class="wyf.zrk.UserBean" scope="session"/>
	<table width="100%" height="44" bgcolor="#206AB3">
      <tr align="center"><td><font color="#FFFFFF" size="5">����Ա����</font></td></tr>
	</table>	
	<table>
	<form action="ManageServlet" method="post" id="smf">
	  <tr>
		<td>
		<table height="42" style="background:url(img/admin_sear.jpg) no-repeat">
		  <tr>
		    <td>
		      &nbsp;<img src="img/log.gif" border="0" style="cursor:hand" onclick="document.all.key.focus()"/>
		    </td>
		    <td>
		     <input name="key" id="key" value="������Ҫ�����Ĺؼ���" style="border:0"
		      		 size="28"	onfocus="document.all.key.value=''"/>		    
		    </td>
		    <td width="90" align="right">
		    <img src="img/sear.jpg" id="mg" border="0"
		      style="cursor:hand"
		      onclick="JavaScript:check()"
		      onmousedown="document.all.mg.src='img/sear1.jpg'"
		      onmouseup="document.all.mg.src='img/sear.jpg'"/>
		    </td>
		    <td width="90" align="center"><a href="addadmin.jsp" target="mainFrame"><font color="white" size="2">��ӹ���Ա</font></a></td>
		    <td width="90" align="left"><a href="resetpwd.jsp" target="mainFrame"><font color="white" size="2">��������</font></a></td>   
		  </tr>
		</table>
	    </td>
	    <td>
	      <input type="hidden" name="action" value="search" />
	      <input type="hidden" name="type" value="admininfo"/>
	    </td>	   
	  </tr>
	</form>
	</table>
	<hr size="1" width="100%" color="black"/>
	<% 
		if(list.isEmpty()){
			out.println("<br/><br/><br/><center><h2>û����������Ҫ�Ĺ���Ա!!!</h2></center>");
		}
		else{
	 %>
	<table width="100%" border="0" cellspacing="1" bgcolor="black">
	  <tr bgcolor="#D1F1FE" align="center">
	    <th>����Ա����</th>
	    <th>����Ա����</th>
	  	<th>ɾ&nbsp;&nbsp;&nbsp;&nbsp;��</th>
	  </tr>
	 <% 
	 	int i = 0;
		for(AdminInfo ai:list){
		if(i%2==0){
			i++;
			out.println("<tr bgcolor='white' align='center'>");
		}
		else{
			i++;
			out.println("<tr bgcolor='#EBF5FD' align='center'>");
		}
	 %>
	 	<td><%= new String(ai.getAname().getBytes("ISO-8859-1"),"gbk") %></td>
	 	<td><%= new String(ai.getAlevel().getBytes("ISO-8859-1"),"gbk") %></td>
	 	<td width="33%"><a href="JavaScript:delete_sure('ManageServlet?action=deleteAdmin&aid=<%= ai.getAid()%>')"><img border="0" src="img/del.gif"/>ɾ��</a></td> 		 
	 <% 
	 	}
	  %>
	</table>
	<table width="100%">
	<form method="post" action="ManageServlet" id="mf">
	  <tr>
	    <td align="left">
	      <font size="2">��<%= userBean.getTotalPage() %>ҳ&nbsp;&nbsp;��ǰҳ:<%= userBean.getNowPage() %></font>
	    </td>
	    <td align="right">
	      <% 
	      	if(userBean.getNowPage()>1){
	       %>
	      <a href="ManageServlet?action=changePage&pagename=/adminmanage.jsp&page=<%= userBean.getNowPage()-1 %>" target="mainFrame"><img src="img/prev.gif" border="0"/></a>
	      <% 
	      	}
	      	if(userBean.getNowPage()<userBean.getTotalPage()){
	       %>	       
	      <a href="ManageServlet?action=changePage&pagename=/adminmanage.jsp&page=<%= userBean.getNowPage()+1 %>" target="mainFrame"><img src="img/next.gif" border="0"/></a>
	      <% 
	      	}
	      	else{
	      		out.println("<img src='img/next.gif' style='visibility:hidden'/>");
	      	}
	       %>
	      <font size="2">��<input name="page" id="page" size="2" value="<%= userBean.getNowPage() %>" onfocus="document.all.page.value=''"/>ҳ</font>
	      <input type="hidden" name="action" value="changePage" />
	      <input type="hidden" name="pagename" value="/adminmanage.jsp"/>
	    </td>
	    <td width="10">
	      <img src="img/go.gif" border="0" style="cursor:hand" onclick="JavaScript:checkPage(<%= userBean.getTotalPage() %>)">
	    </td>
	  </tr>	
	</form>
	</table>
	<% 
		}
	 %>
  </body>
</html>
<% 
	}
}
 %>
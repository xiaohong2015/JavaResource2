<%@ page contentType="text/html;charset=gbk" 
    import="java.util.*,wyf.zrk.GoodsInfo,wyf.zrk.UserBean,
    wyf.zrk.DButil,org.springframework.web.context.*,
    org.springframework.web.context.support.*,wyf.zrk.GoodsClassInfo"
%>    
<% 
	List<GoodsInfo> goodslist = (List<GoodsInfo>)request.getAttribute("goodslist");
 %>
<html>
  <head>
    <title>��Ʒ����</title>
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
      <tr align="center"><td><font color="#FFFFFF" size="5">��Ʒ���Ϲ���</font></td></tr>
	</table>	
	<table>
	<form action="ManageServlet" method="post" id="smf">
	  <tr>
	    <td>
		<table height="42" style="background:url(img/goods_sear.jpg) no-repeat">
		  <tr>
		    <td>
		      &nbsp;<img src="img/log.gif" border="0" style="cursor:hand" onclick="document.all.key.focus()"/>
		    </td>
		    <td>
		      <input name="key" id="key" value="������Ҫ��������Ʒ����" style="border:0"
		      		 size="28"	onfocus="document.all.key.value=''"/>		    
		    </td>
		    <td width="86" align="right">
		    <img src="img/sear.jpg" id="mg" border="0"
		      style="cursor:hand"
		      onclick="JavaScript:check()"
		      onmousedown="document.all.mg.src='img/sear1.jpg'"
		      onmouseup="document.all.mg.src='img/sear.jpg'"/>
		    </td>
		    <td width="80" align="center">
 		      <input type="radio" name="myradio" value="name" checked="true"><font size="2" color="white">������</font>
	     	</td>
	     	<td width="80">
	     	  <input type="radio" name="myradio" value="class"><font size="2" color="white">�����</font>
		    </td>
	    	<td width="80">
	    	  <a href="addgoods.jsp" target="mainFrame"><font size="2" color="white">�����Ʒ</font></a>
	    	</td> 
		  </tr>
		</table>
	    </td>	    
		<td>
	      <input type="hidden" name="action" value="search" />
	      <input type="hidden" name="type" value="goodsinfo"/>
	    </td>	   
	  </tr>
	</form>
	</table>
	<hr size="1" width="100%" color="black"/>
	<% 
		if(goodslist.isEmpty()){
			out.println("<br/><br/><br/><center><h2>û����������Ҫ����Ʒ!!!</h2></center>");
		}
		else{
	 %>
	<table width="100%" border="0" cellspacing="1" bgcolor="black">
	  <tr bgcolor="#D1F1FE" align="center">
	    <th>��Ʒ����</th>
	    <th>���</th>
	    <th>����</th>
	  	<th>�ۼ�</th>
	  	<th>��λ</th>
	  	<th>����</th>
	  	<th>�鿴/�޸�</th>
	  	<th>ɾ��</th>
	  </tr>
	<%
		//��ȡWebApplicationContext
		WebApplicationContext wac=
		   WebApplicationContextUtils.getWebApplicationContext(this.getServletContext());
		DButil db = (DButil)wac.getBean("DButil");
		int i = 0;
		for(GoodsInfo gi:goodslist){
		String gname = gi.getGname();
		String gcid = gi.getGcid();
		GoodsClassInfo gci = (GoodsClassInfo)db.getObject("GoodsClassInfo",gcid);
		int gamount = gi.getGamount();
		String gunit = gi.getGunit();
		double gpin = gi.getGpin();
		double gpout = gi.getGpout();
		if(i%2==0){
			i++;
			out.println("<tr bgcolor='white' align='center'>");
		}
		else{
			i++;
			out.println("<tr bgcolor='#EBF5FD' align='center'>");
		}
	 %>
	    <td><%= new String(gname.getBytes("ISO-8859-1"),"gbk") %></td>
	    <td><%= new String((gci.getGcname()).getBytes("ISO-8859-1"),"gbk") %></td>
	    <td>��<%= gpin %></td>
	    <td>��<%= gpout %></td>
	    <td><%= new String(gunit.getBytes("ISO-8859-1"),"gbk") %></td>
	    <td><%= gamount %></td>
	    <td width="120"><a href="ManageServlet?action=lookGoods&gid=<%= gi.getGid() %>" target="mainFrame"><img border="0" src="img/mod.gif" height="16" width="16"/>�鿴/�޸�</a></td>
	    <td width="100"><a href="JavaScript:delete_sure('ManageServlet?action=deleteGoods&gid=<%= gi.getGid()%>')" target="mainFrame"><img border="0" src="img/del.gif"/>ɾ��</a></td>
	  </tr>
	<%
		}
	 %>
	</table>	
	<table width="100%">
	<form method="post" id="mf" action="ManageServlet">
	  <tr>
	    <td align="left">
	      <font size="2">��<%= userBean.getTotalPage() %>ҳ&nbsp;&nbsp;��ǰҳ:<%= userBean.getNowPage() %></font>
	    </td>
	    <td align="right">
	      <% 
	      	if(userBean.getNowPage()>1){
	       %>
	      <a href="ManageServlet?action=changePage&pagename=/goodsmanage.jsp&page=<%= userBean.getNowPage()-1 %>" target="mainFrame"><img src="img/prev.gif" border="0"/></a>
	      <% 
	      	}
	      	if(userBean.getNowPage()<userBean.getTotalPage()){
	       %>	       
	      <a href="ManageServlet?action=changePage&pagename=/goodsmanage.jsp&page=<%= userBean.getNowPage()+1 %>" target="mainFrame"><img src="img/next.gif" border="0"/></a>
	      <% 
	      	}
	      	else{
	      		out.println("<img src='img/next.gif' style='visibility:hidden'/>");
	      	}
	       %>
	      <font size="2">��<input name="page" id="page" value="<%= userBean.getNowPage() %>" size="2" onfocus="document.all.page.value=''"/>ҳ</font>
	      <input type="hidden" name="action" value="changePage" />
	      <input type="hidden" name="pagename" value="/goodsmanage.jsp"/>	    
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
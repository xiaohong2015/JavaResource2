<%@ page contentType="text/html;charset=gbk"
	import="wyf.zrk.UserBean,wyf.zrk.GoodsInfo,wyf.zrk.GoodsClassInfo,
			java.util.*,org.springframework.web.context.support.*,
			wyf.zrk.DButil,org.springframework.web.context.*"
 %>
<% 
	List<GoodsInfo> list = (List<GoodsInfo>)request.getAttribute("goodslist");
 %>
<html>
  <head>
    <title>���ͳ��</title>
    <link rel=stylesheet href="css/general.css" type="text/css">
    <script language="JavaScript" src="script/trim.js"></script>
    <script language="JavaScript">
      function check(){
      	var key = document.all.key.value.trim();
      	var reg = /^\d+$/;
      	if(key==""){
			alert("�ؼ���Ϊ��,����������!!!");
			return;
      	}
      	if(!reg.test(key)){
      		alert("����������!!!");
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
      <tr align="center"><td><font color="#FFFFFF" size="5">���ͳ��</font></td></tr>
	</table>	
	<table>
	<form action="ManageServlet" method="post" id="smf">
	  <tr>
	    <td>
		<table height="42" style="background:url(img/sl_sear.jpg) no-repeat">
		  <tr>
		    <td>
		      &nbsp;<img src="img/log.gif" border="0" style="cursor:hand" onclick="document.all.key.focus()"/>
		    </td>
		    <td>
		   <input name="key" id="key" value="������Ҫ��������Ʒ�������" style="border:0"
		      		 size="28"	onfocus="document.all.key.value=''"/>		    
		    </td>
		    <td width="86" align="right">
		    <img src="img/sear.jpg" id="mg" border="0"
		      style="cursor:hand"
		      onclick="JavaScript:check()"
		      onmousedown="document.all.mg.src='img/sear1.jpg'"
		      onmouseup="document.all.mg.src='img/sear.jpg'"/>
		    </td>
		    <td width="80" align="right">
 		      <input type="radio" name="myradio" value="more" checked="true"/><font size="2" color="white">���ڵ���</font>
 		    </td>
	     	<td width="90">
	     	  <input type="radio" name="myradio" value="less"/><font size="2" color="white">С�ڵ���</font>
		    </td>
		  </tr>
		</table>
	    </td>
		<td>
	      <input type="hidden" name="action" value="search" />
	      <input type="hidden" name="type" value="sta"/>
	    </td>	   
	  </tr>
	</form>	
	</table>
	<hr size="1" width="100%" color="black"/>
	<% 
		if(list!=null&&!list.isEmpty()){
	 %>	
	<table width="100%" border="0" cellspacing="1" bgcolor="black">
	  <tr bgcolor="#D1F1FE" align="center">
	    <th>��Ʒ����</th>
	    <th>���</th>
	    <th>����</th>
	  	<th>�ۼ�</th>
	  	<th>��λ</th>
	  	<th>����</th>
	  </tr>
	<%
		//��ȡWebApplicationContext
		WebApplicationContext wac=
		   WebApplicationContextUtils.getWebApplicationContext(this.getServletContext());
		DButil db = (DButil)wac.getBean("DButil");
		int i = 0;
		for(GoodsInfo gi:list){
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
	  </tr>
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
	      <a href="ManageServlet?action=changePage&pagename=/statistic.jsp&page=<%= userBean.getNowPage()-1 %>" target="mainFrame"><img src="img/prev.gif" border="0"/></a>
	      <% 
	      	}
	      	if(userBean.getNowPage()<userBean.getTotalPage()){
	       %>	       
	      <a href="ManageServlet?action=changePage&pagename=/statistic.jsp&page=<%= userBean.getNowPage()+1 %>" target="mainFrame"><img src="img/next.gif" border="0"/></a>
	      <% 
	      	}
	      	else{
	      		out.println("<img src='img/next.gif' style='visibility:hidden'/>");
	      	}
	       %>
	      <font size="2">��<input name="page" id="page" size="2" value="<%= userBean.getNowPage() %>" onfocus="document.all.page.value=''"/>ҳ</font>
	      <input type="hidden" name="action" value="changePage" />
	      <input type="hidden" name="pagename" value="/statistic.jsp"/>
	    </td>
	    <td width="10">
	      <img src="img/go.gif" border="0" style="cursor:hand" onclick="JavaScript:checkPage(<%= userBean.getTotalPage() %>)">
	    </td>
	  </tr>	
	</form>
	</table>	
	<% 
		}
		else{
			out.println("<br/><br/><br/><br/><center><h2>û������������Ҫ�����Ʒ!!!</h2></center>");
		}
	 %>	
  </body>
</html>
<%@ page contentType="text/html;charset=gbk"
	import="wyf.zrk.SellInfo,wyf.zrk.SellDetail,java.util.*,wyf.zrk.DButil,
		org.springframework.web.context.*,org.springframework.web.context.support.*,
		wyf.zrk.ConsumerInfo,wyf.zrk.GoodsInfo"
 %>
<% 
	SellInfo ei = (SellInfo)request.getAttribute("ei");
	List<SellDetail> list = (List<SellDetail>)request.getAttribute("list");
	//��ȡWebApplicationContext
	WebApplicationContext wac=
	   WebApplicationContextUtils.getWebApplicationContext(this.getServletContext());
	DButil db = (DButil)wac.getBean("DButil");
	ConsumerInfo ci = (ConsumerInfo)db.getObject("ConsumerInfo",ei.getCid());
 %>
<html>
  <head>
    <title>�ɹ���ϸ</title>
    <script language="JavaScript" src="script/trim.js"></script>
    <script>
      function check(){
      	if(document.all.gname.value.trim()==""){
      		alert("��Ʒ���Ʋ���Ϊ��,�������Ʒ!!!");
      		return false;
      	}
      	var reg = /^[1-9][0-9]*$/;
      	if(!reg.test(document.all.edamount.value.trim())){
      	  	alert("������ʽ����,����������!!!");
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
        <font color="#FFFFFF" size="2">--��ϸ���</font>
      </td></tr>
	</table>
	<table>
	  <tr><td><a href="ManageServlet?action=changePage&page=<%= userBean.getNowPage() %>&pagename=/sellmanage.jsp">
	    <img border="0" src="img/back.jpg"/></a>
	  </td></tr>
	</table>
	<hr color="black" size="1"/>
	<table width="100%" border="0" cellspacing="1" bgcolor="black">
	<caption>������Ϣ</caption>
	  <tr bgcolor="#D1F1FE" align="center">
	    <th>��&nbsp;��&nbsp;��</th>
	    <th>�ͻ�����</th>
	    <th>��������</th>
	  	<th>�����ܼ�</th>
	  	<th>��&nbsp;��&nbsp;��</th>
	  </tr>
	  <tr bgcolor="white" align="center">
		<td><%= ei.getEid() %></td>
		<td><%= new String(ci.getCname().getBytes("ISO-8859-1"),"gbk") %></td>
	     <td><%= (ei.getEdate().getYear()+1900)+"-"+
	     		(ei.getEdate().getMonth()+1)+"-"+(ei.getEdate().getDate()) %></td>
		<td><%= ei.getEtotalprice() %></td>
		<td><%= new String(ei.getEseller().getBytes("ISO-8859-1"),"gbk") %></td>
	  </tr>
	</table>
	<form method="post" action="ManageServlet" id="mf">
	<font color="red" size="3">�����±����������Ʒ.</font>
	<table width="100%" border="0" cellspacing="1" bgcolor="black">
	<caption>������ϸ</caption>
	  <tr bgcolor="#D1F1FE" align="center">
	    <th>��Ʒ����</th>
	    <th>��Ʒ����</th>
	    <th>���</th>
	  </tr>
	  <% 
	  	int i = 0;
	  	for(SellDetail sd:list){
		GoodsInfo gi = (GoodsInfo)db.getObject("GoodsInfo",sd.getGid());
		if(i%2==0){
			i++;
			out.println("<tr bgcolor='white' align='center'>");
		}
		else{
			i++;
			out.println("<tr bgcolor='#EBF5FD' align='center'>");
		}
	   %>
	  	<td><%= new String(gi.getGname().getBytes("ISO-8859-1"),"gbk") %></td>
	  	<td><%= sd.getEdamount() %></td>
	  	<td>--</td>
	  </tr> 
	  <% 
	  	}
	   %>
	  <tr bgcolor="white" align="center">
	    <td>
      	  <select name="gname" id="gname">
      	  <% 
			List<String> gname = db.getGoods();
			for(String name:gname){
				name = new String(name.getBytes("ISO-8859-1"),"gbk");
      	    %>
      	    	<option value="<%= name %>"><%= name %></option>
      	    <% 
      	    	}
      	     %>
      	  </select>
	    </td>
	    <td><input name="edamount" id="edamount"/></td>
	    <td><img border="0" src="img/tj.gif" id="tj" onclick="JavaScript:check()"
          	  style="cursor:hand"
          	  onmouseover="document.all.tj.src='img/tja.gif'"
          	  onmouseout="document.all.tj.src='img/tj.gif'"
          	  onmouseup="document.all.tj.src='img/tja.gif'"        	
          	  onmousedown="document.all.tj.src='img/tjb.gif'"/></td>
	  </tr>
	  <input type="hidden" name="action" value="addSellDetail"/>
	  <input type="hidden" name="eid" value="<%= ei.getEid() %>"/>
	</table>
	</form>
  </body>
</html>
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
    <title>���۲鿴</title>
  </head>
  <body bgcolor="#EBF5FD">
 	<jsp:useBean id="userBean" class="wyf.zrk.UserBean" scope="session"/>
	<table width="100%" height="44" bgcolor="#206AB3">
      <tr align="center"><td>
        <font color="#FFFFFF" size="5">������Ϣ����</font>
        <font color="#FFFFFF" size="2">--���۲鿴</font>
      </td></tr>
	</table>
	<table>
	  <tr><td><a href="JavaScript:history.back()">
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
	<% 
		if(!list.isEmpty()){
	 %>
	 <br/>
	<table width="100%" border="0" cellspacing="1" bgcolor="black">
	<caption>������ϸ</caption>
	  <tr bgcolor="#D1F1FE" align="center">
	    <th>��Ʒ����</th>
	    <th>��Ʒ����</th>
	    <th>��Ʒ�ۼ�</th>
	    <th>��Ʒ�ܼ�</th>
	  </tr>
	  <% 
	  	int i = 0;
	  	for(SellDetail ed:list){
		GoodsInfo gi = (GoodsInfo)db.getObject("GoodsInfo",ed.getGid());
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
	  	<td><%= ed.getEdamount() %></td>
	  	<td><%= ed.getEdprice() %></td>
	  	<td><%= ed.getEdtotalprice() %></td>
	  </tr> 
	  <% 
	  	}
	   %>
	</table>
	<% 
		}
	 %>	
  </body>
</html>
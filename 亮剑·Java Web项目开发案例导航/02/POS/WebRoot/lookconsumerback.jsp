<%@ page contentType="text/html;charset=gbk"
	import="wyf.zrk.ConsumerBack,wyf.zrk.ConsumerBackDetail,java.util.*,wyf.zrk.DButil,
		org.springframework.web.context.*,org.springframework.web.context.support.*,
		wyf.zrk.ConsumerInfo,wyf.zrk.GoodsInfo"
 %>
<% 
	ConsumerBack cb = (ConsumerBack)request.getAttribute("cb");
	List<ConsumerBackDetail> list = (List<ConsumerBackDetail>)request.getAttribute("list");
	//��ȡWebApplicationContext
	WebApplicationContext wac=
	   WebApplicationContextUtils.getWebApplicationContext(this.getServletContext());
	DButil db = (DButil)wac.getBean("DButil");
	ConsumerInfo ci = (ConsumerInfo)db.getObject("ConsumerInfo",cb.getCid());
 %>
<html>
  <head>
    <title>�˻��鿴</title>  
  </head>
  <body bgcolor="#EBF5FD">
 	<jsp:useBean id="userBean" class="wyf.zrk.UserBean" scope="session"/>
	<table width="100%" height="44" bgcolor="#206AB3">
      <tr align="center"><td>
        <font color="#FFFFFF" size="5">�ͻ��˻�����</font>
        <font color="#FFFFFF" size="2">--�˻��鿴</font>
      </td></tr>
	</table>
	<table>
	  <tr><td><a href="JavaScript:history.back()">
	    <img border="0" src="img/back.jpg"/></a>
	  </td></tr>
	</table>
	<hr color="black" size="1"/>
	<table width="100%" border="0" cellspacing="1" bgcolor="black">
	<caption>�˻���Ϣ</caption>
	  <tr bgcolor="#D1F1FE" align="center">
	    <th>����</th>
	    <th>�ͻ�����</th>
	    <th>���۱��</th>
	  	<th>�˻�ʱ��</th>	
	  </tr>
	  <tr bgcolor="white" align="center">
	     <td><%= cb.getCbid() %></td>
	     <td><%= new String(ci.getCname().getBytes("ISO-8859-1"),"gbk") %></td>
	     <td><%= cb.getEid() %></td>
	     <td><%= (cb.getCbdate().getYear()+1900)+"-"+
	     		(cb.getCbdate().getMonth()+1)+"-"+(cb.getCbdate().getDate()) %></td>
	  </tr>
	</table>
	<% 
		if(!list.isEmpty()){
	 %>
	<br/>
	<table width="100%" border="0" cellspacing="1" bgcolor="black">
	<caption>�˻���ϸ</caption>
	  <tr bgcolor="#D1F1FE" align="center">
	    <th>��Ʒ����</th>
	    <th>��Ʒ����</th>
	    <th>��Ʒ�ۼ�</th>
	    <th>��Ʒ�ܼ�</th>
	  </tr>
	  <% 
	  	int i = 0;
	  	for(ConsumerBackDetail cbd:list){
	  	System.out.println(cbd.getCbdprice());
		GoodsInfo gi = (GoodsInfo)db.getObject("GoodsInfo",cbd.getGid());
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
	  	<td><%= cbd.getCbdamount() %></td>
	  	<td><%= cbd.getCbdprice() %></td>
	  	<td><%= cbd.getCbdtotalprice() %></td>
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
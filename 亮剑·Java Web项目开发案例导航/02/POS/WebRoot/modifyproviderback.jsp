<%@ page contentType="text/html;charset=gbk"
	import="wyf.zrk.ProviderBack,wyf.zrk.ProviderBackDetail,java.util.*,wyf.zrk.DButil,
		org.springframework.web.context.*,org.springframework.web.context.support.*,
		wyf.zrk.ProviderInfo,wyf.zrk.GoodsInfo"
 %>
<% 
	ProviderBack pb = (ProviderBack)request.getAttribute("pb");
	List<ProviderBackDetail> list = (List<ProviderBackDetail>)request.getAttribute("list");
	//��ȡWebApplicationContext
	WebApplicationContext wac=
	   WebApplicationContextUtils.getWebApplicationContext(this.getServletContext());
	DButil db = (DButil)wac.getBean("DButil");
	ProviderInfo pi = (ProviderInfo)db.getObject("ProviderInfo",pb.getPid());
 %>
<html>
  <head>
    <title>�˻��޸�</title>  
    <link rel=stylesheet href="css/general.css" type="text/css">
    <script language="JavaScript" src="script/trim.js"></script>
    <script language="JavaScript">
      function checkDetail(myform,amount){
      	reg = /^[1-9][0-9]*$/
      	if(!reg.test(amount.trim())){
      		alert("��Ʒ������ʽ����!!!");
      		return;
      	}
      	myform.submit();
      }
    </script>
  </head>
  <body bgcolor="#EBF5FD">
 	<jsp:useBean id="userBean" class="wyf.zrk.UserBean" scope="session"/>
	<table width="100%" height="44" bgcolor="#206AB3">
      <tr align="center"><td>
        <font color="#FFFFFF" size="5">�ɹ��˻�����</font>
        <font color="#FFFFFF" size="2">--�˻��޸�</font>
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
	    <th>��Ӧ��</th>
	    <th>�ɹ����</th>
	  	<th>�˻�ʱ��</th>	
	  </tr>
	  <tr bgcolor="white" align="center">
	     <td><%= pb.getPbid() %></td>
	     <td><%= new String(pi.getPname().getBytes("ISO-8859-1"),"gbk") %></td>
	     <td><%= pb.getSid() %></td>
	     <td><%= (pb.getPbdate().getYear()+1900)+"-"+
	     		(pb.getPbdate().getMonth()+1)+"-"+(pb.getPbdate().getDate()) %></td>
	  </tr>
	</table>
	<% 
		if(!list.isEmpty()){
	 %>
	<table width="100%" border="0" cellspacing="1" bgcolor="black">
	<caption>�˻���ϸ</caption>
	  <tr bgcolor="#D1F1FE" align="center">
	    <th>��Ʒ����</th>
	    <th>��Ʒ����</th>
	    <th>��Ʒ�ۼ�</th>
	    <th>��Ʒ�ܼ�</th>
	    <th>�޸�</th>
	    <th>ɾ��</th>
	  </tr>
	  <% 
	  	int i = 0;
	  	for(ProviderBackDetail pbd:list){
		GoodsInfo gi = (GoodsInfo)db.getObject("GoodsInfo",pbd.getGid());
		if(i%2==0){
			i++;
			out.println("<tr bgcolor='white' align='center'>");
		}
		else{
			i++;
			out.println("<tr bgcolor='#EBF5FD' align='center'>");
		}
	   %>
	   	<form id="mfd<%= i %>" method="post" action="ManageServlet">
	   	<input type="hidden" name="action" value="modifyProviderBackDetail"/>
	   	<input type="hidden" name="pbdid" value="<%= pbd.getPbdid() %>"/>
	  	<td><%= new String(gi.getGname().getBytes("ISO-8859-1"),"gbk") %></td>
	  	<td><input name="pbdamount" id="amount<%= i %>" value="<%= pbd.getPbdamount() %>"/></td>
	  	<td><%= pbd.getPbdprice() %></td>
	  	<td><%= pbd.getPbdtotalprice() %></td>
	  	<td width="100"><a href="JavaScript:checkDetail(document.all.mfd<%= i %>,document.all.amount<%= i %>.value)"><img border="0" src="img/mod.gif" height="16" width="16"/>�޸�</a></td>
	  	<td width="100"><a href="JavaScript:delete_sure('ManageServlet?action=deleteProviderBackDetail&pbdid=<%= pbd.getPbdid() %>&pbid=<%= pbd.getPbid() %>')"><img border="0" src="img/del.gif"/>ɾ��</a></td>
	  	</form>
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
<%@ page contentType="text/html;charset=gb2312"%>
<%@ page import="java.util.*,wyf.hxl.ManageBean,wyf.hxl.DB"%>
<jsp:useBean id="spSearch" class="wyf.hxl.ManageBean" scope="session"/>
<%
   String chaoji=(String)session.getAttribute("chaoji");
   String putongF=(String)session.getAttribute("putong");
   if(chaoji==null&&putongF==null)
   {
     request.setAttribute("msg", "�Բ���ֻ�й���Ա�ſ���\\nʹ�ô���ܣ����½��");
%>
     <jsp:forward page="dl.jsp"/>
<%
   }
	Vector<String[]> vv = (Vector<String[]>)request.getAttribute("vv");
	if(vv==null)
	{
		String sql="select goodsname,gtype,gprice,gdate,gamount,gimgurl,gintroduction,goodsid from goodsmessage";
		spSearch.setShowPage(1);
		int nowpage = spSearch.getShowPage();
        int totolpage = DB.totolPage("select * from goodsmessage");
        spSearch.setTotolPage(totolpage);
        spSearch.setSql(sql);
		vv = DB.selectPageMeg(nowpage,sql);	
	}
 %>
<html>
  <head>
    <title></title>
    <script language="javascript" src="script/trim.js"></script>
    <link href="script/style.css" rel="stylesheet" type="text/css"/>
    <script language="javascript">
	function checkdd(tmf,taction){
  		var gtype = document.getElementById('splx').value;
   		var gprice = document.getElementById('spjg').value;
   		var gdate = document.getElementById('sjqq').value;
   		var gamount = document.getElementById('spsl').value;
   		var Gimgurl = document.getElementById('url').value;
   		var gintroduction = document.getElementById('gintroduction').value;
   		var zzs =/^\d+(\.\d+)?$/;
   		var zzsgamount=/^[0-9]+$/;
   		var zzsdate =/^\d[4]-([0-2][1-9]||3[0-1])$/;
   		if(gtype=="")
   		{
   			alert("��Ʒ���Ͳ���Ϊ�գ���");
   			return;
   		}
   		else if(gprice=="")
   		{
   			alert("��Ʒ�۸���Ϊ�գ���");
   			return;
   		}
		if(!zzs.test(gprice))
   		{
   			alert("��Ʒ�۸��ʽ���ԣ���");
   			return;
   		}

   		else if(gamount=="")
   		{
   			alert("��Ʒ��������Ϊ�գ���");
   			return;
   		}
   		else if(!zzsgamount.test(gamount))
   		{
   			alert("��Ʒ������ʽ���ԣ���");
   			return;
   		}
   		if(Gimgurl=="")
   		{
   			alert("�����ͼƬURL��");
   			return;
   		}
      	if(gintroduction=="")
   		{
   			alert("��ʱȱ�ٶԸ���Ʒ�ļ�Ҫ���ܣ���");
   			return;
   		}	   		
   		taction.value="goodsxiugai";
      	tmf.submit();
    } 
    
    function delSubmit(tmf,taction)
    {
	   		taction.value="goodsdelete";
      	tmf.submit();    	
    }
    
		function qingchu()
	    {  
	        document.all.searchgoods.value="";
	    }
		function checkSearch()
		{ 
			var flag=document.searchs.searchgoods.value;
			if(flag.trim()=="")
			{	
				alert("������Ҫ������Ʒ�Ĺؼ��֣���");
				return;
			}
			document.searchs.submit();
		}
    </script>
  </head>
<body style="background:url('img/top/bg.gif')">
  <tr align="left"><td><a href="goodsmd.jsp"><img src="img/left_green.png"/>�������ﷵ��</a></td></tr>
  <hr></hr>
<form action="ManageServlet" name="searchs" method="post" target="mainFrame">

 <table width="100%" border="0" height="40" style="background:url(img/top/search.gif) no-repeat">
	      	<tr>
	      	  <td width="198">&nbsp;<input name="searchgoods" id="searchgoods"
	      	   value="��������Ʒ��" onclick="qingchu()" size="23" style="border:0" /></td>
	      	  <td align="center"><input name="action" type="hidden" value="searchgoods">
	      	  <td><img id="sear" src="img/top/bt.gif" onclick="checkSearch()" style="cursor:hand" 
	      	  		 onmousedown="Javascript:document.all.sear.src='img/top/bt1.gif'"
	      	  		 onmouseup="Javascript:document.all.sear.src='img/top/bt.gif'"
	      	  		 /></td>
	      	</tr>	      	
	      </table>
</form>  
	      <hr></hr>
<%if(vv.size()==0)
{
	out.println("�Բ������ݿ���û����Ʒ��Ϣ������ʾ����");
}
else
{  %>
 <table width="1030" cellpadding="2" bgcolor="black" cellspacing="1">
                  <tr>
                  	<th bgcolor="#d2e9ff" width="90">��ƷID</th>
      			    <th bgcolor="#d2e9ff" width="250">��Ʒ��</th>
				    <th bgcolor="#d2e9ff" width="150">��Ʒ����</th>
				    <th bgcolor="#d2e9ff" width="80">��Ʒ�۸�</th>
				    <th bgcolor="#d2e9ff" width="80">�ϼ�����</th>
				    <th bgcolor="#d2e9ff" width="150">��Ʒ����</th>
				    <th bgcolor="#d2e9ff" width="100">ͼƬURL</th>
				    <th bgcolor="#d2e9ff" width="130">��Ʒ���</th>
				    <th bgcolor="#d2e9ff" width="70">�޸�</th>
				    <th bgcolor="#d2e9ff" width="70">ɾ��</th>          
                  </tr>
<% int ii=0;
	for(int i=0;i<vv.size();i++)
	{
		String[] str = vv.get(i);
 		ii++; 
%>
 
	<form action="ManageServlet" method="post" name="mf" id="mf<%=i%>">
	  <input id="action<%=i%>" type="hidden" name="action" value="goodsxiugai"/>
	  <input type="hidden" name="goodsid" value="<%= str[7]%>"/>
	  <input name="goodsname" type="hidden" value="<%= str[0]%>">
  <tr align='center' bgcolor="<%=(i%2==0)?"#e4f0ff":"#d2e9ff"%>">
   		<td width="150"><%= str[7] %></td>
   		<td width="350"><%= str[0] %></td>
   		<td width="150"><input type="text" name="splx" id="splx" value="<%= str[1] %>" size="8"/></td>
   		<td width="80"><input type="text" name="spjg" id="spjg" value="<%= str[2] %>" size="8"/></td>
   		<td><input type="text" name="sjqq" id="sjqq" value="<%= str[3] %>" size="10"/></td>
   		<td><input type="text" name="spsl" id="spsl" value="<%= str[4] %>" size="4"/></td>
   		<td><input type="text" name="url" id="url" value="<%= str[5] %>" size="22"/></td>		
		<td>
			<textarea style="width:232px;height:30px;overflow-y:scroll" 
				name="gintroduction" id="gintroduction"><%= str[6] %>
			</textarea>
		</td>	 
       <td align="center" height="20">	
	      <input type="button" value="�޸�" onclick="checkdd(document.getElementById('mf<%=i%>'),document.getElementById('action<%=i%>'));"/>
       </td>
       <td align="center" height="20">      
	      <input type="button" value="ɾ��" onclick="delSubmit(document.getElementById('mf<%=i%>'),document.getElementById('action<%=i%>'));"/>
       </td>
  </tr>
  </form>
       <% 
    } 
}
        %>
	        </table><br>
	  <% int showPage=spSearch.getShowPage();
		 int totolPage=spSearch.getTotolPage(); %>
	  <table><tr>
<td><br>
 <% if(showPage>1) {%>
<form action="ManageServlet" name="form" method="post">
 
    <img src="img/top/prev.gif" style="cursor:hand" onclick="JavaScript:document.form.submit()">
    <input name="action" type="hidden" value="before1"/>
</form><% } %></td><td>
<form action="ManageServlet" method="post">
      <td align="center" width="200">
      <%if(vv!=null&&vv.size()!=0)
      {
      %>
      	  <select onchange="this.form.submit()" name="changePage1" >
      	   <% 
      	   		for(int i=1;i<=totolPage;i++)
      	   		{
      	   			String flag1 = "";
      	   			if(i==showPage)
      	   			{
      	   				flag1 = "selected";
      	   			}
      	    %>
      	    	<option value="<%=i%>" <%= flag1 %>>��<%= i %>ҳ</option>
      	    <% 
      	    	}
      	     %>
      	  </select>        
      <%
      }
      %>
      	  <input name="action" type="hidden" value="pageChange1"/>
      	</td>
      	</form></td><td>
<% if(showPage<totolPage){ %><br>
<form action="ManageServlet" name="form1" method="post">

    <img src="img/top/next.gif" style="cursor:hand" onclick="JavaScript:document.form1.submit()">
    <input name="action" type="hidden" value="next1"/>

</form><% } %>
</td></tr></table>
	  
	  
	  
	        <hr></hr>
	        <tr align="left"><td><a href="goodsmd.jsp"><img src="img/left_green.png"/>�������ﷵ��</a></td></tr>
    
</body>
</html>

<%
   String msg=(String)request.getAttribute("msg");
   if(msg!=null)
   {
%>
   <script>
     alert('<%=msg%>');
   </script>
<%
   }
%>
 
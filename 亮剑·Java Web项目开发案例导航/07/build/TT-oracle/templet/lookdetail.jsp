<%@ page contentType="text/html;charset=gbk" %>

<% 
	String[] str = (String[])request.getAttribute("list");
	String flag = (String)request.getAttribute("flag");
	if(str==null){
		response.sendRedirect(request.getContextPath()+"/ManageServlet?action=getTicketMsg&type=3");
	}
 %>

<html>
	<head>
		<title>�鿴������Ϣ</title>
		<link href="css/top.css" type="text/css" rel="stylesheet"/>
		<style type="text/css">
			ul{
				background-color:#ffffff;
				border:solid 1px #C1DCF7;
				padding:30px;
				text-align:left;
				width:80%;
				font-size: 14px;
				color: #000000;
				list-style:none;
			}
			li{
				border-bottom:solid 1px #C1DCF7;
			}
		</style>
	</head>
	<body>
		<div id="wrapper">
		<div id="branding"></div>
		<div id="content">
			<p id="top">
				<a href="index.jsp">��ҳ</a>>>
				<% 
					if(flag.equals("1")){
						out.println("<a href=\"messagemanage.jsp\">��Ϣ����</a>>>");
					}
					else if(flag.equals("2")){
						out.println("<a href=\"messageinfo.jsp\">�鿴��Ϣ</a>>>");
					}
				 %><b>��ϸ��Ϣ</b>
			</p><br/><br/>
			<center><font size="3"><b>��ϸ��Ϣ<b/></center>
			<ul>
				<li>���Σ�<%= str[0] %></li>
				<li>�г����ͣ�<%= str[1] %></li>
				<li>ϯ��<%= str[2] %></li>
				<li>�������ڣ�<%= str[3] %></li>
				<li>ת�ü۸�<%= str[4] %></li>
				<li>�������У�<%= str[5] %></li>
				<li>Ŀ�ĳ��У�<%= str[6] %></li>
				<li>��ϵ�ˣ�<%= str[8] %></li>
				<li>��ϵ�绰��<%= str[9] %></li>
				<li>��Ϣ����ʱ�䣺<%= str[7].substring(0,19) %></li>
				<li>��Ϣ���ݣ�<%= str[10] %></li>
			</ul>
		</div>
		</div>
	</body>
</html>










<%@ page contentType="text/html;charset=gbk" %>
<% 
	List<String[]> ls = (List<String[]>)session.getAttribute("initlist");
 %>
<html>
	<head>
		<title>����Ʊ���ѯ</title>
		<link href="css/main.css" type="text/css" rel="stylesheet" />
		<script language="JavaScript" src="script/trim.js"></script>
		<script language="JavaScript" src="script/general.js"></script>
		<script language="JavaScript" src="script/index.js"></script>
		<script language="JavaScript" src="script/showtip.js"></script>
	</head>
	<body>
		<div id="wrapper">
			<div id="branding"></div>
			<div id="log">
			<% 
				String msg = "";
				if(session.getAttribute("user")!=null){
					msg = session.getAttribute("user")+"����ã�";
				}
			 %>
			<marquee width="350" scrolldelay="5" scrollamount="1" onmouseover="this.stop()" onmouseout="this.start()"><%= msg %>��ӭ���ٽ�����Ʊ����</marquee>
			</div>
			<div id="content">
				<p id="con_title">&nbsp;&nbsp;&nbsp;<b title="��ӭʹ�ý���Ʊ���ѯ��">�����߲�ѯ</b></p>
				<p id="zzcx">
					<form action="ManageServlet" method="post" name="mf_zzcx">
					�� <b>վվ��ѯ</b> ��&nbsp;&nbsp;&nbsp;
					���������ĳ����ؼ�Ŀ�ĵء��磺����-->��ɽ<br/><br/>
					&nbsp;&nbsp;&nbsp;<img border="0" src="images/train_1.gif"/>&nbsp;
					�������У�<input size="10" id="start" name="start" onfocus="JavaScript:setId('start')"/>&nbsp;&nbsp;&nbsp;&nbsp;
					Ŀ�ĳ��У�<input size="10" id="end" name="end" onfocus="JavaScript:setId('end')"/>&nbsp;&nbsp;&nbsp;
					<!--  
					<button onclick="JavaScript:zzcx()">��ѯ</button>&nbsp;&nbsp;
					<button onclick="JavaScript:document.mf_zzcx.reset()">����</button>
					-->
					<input class="btn" type="button" onclick="JavaScript:zzcx()" value="&nbsp;��ѯ&nbsp;"/>
					<input class="btn" type="button" onclick="JavaScript:document.mf_zzcx.reset()" value="&nbsp;����&nbsp;"/>
					
					<input type="hidden" name="action" value="zzcx"/>
					</form>
				</p>
				<p id="czcx" class="train_search">
					<form action="ManageServlet" method="post" name="mf_czcx">
					�� <b>��վ��ѯ</b> ��&nbsp;&nbsp;&nbsp;
					�˴����ڲ�ѯ����ĳվ�������г����磺��ɽ<br/><br/>
					&nbsp;&nbsp;<img border="0" src="images/train_2.gif"/>��վ���ƣ�
					<input name="station" id="station" onfocus="JavaScript:setId('station')"/>&nbsp;&nbsp;&nbsp;
					<!--  
					<button onclick="JavaScript:czcx()">��ѯ</button>&nbsp;&nbsp;
					<button onclick="JavaScript:document.mf_czcx.reset()">����</button>
					-->					
					<input class="btn" type="button" onclick="JavaScript:czcx()" value="&nbsp;��ѯ&nbsp;"/>
					<input class="btn" type="button" onclick="JavaScript:document.mf_czcx.reset()" value="&nbsp;����&nbsp;"/>
					
					<input type="hidden" name="action" value="czcx"/>
					</form>
				</p>
				<p id="cccx" class="train_search" >
					<form action="ManageServlet" method="post" name="mf_cccx">
					�� <b>���β�ѯ</b> ��&nbsp;&nbsp;&nbsp;
					��������Ҫ��ѯ�ĳ��Ρ��磺K39<br/><br/>
					&nbsp;&nbsp;<img border="0" src="images/train_3.gif"/>�������ƣ�
					<input name="train" id="train"/>&nbsp;&nbsp;&nbsp;
					<!--  
					<button onclick="JavaScript:cccx()">��ѯ</button>&nbsp;&nbsp;
					<button onclick="JavaScript:document.mf_cccx.reset()">����</button>
					-->
					<input class="btn" type="button" onclick="JavaScript:train_search()" value="&nbsp;��ѯ&nbsp;"/>
					<input class="btn" type="button" onclick="JavaScript:document.mf_cccx.reset()" value="&nbsp;����&nbsp;"/>					
					<input type="hidden" name="action" value="cccx"/>
					</form>
				</p>
			<div class="list_hidden" id="city" border="1"></div>
			</div>
			<script language="JavaScript">
				if (!isIE) document.captureEvents(Event.KEYUP);
				document.all.start.onkeyup = processKey;
				document.all.end.onkeyup = processKey;
				document.all.station.onkeyup = processKey;
			</script>
			<fieldset class="login">
				<legend>��¼</legend>
				<% 
					if(session.getAttribute("user")==null){
				 %>
				<form action="ManageServlet" method="post" name="mf_login">
					<li>�û�����</li>
					<li><input size="17" name="uname" value="zrk" alt="�������û���"/></li>
					<li>��&nbsp;&nbsp;�룺</li>
					<li><input type="password" size="17" name="upwd" value="860607" alt="����������"/></li>
					<li>
						<input type="button" class="btn" onclick="JavaScript:check()" value="&nbsp;��¼&nbsp;"/>&nbsp;&nbsp;&nbsp;
						<input type="button" onclick="window.location.href='register.jsp'" class="btn" value="&nbsp;ע��&nbsp;"/>
					</li>
					<input type="hidden" name="action" value="login"/>
				</form>
				<% 
					}
					else{
				 %>
				 <ul>
				 	<li><a href="<%= request.getContextPath() %>/ManageServlet?action=logout">�˳���¼</a></li>
				 	<li><a href="<%= request.getContextPath() %>/ManageServlet?action=msgManage">��Ϣ����</a></li>
				 	<li><a href="<%= request.getContextPath() %>/ManageServlet?action=lookUserInfo">�����޸�</a></li>
				 	<li><a href="<%= request.getContextPath() %>/ManageServlet?action=lookBookInfo">�ҵ�Ԥ��</a></li>
				 </ul>
				<%
					}
				 %>
			</fieldset>
			<fieldset class="login">
				<legend>����</legend>
				<ul>
					<li><a href="index.jsp">���β�ѯ</a></li>
					<li><a href="bookticket_a.jsp">��ƱԤ��</a></li>  
					<li><a href="<%= request.getContextPath() %>/ManageServlet?action=getTicketMsg&type=1">ת����Ϣ</a></li> 
					<li><a href="<%= request.getContextPath() %>/ManageServlet?action=getTicketMsg&type=2">����Ϣ</a></li>
					<li><a href="publishmsg.jsp">������Ϣ</a></li>
				</ul>
			</fieldset>
 			<div id="msg">
 				<p id="msg_top"><a href="<%= request.getContextPath() %>/ManageServlet?action=getTicketMsg&type=3">>><i>�鿴������Ϣ</i></a></p>
				<div id="msg_inner">
					<marquee behavior="scroll" direction="up" height="120" scrollamount="1" scrolldelay="60" onmouseover="this.stop()" onmouseout="this.start()">
					<% 
						StringBuilder sb = new StringBuilder();
						if(ls==null||ls.size()==0){
							out.println("������Ϣ");
						}
						else{
							for(int i=0;i<ls.size();i++){
								String str[] = ls.get(i);
								sb.append("<a href=");
								sb.append(request.getContextPath());
								sb.append("/ManageServlet?action=lookdetail&mid=");
								sb.append(str[0]);
								sb.append("&flag=3>&nbsp;&nbsp;&nbsp;");
								if(str[1].equals("1")){
									sb.append("ת��");
								}
								else{
									sb.append("��");
								}
								String[] dd = str[2].split("-");
								sb.append(dd[0]);
								sb.append("��");
								sb.append(dd[1]);
								sb.append("��");
								sb.append(dd[2]);
								sb.append("��");
								sb.append(str[3]);
								sb.append("���г���Ʊ����ϵ�ˣ�");
								sb.append(str[4]);
								sb.append("����ϵ�绰��");
								sb.append(str[5]);
								sb.append("</a></br>");
							}
						}
					 %>
					 <font size="2.5"><%= sb.toString() %></font>
  					</marquee>
					
				</div>
 			</div>
			<div id="footer">
				<p><i>��ӭ���ٱ���վ,�������ʲô���ʣ�����ϵ����&nbsp;&nbsp;
					www.zhairuike@yahoo.com.cn
				</i></p>
			</div>
			<%@ include file="tip.jsp" %>
		</div>
	</body>
</html>

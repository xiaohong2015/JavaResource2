<%@ page contentType="text/html;charset=gbk"
	import="java.util.*"
 %>

 <html>
 	<head>
 		<title>��ϵ��������д</title>
 		<link href="css/book.css" type="text/css" rel="stylesheet"/>
 		<script language="JavaScript" src="script/trim.js"></script>
		<script language="JavaScript" src="script/general.js"></script>
		<script language="JavaScript" src="script/book.js"></script>
		<script language="javascript" src="script/calendar.js"></script>
 	</head>
 	<body>
 		<div id="wrapper">
		<div id="branding"></div>
		<div id="content" style="height:400px">
			<p id="top">
				<a href="index.jsp">��ҳ</a>>><b>��ƱԤ��</b>
			</p>
		
			<form action="ManageServlet" method="post" name="mf_msg">
			<fieldset class="msg_input">
				<legend>��ϵ����Ϣ</legend>
				<p>
					<label for="linkman">��ϵ��������</label>
					<input name="linkman" id="linkman" />
				</p>
				<p>
					<label for="tamount">��Ʊ������</label>
					<input name="tamount" id="tamount" />
				</p>
				<p>
					<label for="tdate">��Ʊ���ڣ�</label>
					<input name="tdate" id="tdate" onmouseout="calshow=false"
						onclick="JavaScript:showCalendar('tdate');this.blur();"/>
				</p>
				<p>
					<label for="address">��ϵ�˵�ַ��</label>
					<input name="address" id="address" />
				</p>
				<p>
					<label for="tel">��ϵ�˵绰��</label>
					<input name="tel" id="tel" />
				</p>
				<p>
					<input type="hidden" name="action" value="saveMsg" />
					<input type="button" class="btn" value="��һ��" onclick="JavaScript:check()" />&nbsp;&nbsp;
					<input type="reset" class="btn" value="��&nbsp;&nbsp;��"/>
				</p>
			</fieldset>
			</form><br/><br/>
			����д������ʵ��������ϵ��ʽ����ȷ�����ܼ�ʱ�ء�׼ȷ��Ԥ�������ĳ�Ʊ��������ɲ���Ҫ���鷳�����������г̡�
			<%@ include file="calendar.jsp" %>			
		</div>
		<%@ include file="tip.jsp" %>
		</div>
 	</body>
 </html>
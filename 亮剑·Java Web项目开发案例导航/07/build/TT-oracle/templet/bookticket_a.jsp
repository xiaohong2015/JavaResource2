<%@ page contentType="text/html;charset=gbk" %>

<html>
	<head>
		<title>��ƱԤ��</title>
 		<link href="css/book.css" type="text/css" rel="stylesheet"/>
 		<script language="JavaScript" src="script/trim.js"></script>
		<script language="JavaScript" src="script/general.js"></script>
		<script language="JavaScript" src="script/book.js"></script>
		<script language="JavaScript" src="script/showtip.js"></script>
	</head>
	<body>
		<div id="wrapper">
		<div id="branding"></div>
		<div id="content">
			<p id="top">
				<a href="index.jsp">��ҳ</a>>><b>��ƱԤ��</b>
			</p>
				<fieldset class="book_input">
				<legend>
					<a href="#" onclick="document.all.mf_book.style.display='block';document.all.mf_train.style.display='none';">վվԤ��<a/><font size="3">/</font>
					<a href="#" onclick="document.all.mf_book.style.display='none';document.all.mf_train.style.display='block';">����Ԥ��</a>
				</legend>
				<form action="ManageServlet" method="post" name="mf_book" id="mf_book">
				<ul>
					<li>&nbsp;</li>
					<li><span class="book_error">*</span>�������У�<input id="tstart" name="tstart" onfocus="JavaScript:setId('tstart')"/></li>
					<li><span class="book_error">*</span>Ŀ�ĳ��У�<input id="tend" name="tend"  onfocus="JavaScript:setId('tend')"/></li>
					<script language="JavaScript">
						if (!isIE) document.captureEvents(Event.KEYUP);
						document.all.tstart.onkeyup = processKey;
						document.all.tend.onkeyup = processKey;
					</script>
					<li>&nbsp;</li>
					<li>
						<input class="btn" type="button" onclick="JavaScript:checkInfo()" value="&nbsp;��һ��&nbsp;"/>
						<input class="btn" type="button" onclick="JavaScript:document.mf_book.reset()" value="&nbsp;��&nbsp;&nbsp;��&nbsp;"/>
					</li>
					<li><br/><br/>����������ĸ�����Ϣ��������ȷ����ť�����г���ѡ�����д�*��Ϊ�����</li>
					<input type="hidden" name="action" value="zzSearch"/>
				</ul>
				</form>
				<form action="ManageServlet" method="post" name="mf_train" id="mf_train" style="display:none">
				<ul>
					<li>&nbsp;</li>
					<li><span class="book_error">*</span>&nbsp;&nbsp;&nbsp;&nbsp;����&nbsp;&nbsp;&nbsp;&nbsp;��<input id="tname" name="tname"/>
					<li>&nbsp;</li>
					<li>
						<input class="btn" type="button" onclick="JavaScript:checkMsg()" value="&nbsp;��һ��&nbsp;"/>
						<input class="btn" type="button" onclick="JavaScript:document.mf_train.reset()" value="&nbsp;��&nbsp;&nbsp;��&nbsp;"/>
					</li>
					<li><br/><br/>����������ĸ�����Ϣ��������ȷ����ť�����г���ѡ�����д�*��Ϊ�����</li>
					<input type="hidden" name="action" value="book"/>
				</ul>
			</form>
			</fieldset>
			<div class="list_hidden" id="city" border="1"></div>
			<%@ include file="tip.jsp" %>
		</div>
		</div>
	</body>
</html>


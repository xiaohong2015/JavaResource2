<%@ page contentType="text/html;charset=gbk" %>
<html>
	<head>
		<title>���û�ע��</title>
 		<link href="css/reg.css" type="text/css" rel="stylesheet"/>
 		<script language="JavaScript" src="script/trim.js"></script>
 		<script language="JavaScript" src="script/reg.js"></script>
 		<script language="JavaScript" src="script/general.js"></script>
	</head>
	<body onload="document.getElementById('uname').focus()">
		<div id="wrapper">
		<div id="branding"></div>
		<div id="content">
			<form action="ManageServlet" method="post" name="mf_reg">
			<p id="top">
				<a href="index.jsp">��ҳ</a>>><b>ע���ʺ�</b>
			</p>
			<p id="reg_name">
				<span class="reg_left">�û�����</span>
				<input name="uname" onfocus="JavaScript:document.all.reg_name.className='reg_bg_focus'" onblur="checkUname()"/>
				<span id="uname_explain"><font color="#909090">&nbsp;&nbsp;&nbsp;ֻ������ĸ(a-z)������(0-9)���»���(_)���� </font></span>
			</p>
			<p id="reg_first">
				<span class="reg_left">���룺</span>
				<input type="password" name="upwd_first" onblur="checkUpwd()" onfocus="JavaScript:document.all.reg_first.className='reg_bg_focus'"/>
				<span id="upwd_first_explain"><font color="#909090">&nbsp;&nbsp;&nbsp;&nbsp;����Ҫ����6λ���ϣ��Ҳ��ܰ����ո�Ӣ����ĸ���ִ�Сд</font></span>
			</p>
			<p id="reg_second">
				<span class="reg_left">�ٴ��������룺</span>
				<input type="password" name="upwd_second" onblur="checkSecUpwd()" onfocus="JavaScript:document.all.reg_second.className='reg_bg_focus'"/>
				<span id="upwd_second_explain"><font color="#909090">&nbsp;&nbsp;&nbsp;&nbsp;����Ҫ����6λ���ϣ��Ҳ��ܰ����ո�Ӣ����ĸ���ִ�Сд</font></span>
			</p>
			<p id="reg_gender">
				<span class="reg_left">�Ա�:</span>
				<input id="User_man" name="UserSex" type="radio" checked="true" value="��" style="cursor:hand"
							onfocus="JavaScript:document.all.reg_gender.className='reg_bg_focus'" 
							onblur="JavaScript:document.all.reg_gender.className=''"/>
				<img src="images/man.gif"/><label for="User_man" style="cursor:hand">&nbsp;&nbsp;����</label>
				<input id="User_woman" name="UserSex" type="radio" value="Ů" style="cursor:hand"
							onfocus="JavaScript:document.all.reg_gender.className='reg_bg_focus'" 
							onblur="JavaScript:document.all.reg_gender.className=''"/>
				<img src="images/woman.gif"/><label for="User_woman" style="cursor:hand">&nbsp;&nbsp;Ů��</label>
			</p>
			<p id="reg_yzm" style="height:70px">
				<span class="reg_left">�������Ҳ����֤�룺</span>
				<input name="identify" onfocus="JavaScript:document.all.reg_yzm.className='reg_bg_focus'"
						onblur="JavaScript:document.all.reg_yzm.className=''" />
				<span>&nbsp;&nbsp;&nbsp;&nbsp;<img id="yzm" src="yzm.jsp" valign="center"/>
				&nbsp;&nbsp;&nbsp;&nbsp;<a href="JavaScript:loadImg()">�������������ٻ�һ��</a></span>
			</p>
			<p>
				<span class="reg_left"></span>&nbsp;
				<input type="button"  id='subButton' value="&nbsp;&nbsp;ע&nbsp;��&nbsp;&nbsp;"  
					onclick="check_submit()"/>
			</p>
			<input type="hidden" name="action" value="register"/>
			</form>
		</div>
		</div>
	</body>
</html>
<%@ page contentType="text/html;charset=gbk" %>

<% 
	if(session.getAttribute("user")==null){
		session.setAttribute("flag","yes");
		session.setAttribute("url","/publishmsg.jsp");
		out.println("<script language='JavaScript'>alert('�����ȵ�¼������');window.location.href='index.jsp'</script>");
	}
	else{
 %>

<html>
	<head>
		<title>������Ϣ</title>
 		<link href="css/reg.css" type="text/css" rel="stylesheet"/>
 		<script language="JavaScript" src="script/trim.js"></script>
 		<script language="JavaScript" src="script/reg.js"></script>
 		<script language="JavaScript" src="script/publish.js"></script>
 		<script language="JavaScript" src="script/general.js"></script>
 		<script language="javascript" src="script/calendar.js"></script>
	</head>
	<body>
		<div id="wrapper">
		<div id="branding"></div>
		<div id="content">
			<form action="ManageServlet" method="post" name="mf_publish">
			<p id="top">
				<a href="index.jsp">��ҳ</a>>><b>������Ϣ</b>
			</p>
			<p id="p_type">
				<span class="reg_left">��ѡ����Ϣ���ͣ�</span>
				<select name="msg_type" onclick="JavaScript:document.all.p_type.className='reg_bg_focus'"
						onblur="JavaScript:document.all.p_type.className=''">
					<option value="2">&nbsp;&nbsp;��&nbsp;&nbsp;</option>
					<option value="1">&nbsp;&nbsp;ת��&nbsp;&nbsp;</option>
				</select>
				<font color="#909090">&nbsp;&nbsp;&nbsp;��ѡ����Ҫ�ķ�����Ϣ������</font>
			</p>
			<p id="p_level">
				<span class="reg_left">��ѡ��ϯ��</span>
				<select name="mlevel" onclick="JavaScript:document.all.p_level.className='reg_bg_focus'"
						onblur="JavaScript:document.all.p_level.className=''">
					<option value="��Ʊ">&nbsp;&nbsp;��Ʊ&nbsp;&nbsp;</option>
					<option value="����">&nbsp;&nbsp;����&nbsp;&nbsp;</option>
					<option value="����">&nbsp;&nbsp;����&nbsp;&nbsp;</option>
				</select>
				<font color="#909090">&nbsp;&nbsp;&nbsp;��ѡ����Ҫת��/�󹺳�Ʊ��ϯ���磺��Ʊ</font>
			</p>
			<p id="p_name">
				<span class="reg_left">�����복�ε����֣�</span>
				<input id="mname" name="mname"
						onclick="JavaScript:document.all.p_name.className='reg_bg_focus'"
						onblur="JavaScript:document.all.p_name.className=''"/>
				<font color="#909090">&nbsp;&nbsp;&nbsp;����д��Ҫ��/ת�õĳ��Σ��磺K39</font>
			</p>
			<p id="p_date">
				<span class="reg_left">��Ʊ���ڣ�</span>
				<input name="mtickettime" id="mtickettime"
						class="boxinput" onmouseout="calshow=false"
						onclick="JavaScript:showCalendar('mtickettime');this.blur();"
						onblur="JavaScript:document.all.p_date.className=''"/>
				<font color="#909090">&nbsp;&nbsp;&nbsp;����д��Ҫת��/�󹺳�Ʊ�����ڣ���ʽyyyy-mm-dd</font>
			</p>
			<p id="p_amount">
				<span class="reg_left">��Ʊ������</span>
				<input name="mamount" id="mamount"
						onclick="JavaScript:document.all.p_amount.className='reg_bg_focus'"
						onblur="JavaScript:document.all.p_amount.className=''"/>
				<font color="#909090">&nbsp;&nbsp;&nbsp;����д��Ҫת��/�󹺳�Ʊ��������ֻ��Ϊ���֣��Ҳ���Ϊ0</font>
			</p>
			<p id="p_start">
				<span class="reg_left">�������У�</span>
				<input name="mstart"
						onclick="JavaScript:document.all.p_start.className='reg_bg_focus'"
						onblur="JavaScript:document.all.p_start.className=''"/>
				<font color="#909090">&nbsp;&nbsp;&nbsp;����д��ĳ������У��磺��ɽ</font>
			</p>
			<p id="p_end">
				<span class="reg_left">Ŀ�ĳ��У�</span>
				<input name="mend"
						onclick="JavaScript:document.all.p_end.className='reg_bg_focus'"
						onblur="JavaScript:document.all.p_end.className=''"/>
				<font color="#909090">&nbsp;&nbsp;&nbsp;����д���Ŀ�ĳ��У��磺����</font>
			</p>
			<p id="p_price">
				<span class="reg_left">��Ʊ�۸�</span>
				<input name="mticketprice"
						onclick="JavaScript:document.all.p_price.className='reg_bg_focus'"
						onblur="JavaScript:document.all.p_price.className=''"/>
				<font color="#909090">&nbsp;&nbsp;&nbsp;����д��Ʊ�ļ۸�Ҳ�ɲ��Ĭ��Ϊ������</font>
			</p>
			<p id="p_linkman">
				<span class="reg_left">��ϵ�ˣ�</span>
				<input name="mlinkman"
						onclick="JavaScript:document.all.p_linkman.className='reg_bg_focus'"
						onblur="JavaScript:document.all.p_linkman.className=''"/>
				<font color="#909090">&nbsp;&nbsp;&nbsp;����д��ϵ�˵��������磺���ݳ�</font>
			</p>
			<p id="p_tel">
				<span class="reg_left">��ϵ�绰��</span>
				<input name="mtel"
						onclick="JavaScript:document.all.p_tel.className='reg_bg_focus'"
						onblur="JavaScript:document.all.p_tel.className=''"/>
				<font color="#909090">&nbsp;&nbsp;&nbsp;����д�����ϵ�绰���磺0315-3860548</font>
			</p>
			<p id="p_content">
				<span class="reg_left">��Ϣ���ݣ�</span>
				<textarea cols="50" rows="3" name="mmsg"
					onclick="JavaScript:document.all.p_content.className='reg_bg_focus'"
					onblur="JavaScript:document.all.p_content.className=''"
				>�ڴ�������Ҫ��������Ϣ</textarea>
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
				<input type="button"  id='subButton' value="&nbsp;&nbsp;��&nbsp;��&nbsp;&nbsp;"  
					onclick="JavaScript:checkPublishMsg()"/>
			</p>
			<input type="hidden" name="action" value="publish"/>
			</form> 
			<%@ include file="calendar.jsp" %>
		</div>
		<%@ include file="tip.jsp" %>
		</div>
	</body>
</html>
<% 
	}
 %>
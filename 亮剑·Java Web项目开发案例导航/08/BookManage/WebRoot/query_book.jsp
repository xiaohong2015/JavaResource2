<%@ page contentType="text/html;charset=gbk"%><html>
<jsp:useBean id="status" class="wyf.wyy.StatusBean" scope="session"/>
<head>
 	<title></title>
 	<script language="JavaScript" src="images/trim.js"></script>
 	<link href="images/div.css" type="text/css" rel=stylesheet> 	
 	<link href="images/globalstyle.css" type="text/css" rel=stylesheet>
 	<script language="JavaScript">
 		function show(search){
 			if(search=="simple"){
 				document.getElementById(search).style.display='block'; 
 				document.getElementById('complex').style.display='none';			
 			}
 			if(search=="complex"){
 				document.getElementById(search).style.display='block';
 				document.getElementById('simple').style.display='none';	 			
 			}
 		}
 	</script>
 </head>
 <body>
 	<div id="father">
 		<div id="condition">������ʽ��
 			<input type="radio" name="tj" checked="true" onclick="show('simple')">������
			<input type="radio" name="tj" onclick="show('complex')">��������
 		</div>					
 		<div id="search">
			<form name="jd" action="StudentServlet?action=simple" method="post">
				<table border="0" id="simple">
					<tr>
						<td align="right">������ؼ��֣�</td>
						<td><input type="text" name="key"/></td>
					</tr>
					<tr>
						<td align="right">ѡ���ѯ������</td>
						<td>
							<select name="condition">
								<option value="BookName" selected>����</option>
								<option value="Author" size="5">����</option>
								<option value="Publish">������</option>
								<option value="BookIsbn">ISBN��</option>
							</select>
						</td>
					</tr>
					<tr>
						<td></td>
						<td>
							<img id="ssa" src="images/ssa.gif" onclick="submit()"
							  	onmouseover="document.all.ssa.src='images/ssb.gif'"
							   	onmouseout="document.all.ssa.src='images/ssa.gif'"
							    onmousedown="document.all.ssa.src='images/ssc.gif'"
							    style="cursor:hand">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<!--<input type="submit" value="����"/>  
							<input type="reset" value="����">-->
							<img src="images/qka.gif" id="qka" onclick="reset()" 
								onmouseover="document.all.qka.src='images/qkb.gif'"
							 	onmouseout="document.all.qka.src='images/qka.gif'"
							  	onmousedown="document.all.qka.src='images/qkc.gif'"
							   	onmouseup="document.all.qka.src='images/qkb.gif'"
							  	style="cursor:hand" >
						</td>
					</tr>
				</table>
			</form>
			<form name="fz" action="StudentServlet?action=complex" method="post">
				<table border="0" id="complex" style="display:none;">
					<tr>
						<td align="right">������</td>
						<td><input type="text" name="BookName" size="24"/></td>
					</tr>
					<tr>
						<td align="right">���ߣ�</td>
						<td><input type="text" name="Author" size="24"/></td>
					</tr>
					<tr>
						<td align="right">�����磺</td>
						<td><input type="text" name="Publish" size="24"/></td>
					</tr>
					<tr>
						<td></td>
						<td>
							<img id="ss" src="images/ssa.gif" onclick="submit()"
							  	onmouseover="document.all.ss.src='images/ssb.gif'"
							   	onmouseout="document.all.ss.src='images/ssa.gif'"
							    onmousedown="document.all.ss.src='images/ssc.gif'"
							    style="cursor:hand">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<img src="images/qka.gif" id="qk" onclick="reset()" 
								onmouseover="document.all.qk.src='images/qkb.gif'"
							 	onmouseout="document.all.qk.src='images/qka.gif'"
							  	onmousedown="document.all.qk.src='images/qkc.gif'"
							   	onmouseup="document.all.qk.src='images/qkb.gif'"
							  	style="cursor:hand" >
						</td>
					</tr>
				</table>
			</form>
 		</div>
 		<div id="message">
 		 ��ʾ��
 		  <ul>
	 		  <li>ͼ������ڹؼ����ı�������ؼ���</li><br/><br/>
	 		  <li>���ҷ�ʽĬ��Ϊģ������</li><br/><br/>
	 		  <li>�ؼ���Ϊ����Ĭ����������ͼ��</li><br/><br/>
	 		  <li>���������б����ѡ��ͬ�����������в���</li>
 		  </ul>
 		</div>
 	</div>
 </body>
</html>
<%@ page contentType="text/html; charset=gb2312" language="java" errorPage="" %>
<%@ taglib uri="struts-html" prefix="html" %>
<% String path=request.getContextPath(); %>
<html>
	<head>
		<html:base/>
		<title>���³�����Ϣ</title>
	</head>
	<body bgcolor="#075B97">
		<center>
			<table width="965" border="0" cellpadding="0" cellspacing="0">
				<tr><td colspan="4"><jsp:include page="/top.jsp"/></td></tr>
				<tr bgcolor="#EDEEFF">
					<td width="13" background="<%=path%>/image/left.jpg"></td>
					<td align="center" valign="top" bgcolor="#EDEEFF"><jsp:include page="/side.jsp"/></td>
					<td width="720" align="center" valign="top"  bgcolor="#E8F1F6">
        				<br><br>
  						<table><tr><td><html:errors/></td></tr></table>
  						<html:form action="/money/money_cars_update.do?updatetype=update" focus="maker">
  						<table width="90%" border="5" cellspacing="0" cellpadding="5" bordercolor="#F0F0F0" bordercolorlight="#1687AF" bordercolordark="#E8F1F6" rules="none" bgcolor="white">
        					<tr><td height="25" align="center">���³�����Ϣ</td></tr>
	        				<tr>
    	      					<td height="310" align="center" valign="middle">
			            			<table width="100%"  border="1" cellspacing="0" cellpadding="0" bordercolor="lightgrey" bordercolorlight="lightgrey" bordercolordark="white">
            	  						<tr>
                							<td width="23%" height="30" align="right" valign="middle" bgcolor="#B9D9E9">�ƺ�:&nbsp;</td>
                							<td height="30">&nbsp;<html:text property="number" style="border:0" readonly="true"/></td>
              							</tr>
              							<tr valign="middle">
                							<td height="30" align="right" valign="middle" bgcolor="#B9D9E9">�ͺ�:&nbsp;</td>
                							<td height="30" align="left">&nbsp;<html:text property="model" style="border:0" readonly="true"/></td>
	              						</tr>
    	          						<tr valign="middle">
        	        						<td height="30" align="right" valign="middle" bgcolor="#B9D9E9">�������ͺ�:&nbsp;</td>
            	    						<td height="30" align="left">&nbsp;<html:text property="fdj" style="border:0" readonly="true"/></td>
              							</tr>
              							<tr valign="middle">
                							<td height="30" align="right" valign="middle" bgcolor="#B9D9E9">��������:&nbsp;</td>
                							<td height="30" align="left">&nbsp;<html:text property="maker" size="65"/></td>
              							</tr>
              							<tr valign="middle">
	                						<td height="30" align="right" valign="middle" bgcolor="#B9D9E9">˾������:&nbsp;</td>
    	            						<td height="30" align="left">&nbsp;<html:text property="driver" size="65"/></td>
        	      						</tr>
            	  						<tr valign="middle">
                							<td height="30" align="right" valign="middle" bgcolor="#B9D9E9">��������:&nbsp;</td>
                							<td height="30" align="left">&nbsp;<html:text property="buytime" size="45"/> [��ʽ:2008-08-08]</td>
              							</tr>
              							<tr valign="middle">
                							<td height="30" align="right" valign="middle" bgcolor="#B9D9E9">״̬:&nbsp;</td>
	                						<td height="30" align="left">
    	            							&nbsp;<html:select property="status">
        	                                    		<html:options collection="carstatustypelist" property="value" labelProperty="label"/>&nbsp;
            	                                      </html:select>
                							</td>
              							</tr>
              							<tr valign="middle">
                							<td height="30" align="right" valign="middle" bgcolor="#B9D9E9">������:&nbsp;</td>
                							<td height="30" align="left">&nbsp;<html:text property="njinfo" size="65"/></td>
              							</tr>
	              						<tr valign="middle">
    	            						<td height="73" align="right" valign="middle" bgcolor="#B9D9E9">��������:&nbsp;</td>
        	        						<td height="73" align="left">&nbsp;<html:textarea property="info" rows="5" cols="54"/></td>
            	  						</tr>
          							</table>
          						</td>
        					</tr>
	        				<tr valign="middle">
    	      					<td height="23" align="center" valign="middle">
        	   						<html:submit value="����"/>
           							<html:reset value="����"/>
          						</td>
        					</tr>
	      				</table>
    	  				</html:form>
					</td>
					<td width="13" background="<%=path%>/image/right.jpg"></td>
				</tr>
				<tr><td colspan="4"><jsp:include page="/end.jsp"/></td></tr>
			</table>
		</center>
	</body>
</html>
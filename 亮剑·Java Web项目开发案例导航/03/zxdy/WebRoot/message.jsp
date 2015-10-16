<%@page contentType="text/html;charset=gbk"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<html>
	<head>
	  <title>
	    <s:text name="index.title"/>	    
	  </title>
	  <link rel="stylesheet" type="text/css" href="css/style1.css" />
	  <script language="JavaScript">
       var count = 2;
       function myTimer(){
          if(count!=0){
            count--;
            setTimeout("myTimer()",1000);
          }
          else{
            window.location.href=("<s:property value="url"/>");
          }
       }
     </script>
	</head>	
	<body onload="myTimer();">
		<s:include value="top.jsp"/>
		<div id="nav">
		<table>
			<tr>
				<td>
					<a href="IndexAction.action"><s:text name="msg.nav"/></a>
	   				&raquo;&nbsp;提示信息
				</td>
			</tr>
		</table>
		</div>
		<div class="messagebox">
			<h1>东城在线提示您：</h1>
			<p><s:property value="message"/></p>
			<p><a href="IndexAction.action">点此处去主页</a></p>
			<p><a href="<s:property value="url"/>">如果浏览器没有自动跳转，请点此处</a></p>		
		</div>
		<img src="images/bottom.jpg" border="0" width="100%" height="60"/>
	</body>
</html>
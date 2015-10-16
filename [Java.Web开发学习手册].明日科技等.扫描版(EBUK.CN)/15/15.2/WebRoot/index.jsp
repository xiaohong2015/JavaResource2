<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<jsp:directive.page import="bean.SAXBean" />
<jsp:directive.page import="javax.xml.parsers.SAXParserFactory" />
<jsp:directive.page import="javax.xml.parsers.SAXParser" />
<jsp:directive.page import="org.xml.sax.XMLReader" />
<jsp:directive.page import="org.xml.sax.InputSource" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>使用SAX读取XML文件</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<style>
		td{
		font-size: 9pt;
		}
		</style>
	</head>
	<body>
		<table width="488" border="1" cellspacing="0" cellpadding="0">
			<tr align="center" bgcolor="#00CCFF">
				<td colspan="4" align="center" valign="middle" height="30">
					使用SAX读取XML文件
				</td>
			</tr>
			<tr bgcolor="#FF9900">
				<td>编号</td>
				<td>书名</td>
				<td>书名</td>
				<td>书名</td>
			</tr>
			<%
				SAXParserFactory spf = SAXParserFactory.newInstance();
				SAXParser sp = spf.newSAXParser();
				SAXBean bean = new SAXBean();
				XMLReader xr = sp.getXMLReader();
				xr.setContentHandler(bean);
				InputSource source = new InputSource(application
						.getResourceAsStream("book.xml"));
				xr.parse(source);
				String[][] element = bean.getElements();
				for (int j = 0; j < 2; j++) {
					out.println("<tr bgcolor='#CC99FF'>");
					for (int i = 0; i < 4; i++) {
			%>
			<td>
				<%=element[j][i]%>
			</td>
			<%
					}
					out.println("</tr>");
				}
			%>
		</table>
	</body>
</html>

<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<jsp:directive.page import="javax.xml.parsers.DocumentBuilderFactory" />
<jsp:directive.page import="javax.xml.parsers.DocumentBuilder" />
<jsp:directive.page import="org.w3c.dom.Document" />
<jsp:directive.page import="org.w3c.dom.NodeList" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>使用DOM读取XML文件</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
	</head>
	<body>
		<table width="488" border="1" cellspacing="0" cellpadding="0">
			<tr align="center" bgcolor="#00CCFF">
				<td colspan="4">
					<h1>
						使用DOM读取XML文件
					</h1>
				</td>
			</tr>
			<tr bgcolor="#FF9900">
				<td>
					编号
				</td>
				<td>
					书名
				</td>
				<td>
					出版社
				</td>
				<td>
					书名
				</td>
			</tr>
			<%
				DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
				dbf.setIgnoringElementContentWhitespace(true);
				DocumentBuilder db = dbf.newDocumentBuilder();
				Document doc = db.parse(pageContext.getServletContext()
						.getResourceAsStream("xml/book.xml"));
				NodeList ids = doc.getElementsByTagName("id");
				NodeList names = doc.getElementsByTagName("name");
				NodeList publishs = doc.getElementsByTagName("publish");
				NodeList prices = doc.getElementsByTagName("price");
				for (int i = 0; i < names.getLength(); i++) {
			%>
			<tr bgcolor="#CC99FF">
				<td>
					<%=ids.item(i).getFirstChild().getNodeValue()%>
				</td>
				<td>
					<%=names.item(i).getFirstChild().getNodeValue()%>
				</td>
				<td>
					<%=publishs.item(i).getFirstChild().getNodeValue()%>
				</td>
				<td>
					<%=prices.item(i).getFirstChild().getNodeValue()%>
				</td>
			</tr>
			<%
			}
			%>
		</table>
	</body>
</html>

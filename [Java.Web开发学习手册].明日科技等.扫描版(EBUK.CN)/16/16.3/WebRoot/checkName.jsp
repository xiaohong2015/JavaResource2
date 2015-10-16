<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<jsp:useBean class="com.ConnDB" scope="page" id="conn"></jsp:useBean>
<%
request.setCharacterEncoding("GB2312");
String username=request.getParameter("username");
ResultSet rs=conn.executeQuery("select * from tb_user where username='"+username+"'");
if (rs.next()){
	out.println("很报歉!用户名["+username+"]已经被注册!");
}else{
	out.println("祝贺您!用户名["+username+"]没有被注册!");
}
%>

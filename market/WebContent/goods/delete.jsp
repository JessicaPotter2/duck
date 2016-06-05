<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*,javax.sql.*,eb.java.imall.DbUtil"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>处理删除商品请求</title>
</head>
<body>
<%
 	Connection conn=DbUtil.getConnection();
 	Statement stmt=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
 	String goodsID=request.getParameter("goodsID");
	ResultSet rs=stmt.executeQuery("select * from addgoods where goodsID='"+goodsID+"'");
	rs.first();
	rs.deleteRow();
	rs.close();
	conn.close();
	out.print("<script language='javascript'>alert('删除商品成功');window.location.href='delete.jsp';</script>");
 
 %>
</body>
</html>
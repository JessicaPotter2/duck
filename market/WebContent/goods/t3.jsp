<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*,javax.sql.*,eb.java.imall.DbUtil"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>删除类别</title>
</head>
<body>
<%
Connection conn=DbUtil.getConnection();
String id=request.getParameter("id");
String goodsType=request.getParameter("goodsType");
	Statement stmt=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
ResultSet rs=stmt.executeQuery("select * from Type where id='"+id+"'");
rs.first();
rs.deleteRow();
rs.close();
Statement stmt2=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
ResultSet rs2=stmt2.executeQuery("select * from addgoods where goodsType='"+goodsType+"'");
rs2.first();
rs2.deleteRow();
rs2.close();
conn.close();
out.print("<script language='javascript'>alert('删除商品成功');window.location.href='l6.jsp';</script>");
%>
</body>
</html>
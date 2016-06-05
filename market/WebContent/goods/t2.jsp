<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*,javax.sql.*,eb.java.imall.DbUtil"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改商品类别</title>
</head>
<body>
<%
	Connection conn=DbUtil.getConnection();

String id1=request.getParameter("id1");
String id2=request.getParameter("id2");
String goodsType1=request.getParameter("goodsType1");
String goodsType2=request.getParameter("goodsType2");
Statement stmt=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
ResultSet rs=stmt.executeQuery( "select * from Type where id='"+id1+"'");
rs.first();
rs.updateString(1,id2);
rs.updateString(2,goodsType2);
rs.updateRow();
stmt.close();
Statement stmt2=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
ResultSet rs2=stmt2.executeQuery( "select * from addgoods where goodsType='"+goodsType1+"'");
rs2.first();
rs2.updateString(6,goodsType2);
rs2.updateRow();
stmt2.close();
conn.close();
	out.print("<script language='javascript'>alert('修改商品类别成功');window.location.href='l6.jsp';</script>");
%>
</body>
</html>
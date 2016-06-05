<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*,javax.sql.*,eb.java.imall.DbUtil"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加商品类别</title>
</head>
<body>
<%
	Connection conn=DbUtil.getConnection();

String id=request.getParameter("id");
String goodsType=request.getParameter("goodsType");
	PreparedStatement stmt=conn.prepareStatement("insert into Type(id,goodsType) values(?,?)",ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
	stmt.setString(1, id);
	stmt.setString(2, goodsType);
	stmt.executeUpdate();
	stmt.clearParameters();
	stmt.close();
	conn.close();
	out.print("<script language='javascript'>alert('添加商品类别成功');window.location.href='l6.jsp';</script>");
%>
</body>
</html>
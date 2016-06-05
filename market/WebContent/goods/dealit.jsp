<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*,javax.sql.*,eb.java.imall.DbUtil"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>已完成订单处理</title>
</head>
<body>
<%
Connection conn=DbUtil.getConnection();
int orderID=0;
if(request.getParameter("order")==null){
}else{orderID=Integer.valueOf(request.getParameter("order"));
}
String goodsID=request.getParameter("goods");
int quantity=0;
if(request.getParameter("quantity")==null){
}else{quantity=Integer.valueOf(request.getParameter("quantity"));
}
String loginName=request.getParameter("username");

String goodsType=request.getParameter("goodsType");
PreparedStatement stmt=conn.prepareStatement("insert into orderdetail(orderID,goodsID,quantity,loginName,goodsType) values(?,?,?,?,?)",ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
stmt.setInt(1, orderID);
stmt.setString(2, goodsID);
stmt.setInt(3, quantity);
stmt.setString(4, loginName);
stmt.setString(5, goodsType);
stmt.executeUpdate();
stmt.clearParameters();
stmt.close();
conn.close();
out.print("<script language='javascript'>alert('已完成订单处理完成');window.location.href='deal.jsp';</script>");
%>
</body>
</html>
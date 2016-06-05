<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*,javax.sql.*,eb.java.imall.DbUtil"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改商品</title>
</head>
<body>
<% 
Connection conn=DbUtil.getConnection();

String goodsID=request.getParameter("goodsID");
String goodsName=request.getParameter("goodsName");
double goodsPrice=0.0;
if(request.getParameter("goodsPrice")==null){
}else{
	goodsPrice=Double.parseDouble(request.getParameter("goodsPrice"));
}
String description=request.getParameter("description");
String goodsType=request.getParameter("goodsType");
int quantity=0;
if(request.getParameter("quantity")==null){
	}else{quantity=Integer.valueOf(request.getParameter("quantity"));
}
Statement stmt=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
ResultSet rs=stmt.executeQuery( "select * from addgoods where goodsID='"+goodsID+"'");
rs.first();
rs.updateString(1, goodsID);
rs.updateString(2, goodsName);
rs.updateDouble(3, goodsPrice);
rs.updateString(4, description);
rs.updateString(6, goodsType);
rs.updateInt(7, quantity);
rs.updateRow();
stmt.close();
conn.close();
out.print("<script language='javascript'>alert('修改成功');window.location.href='modify.jsp';</script>");
%>
</body>
</html>
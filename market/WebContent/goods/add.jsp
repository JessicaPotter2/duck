<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*,javax.sql.*,eb.java.imall.DbUtil"%>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加商品</title>
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
String goodsImage=request.getParameter("goodsImage");
String goodsType=request.getParameter("goodsType");
int quantity=0;
if(request.getParameter("quantity")==null){
	}else{quantity=Integer.valueOf(request.getParameter("quantity"));
}

	PreparedStatement stmt=conn.prepareStatement("insert into addgoods(goodsID,goodsName,goodsPrice,description,goodsImage,goodsType,quantity) values(?,?,?,?,?,?,?)",ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
	stmt.setString(1, goodsID);
	stmt.setString(2, goodsName);
	stmt.setDouble(3, goodsPrice);
	stmt.setString(4, description);
	stmt.setString(5, goodsImage);
	stmt.setString(6, goodsType);
	stmt.setInt(7, quantity);
	stmt.executeUpdate();
	stmt.clearParameters();
	stmt.close();
	conn.close();
	out.print("<script language='javascript'>alert('添加商品成功');window.location.href='addgoods.jsp';</script>");
%>
</body>
</html>
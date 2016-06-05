<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*,javax.sql.*,eb.java.imall.DbUtil"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查看库存</title>
</head>
<body>
<center><img src="../images/header2.jpg"/></center>
<a href="../myTree.jsp">返回商品管理界面</a>
<% String goodsID=request.getParameter("goodsID");
Connection conn=DbUtil.getConnection();
PreparedStatement stmt2=conn.prepareStatement("select quantity from addgoods where goodsID=?");
stmt2.setString(1,goodsID);
ResultSet rs2= stmt2.executeQuery();
int total2=0;
while(rs2.next()){
	 total2=rs2.getInt("quantity");
	//session.setAttribute("total1",total1);
}
out.println("<br/>"+goodsID+"原库存为"+total2+"<br/>");
rs2.close();

int total1=0;
PreparedStatement stmt=conn.prepareStatement("select quantity from orderdetail where goodsID=?");
stmt.setString(1,goodsID);
ResultSet rs= stmt.executeQuery();
//遍历查询
while(rs.next()){
	int quantity=rs.getInt("quantity");
	 total1=total1+quantity;
	 
//	int total2=(int)session.getAttribute("total2");
	
}
int total3=total2-total1;
out.println(goodsID+"现有库存"+total3);
rs.close();
conn.close();
%>
</body>
</html>
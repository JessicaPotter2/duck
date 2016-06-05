<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>购买成功</title>
</head>
<body>
当前用户:<%=(String)session.getAttribute("user") %>
<center><img src="images/header.jpg"/></center>
<center><h1>购买成功，欢迎您再次光临</h1></center>
<center><h3><a href="shoppingcart/comment.jsp">去评价</a></h3></center>
<center><h2><a href="index.jsp">继续购物</a></h2></center>
<center><img src="images/success.gif"/></center>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<sql:setDataSource dataSource="jdbc/imall" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>未完成订单处理</title>
<style type="text/css">
	form { width: 400px; margin: 200px auto; }
</style>
</head>
<body>
<center><img src="../images/header2.jpg"/></center>
<a href="../myTree.jsp">返回商品管理界面</a>
<sql:query sql="select * from goodsorderinfo where ispaied='unpaied'" var="order" />
<sql:query sql="select * from undealorder" var="detail" />
<center>
<form name="setform" action="detail2.jsp" method="post">
<p>
			<label for="username">用户名:</label>
			<input type="text" name="username" id="username" />
		</p>
<p>
			<label for="order">订单编号:</label>
			<input type="text" name="order" id="order" />
		</p>
		<p>
			<label for="goods">商品编号:</label>
			<input type="text" name="goods" id="goods" />
		</p>
		<p>
			<label for="quantity">商品数量:</label>
			<input type="text" name="quantity" id="quantity" />
		</p>
		<p>
			<label for="goodsType">商品类别:</label>
			<input type="text" name="goodsType" id="goodsType" />
		</p>
<p>
			<input type="submit" value="登记" />
			<input type="reset" value="重置" /><br/>
</p>
</form>
</center>
<table border="1" width="100%">
<center><h3>未完成订单</h3></center>
<tr>
<th>用户名</th>
<th>订单编号</th>
<th>订单内容</th>
</tr>
<c:forEach var="goodsorderinfo" items="${order.rows}">
<tr>
<td><c:out value="${goodsorderinfo.loginName}"/></td>
<td><c:out value="${goodsorderinfo.orderID}"/></td>
<td><c:out value="${goodsorderinfo.content}"/></td>
</tr>
</c:forEach>
</table>
<table border="1" width="100%">
<center><h3>处理结果</h3></center>
<tr>
<th>用户名</th>
<th>订单编号</th>
<th>商品编号</th>
<th>商品数量</th>
<th>商品类别</th>
</tr>
<c:forEach var="undealorder" items="${detail.rows}">
<tr>
<td><c:out value="${undealorder.loginName}"/></td>
<td><c:out value="${undealorder.orderID}"/></td>
<td><c:out value="${undealorder.goodsID}"/></td>
<td><c:out value="${undealorder.quantity}"/></td>
<td><c:out value="${undealorder.goodsType}"/></td>
</tr>
</c:forEach>
</table>
</body>
</html>
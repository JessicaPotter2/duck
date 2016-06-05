<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<sql:setDataSource dataSource="jdbc/imall" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的订单</title>
</head>
<body>
<center><img src="../images/header.jpg"/></center>
<a href="../index.jsp">回到主页</a>
<%String loginName=(String)session.getAttribute("user"); %>

<c:set var="loginName" value="${sessionScope.user }"/>
<sql:query sql="select * from goodsorderinfo where loginName='${loginName}' and ispaied='paied'" var="order" />
<table border="1" width="100%">
<center><h3>已完成订单</h3></center>
<tr>
<th>姓名</th>
<th>地址</th>
<th>邮编</th>
<th>联系方式</th>
<th>总价</th>
<th>订单内容</th>
<th>订单编号</th>
<th>付款状态</th>
<th>用户</th>
</tr>
<c:forEach var="goodsorderinfo" items="${order.rows}">
<tr>
<td><c:out value="${goodsorderinfo.customerName}"/></td>
<td><c:out value="${goodsorderinfo.address}"/></td>
<td><c:out value="${goodsorderinfo.ZipCode}"/></td>
<td><c:out value="${goodsorderinfo.telephone}"/></td>
<td><c:out value="${goodsorderinfo.totalPrice}"/></td>
<td><c:out value="${goodsorderinfo.content}"/></td>
<td><c:out value="${goodsorderinfo.orderID}"/></td>
<td><c:out value="${goodsorderinfo.ispaied}"/></td>
<td><c:out value="${goodsorderinfo.loginName}"/></td>
</tr>
</c:forEach>
</table>
<sql:query sql="select * from goodsorderinfo where loginName='${loginName}'and ispaied='unpaied'" var="order" />
<table border="1" width="100%">
<center><h3>未完成订单</h3></center>
<tr>
<th>姓名</th>
<th>地址</th>
<th>邮编</th>
<th>联系方式</th>
<th>总价</th>
<th>订单内容</th>
<th>订单编号</th>
<th>付款状态</th>
<th>用户</th>
</tr>
<c:forEach var="goodsorderinfo" items="${order.rows}">
<tr>
<td><c:out value="${goodsorderinfo.customerName}"/></td>
<td><c:out value="${goodsorderinfo.address}"/></td>
<td><c:out value="${goodsorderinfo.ZipCode}"/></td>
<td><c:out value="${goodsorderinfo.telephone}"/></td>
<td><c:out value="${goodsorderinfo.totalPrice}"/></td>
<td><c:out value="${goodsorderinfo.content}"/></td>
<td><c:out value="${goodsorderinfo.orderID}"/></td>
<td><c:out value="${goodsorderinfo.ispaied}"/></td>
<td><c:out value="${goodsorderinfo.loginName}"/></td>
</tr>
</c:forEach>
</table>
</body>
</html>
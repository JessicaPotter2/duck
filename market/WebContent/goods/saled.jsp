<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<sql:setDataSource dataSource="jdbc/imall" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>销售统计</title>
</head>
<body>
<center><img src="../images/header2.jpg"/></center>
<a href="../myTree.jsp">返回商品管理界面</a>
<sql:query sql="select * from orderdetail" var="detail" />
<center>
<table border="1" width="50%">
<center><h3>商品销售数量</h3></center>
<tr>
<th>商品类别</th>
<th>商品编号</th>
<th>商品数量</th>
</tr>
<c:forEach var="orderdetail" items="${detail.rows}">
<tr>
<td><c:out value="${orderdetail.goodsType}"/></td>
<td><c:out value="${orderdetail.goodsID}"/></td>
<td><c:out value="${orderdetail.quantity}"/></td>
</tr>
</c:forEach>
</table>
</center>
</body>
</html>
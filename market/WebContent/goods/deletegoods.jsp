<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<sql:setDataSource dataSource="jdbc/imall" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>删除商品</title>
<style type="text/css">
	form { width: 300px; margin: 200px auto; }
</style>
</head>
<body>
<center><img src="../images/header2.jpg"/></center>
<a href="../myTree.jsp">返回商品管理界面</a>
<sql:query sql="select * from addgoods" var="del" />
<form method="post" action="delete.jsp">
		<p>
			<label for="goodsID">要删除的商品编号:</label>
			<input type="text" name="goodsID" id="goodsID" />
		</p>
		<p>
			<input type="submit" value="删除商品" />
		</p>
	</form>
	<table border="1" width="100%">
<tr>
<th>商品编号</th>
<th>商品名称</th>
<th>商品价格</th>
<th>商品描述</th>
<th>商品类别</th>
<th>商品数量</th>
</tr>
<c:forEach var="addgoods" items="${del.rows}">
<tr>
<td><c:out value="${addgoods.goodsID}"/></td>
<td><c:out value="${addgoods.goodsName}"/></td>
<td><c:out value="${addgoods.goodsPrice}"/></td>
<td><c:out value="${addgoods.description}"/></td>
<td><c:out value="${addgoods.goodsType}"/></td>
<td><c:out value="${addgoods.quantity}"/></td>
</tr>
</c:forEach>
</table>
</body>
</html>
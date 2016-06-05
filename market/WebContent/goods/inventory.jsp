<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*,javax.sql.*,eb.java.imall.DbUtil"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<sql:setDataSource dataSource="jdbc/imall" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查看库存</title>
</head>
<body>
<center><img src="../images/header2.jpg"/></center>
<a href="../myTree.jsp">返回商品管理界面</a>
<center>
<form method="get" action="inv.jsp" >
		<p>
			<label for="goodsID">商品编号:</label>
			<input type="text" name="goodsID" id="goodsID" />
		</p>
		<p>
			<input type="submit" value="查询库存" />
		</p>
		</form></center>
<sql:query sql="select * from addgoods" var="add" />
<center>
		<table border="1" width="60%">
		
<tr>
<th>商品编号</th>
<th>商品名称</th>
<th>商品类别</th>
<th>商品数量</th>
</tr>
<c:forEach var="addgoods" items="${add.rows}">
<tr>
<td><c:out value="${addgoods.goodsID}"/></td>
<td><c:out value="${addgoods.goodsName}"/></td>
<td><c:out value="${addgoods.goodsType}"/></td>
<td><c:out value="${addgoods.quantity}"/></td>
</tr>
</c:forEach>
</table>
</center>
</body>
</html>
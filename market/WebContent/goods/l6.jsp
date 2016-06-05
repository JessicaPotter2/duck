<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<sql:setDataSource dataSource="jdbc/imall" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>商品类别</title>
</head>
<body>
<center><img src="../images/header2.jpg"/></center>
<a href="../myTree.jsp">返回商品管理界面</a>
<center>
<form method="get" action="t1.jsp" >
		<p>
			<label for="id">类别编号:</label>
			<input type="text" name="id" id="id" />
		</p>
		<p>
			<label for="goodsType">类别名称:</label>
			<input type="text" name="goodsType" id="goodsType" />
		</p>
		<p>
			<input type="submit" value="添加" />
		</p>
		</form></center>
<center>
<form method="get" action="t2.jsp" >
		<p>
			<label for="id1">原类别编号:</label>
			<input type="text" name="id1" id="id1" />
		</p>
		<p>
			<label for="id2">现类别编号:</label>
			<input type="text" name="id2" id="id2" />
		</p>
		<p>
			<label for="goodsType1">原类别名称:</label>
			<input type="text" name="goodsType1" id="goodsType1" />
		</p>
		<p>
			<label for="goodsType2">现类别名称:</label>
			<input type="text" name="goodsType2" id="goodsType2" />
		</p>
		<p>
			<input type="submit" value="修改" />
		</p>
		</form></center>
	<center>
<form method="get" action="t3.jsp" >
		<p>
			<label for="id">类别编号:</label>
			<input type="text" name="id" id="id" />
		</p>
		<p>
			<label for="goodsType">类别名称:</label>
			<input type="text" name="goodsType" id="goodsType" />
		</p>
		<p>
			<input type="submit" value="删除" />
		</p>
		</form></center>
		<center>
<sql:query sql="select * from Type" var="Type" />
<table border="0" width="40%">
<center><h3>商品类别</h3></center>
<tr>
<th bgcolor="#bed5fe">类别编号</th>
<th bgcolor="#b4cde6">商品类别</th>
</tr>
<c:forEach var="Type" items="${Type.rows}">
<tr>
<td bgcolor="#b4cde6"><c:out value="${Type.id}"/></td>
<td bgcolor="#bed5fe"><c:out value="${Type.goodsType}"/></td>
</tr>
</c:forEach>
</table>
</center>
</body>
</html>
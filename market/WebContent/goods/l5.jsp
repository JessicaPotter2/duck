<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<sql:setDataSource dataSource="jdbc/imall" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>类别查看</title>
</head>
<body>
<center><img src="../images/header2.jpg"/></center>
<a href="../myTree.jsp">返回商品管理界面</a>
<%String goodsType=request.getParameter("goodsType");
%>
<sql:query sql="select * from addgoods where goodsType='${param.goodsType}'" var="addgoods" />
<table border="0" width="100%">
<center><h3><%out.print(goodsType); %></h3></center>
<tr>
<th bgcolor="#bed5fe">商品图片</th>
<th bgcolor="#b4cde6">商品类别</th>
<th bgcolor="#bed5fe">商品编号</th>
<th bgcolor="#b4cde6">商品名称</th>
<th bgcolor="#bed5fe">商品价格</th>
<th bgcolor="#b4cde6">商品描述</th>
<th bgcolor="#bed5fe">商品数量</th>
</tr>
<c:forEach var="addgoods" items="${addgoods.rows}">
<tr>
<td><IMG src="..<c:out value="${addgoods.goodsImage}" />" width="200" height="200" border=0/></td>
<td bgcolor="#b4cde6"><c:out value="${addgoods.goodsType}"/></td>
<td bgcolor="#bed5fe"><c:out value="${addgoods.goodsID}"/></td>
<td bgcolor="#b4cde6"><c:out value="${addgoods.goodsName}"/></td>
<td bgcolor="#bed5fe"><c:out value="${addgoods.goodsPrice}"/></td>
<td bgcolor="#b4cde6"><c:out value="${addgoods.description}"/></td>
<td bgcolor="#bed5fe"><c:out value="${addgoods.quantity}"/></td>
</tr>
</c:forEach>
</table>
</body>
</html>
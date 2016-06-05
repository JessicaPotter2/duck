<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
    <sql:setDataSource dataSource="jdbc/imall" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查看评论</title>
</head>
<body>
<center><img src="../images/header.jpg"/></center>
<a href="../index.jsp">回到主页</a>
<%
Integer orderID=(int)session.getAttribute("orderID");
%>
<sql:query sql="select * from comment where orderID=orderID" var="comment" />
<table border="1" width="100%">
<center><h3>我的评价</h3></center>
<tr>
<th>用户</th>
<th>订单编号</th>
<th>物流打分</th>
<th>服务打分</th>
<th>质量打分</th>
<th>我的评论</th>
<th>我上传的图片</th>
</tr>
<c:forEach var="comment" items="${comment.rows}">
<tr>
<td><c:out value="${comment.loginName}"/></td>
<td><c:out value="${comment.orderID}"/></td>
<td><c:out value="${comment.wuliu}"/></td>
<td><c:out value="${comment.fuwu}"/></td>
<td><c:out value="${comment.zhiliang}"/></td>
<td><c:out value="${comment.comment}"/></td>
<td><IMG src="..<c:out value="${comment.image}" />" width="200" height="200" border=0/></td>
</tr>
</c:forEach>
</table>
</body>
</html>
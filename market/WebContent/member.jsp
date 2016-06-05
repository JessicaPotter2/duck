<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<sql:setDataSource dataSource="jdbc/imall" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户管理</title>
</head>
<body>
<center><img src="images/header2.jpg"/></center>
<a href="myTree.jsp">返回商品管理界面</a>
<sql:query sql="select * from userinfo" var="user" />
<center>
<form name="setform" action="detail2.jsp" method="post">
<table border="1" width="100%">
<center><h3>用户表</h3></center>
<tr>
<th>用户名</th>
<th>用户密码</th>
<th>用户邮箱</th>
</tr>
<c:forEach var="userinfo" items="${user.rows}">
<tr>
<td><c:out value="${userinfo.loginName}"/></td>
<td><c:out value="${userinfo.loginPass}"/></td>
<td><c:out value="${userinfo.mail}"/></td>
</tr>
</c:forEach>
</table>

</form>
</center>
</body>
</html>
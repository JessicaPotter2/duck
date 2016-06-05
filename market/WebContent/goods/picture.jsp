<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
    <sql:setDataSource dataSource="jdbc/imall" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>商品多图片展示</title>
</head>
<body>
<center><img src="../images/header2.jpg"/></center>
<a href="../myTree.jsp">返回商品管理界面</a>
<sql:query sql="select * from addgoods " var="addgoods" />
				<c:forEach var="addgoods" items="${addgoods.rows}">
			<P align=center><IMG
				style="BORDER-LEFT-COLOR: #000000; BORDER-BOTTOM-COLOR: #000000;  BORDER-TOP-COLOR: #000000; POSITION: static; BORDER-RIGHT-COLOR: #000000; align: "
				 alt="" hspace=0 src="..<c:out value="${addgoods.goodsImage}"/>"
				border=0/></P></c:forEach>
</body>
</html>
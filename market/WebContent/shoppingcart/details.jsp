<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
    <sql:setDataSource dataSource="jdbc/imall" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>商品详情</title>
<c:set var="goodsID" value="${param.goodsID}" scope="page"/>
<c:forEach var="currentGoods" items="${sessionScope.goods}">
  <c:if test="${goodsID==currentGoods.goodsID}">
	<c:set var="AddGoodsToCart" value="${currentGoods}" scope="session"/>
  </c:if>
</c:forEach>
</head>
<body>
当前用户:<%=(String)session.getAttribute("user") %>
<center><img src="../images/header.jpg"/></center>
<a href="../index.jsp">回到主页</a>
<TABLE cellSpacing=0 cellPadding=0 width="80%" align=center border=0>
<TBODY>
<TR bgColor=#f8e9c8>
									<TD width="100%" align="right"><a href="shopCart.jsp">查看购物车</a></TD>
								</TR>
							</TBODY>
<TR vAlign=top>
<TD>
<table width="100%" border="0" cellspacing="1" cellpadding="0"
						align="center">
						<tr>				
					<td  valign="top" rowspan="8"><img
						src="..${AddGoodsToCart.goodsImage }" border="0"  width="300"
						heigth="300"></td></tr>
						<tr>
							<td><strong>${AddGoodsToCart.goodsType }</strong></td>
							<td><strong>${AddGoodsToCart.goodsID }</strong></td>
						</tr>
						<tr>
						<td colspan="2"><strong>${AddGoodsToCart.goodsName }</strong></td>
						</tr>
						<tr>
						<td >
							<font color="#ff0000">价格：人民币${AddGoodsToCart.goodsPrice }元</font><br>
							</td>
						</tr>
						<tr>
						
				<tr>
					<td>
					<table width="145" border="0" cellspacing="1" cellpadding="0">
						<tr>
							<td align="left" width="70">
							<form method="post" action="../addtoshopcart">
								<input type="image" src="../images/buy_cn.gif">
							</form>
							</td>
							<td>
							<form method="post" action="../mycollection">
								收藏商品<input type="image" src="../images/collection.gif">
							</form>
							</td>
						</tr>
					</table>
					</td>
				</tr>
				</table>
				
				<P align=center><STRONG><FONT size=4>详细资料</FONT></STRONG></P>
			<HR align=center width="100%" color=#000000 noShade SIZE=1>
			<P align=center><FONT size=3>${AddGoodsToCart.description}</FONT></P>
<sql:query sql="select * from goodsImage where goodsID=${AddGoodsToCart.goodsID}" var="goodsImage" />
				<c:forEach var="goodsImage" items="${goodsImage.rows}">
			<P align=center><IMG
				style="BORDER-LEFT-COLOR: #000000; BORDER-BOTTOM-COLOR: #000000;  BORDER-TOP-COLOR: #000000; POSITION: static; BORDER-RIGHT-COLOR: #000000; align: "
				 alt="" hspace=0 src="..<c:out value="${goodsImage.goodsImage}"/>"
				border=0/></P></c:forEach>
			
			<br>
			</td>
		</tr>
					</table>
</body>
</html>
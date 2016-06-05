<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改购物车</title>

<c:set var="goodsID" value="${param.goodsID}" scope="page"/>
<c:forEach var="currentGoods" items="${sessionScope.goods}">
  <c:if test="${goodsID==currentGoods.goodsID}">
    <c:set var="ModifyGoodsToCart" value="${currentGoods}" scope="session"/>
  </c:if>
</c:forEach>
</head>
<body>
当前用户:<%=(String)session.getAttribute("user") %>
<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
				<tr>				
					<td width="150" height="150" valign="top"><img
						src="..${ModifyGoodsToCart.goodsImage }" border="0" width="150" height="150"></td>
					<td valign="top">
					
					<table width="98%" border="0" cellspacing="1" cellpadding="0" align="center">
						<tr>
							<td><strong>${ModifyGoodsToCart.goodsName }</strong></td><br/>
						</tr>
						<tr>
							<font color="#ff0000">价格：人民币${ModifyGoodsToCart.goodsPrice }元</font><br>
						</tr>
					</table>
					</td>
				</tr>
				<tr>
					<td height="30">商品编号:${ModifyGoodsToCart.goodsID } </td>
					<td>
				
					<table width="98%" border="0" cellspacing="1" cellpadding="0">
						<tr>
							<td>
							<form method="post" action="../modifyshopcart">
							    <table>
						           <tr>
						              <td width="20%">数量：</td>
							          <td><input type="text" name="quantity" value="${param.quantity }">
							          <input type="submit" value="修改"></td>							          
						           </tr>						
					            </table>
								
							</form>
							</td>
						</tr>
					</table>
			</table>
</body>
</html>
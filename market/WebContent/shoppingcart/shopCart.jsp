<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="eb.java.imall.shoppingcart.*,java.util.*,eb.java.imall.tablet.*" %>
    <jsp:directive.page import="java.text.DecimalFormat"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的购物车</title>

</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0"
	text="#000000" link="#000000" vlink="#000000" alink="#000000">
	<center><img src="images/header.jpg"/></center>
<a href="index.jsp">回到主页</a>
	当前用户:<%=(String)session.getAttribute("user") %>
                    <%
                        // 定义Map对象cart，用于存放session中的“cart”值
						Map cart=(Map)session.getAttribute("cart");
						// 如果购物车内没有餐品，显示“购物车当前为空”
						if(cart==null || cart.size()==0)
						{
							out.println("<br align=center><font color=red>购物车内当前为空。</font><br>");
							out.println("<a href=index.jsp>继续购物</a>");
						}
						else
						{
						    // 得到Map中Key值的Set集合
						    Set keySet=cart.keySet();
						    //将Set中元素转换成数组，以便使用循环进行遍历
							Object[] keyItems=keySet.toArray();
							// 定义double变量total，用于存放购物车内餐品总价格
							double total=0;								
					%>
<table width="100%" border="0" cellspacing="0" cellpadding="0"
	bgcolor="#FFFFFF" height="100%">
	<tr valign="top">
		<td>
		<table border="0" cellspacing="1" cellpadding="2" align="center">
			<tr valign="bottom">
				<td height="30"><font
					color="#000000">您的购物车中有以下商品</font></td>
			</tr>
		</table>
		<table width="98%" border="0" cellspacing="2" cellpadding="0"
			align="center">
			<tr bgcolor=#808000>
				<td height="1" bgcolor="#999999"></td>
			</tr>
		</table>
		<table width="98%" border="0" cellspacing="2" cellpadding="0"
			align="center">
			<tr>
				<td height="5"></td>
			</tr>
		</table>
		<table width="98%" border="0" cellspacing="0" cellpadding="0" align="center">
			<tr>
				<td>
				<table width="500" border="0" align="CENTER" cellpadding="2"
					cellspacing="1" bgcolor="#e1e6f6" height="105">
					<tr bgcolor="#b4cde6">
						<td height="22" width="50">
						<div align="CENTER"><font color="#000000">商品编号</font></div>
						</td>
						<td width="104" height="22">
						<div align="CENTER"><font color="#000000">商品名称</font></div>
						</td>
						<td height="22" width="104">
						<div align="CENTER"><font color="#000000">单价</font></div>
						</td>
						<td height="22" width="100">
						<div align="CENTER"><font color="#000000">数量</font></div>
						</td>
						<td width="86" height="22">
						<div align="CENTER"><font color="#000000">金额</font></div>
						</td>
						<td width="50" height="22">修改</td>
						<td width="50" height="22">删除</td>
					</tr>
                    <%		
                         // 循环遍历购物车内餐品，并显示各个餐品的餐品名称，价格，数量				
						for(int i=0;i<keyItems.length;i++)
						{						   
						    // 从Map对象cart中取出第i个商品，放入cartItem中
							CartItemBean cartItem=(CartItemBean)cart.get((String)keyItems[i]);
							// 从cartItem中取出addgoodsBean对象
							addgoodsBean goods=cartItem.getGoods();
							// 定义int类型变量quantity，用于表示购物车中单个商品的数量
							int quantity=cartItem.getQuantity();
							// 定义double变量price，表示商品单价
							double goodsPrice=goods.getgoodsPrice();
							// 定义double变量，subtotal表示单个商品总价
							double subtotal = quantity * goodsPrice;
							// 计算购物车内餐品总价格
							total += subtotal;
					 %>
					
					<tr bgcolor="#bed5fe">
						<td width="50" align="center" height="22"><font
							color="#000000"><%=goods.getgoodsID() %></font></td>
						<td align="center" height="22"><font color="#000000"><%=goods.getgoodsName() %></font>
						<input type="hidden" name="prodid" value="500047"></td>
						<td width="104" align="center" height="22"><font
							color="#000000">￥<%=new DecimalFormat("0.00").format(goodsPrice) %></font></td>
						<td width="100" class="hh" align="center" height="22"><%=quantity %></td>
						<td width="116" class="bb" align="center" height="22"><font
							color="#000000">￥<%=new DecimalFormat("0.00").format(subtotal) %></font></td>
						<td><a href="shoppingcart/modifyshopcart.jsp?goodsID=<%=goods.getgoodsID() %>&quantity=<%=quantity %>">修改</a></td>
						<td><a href="delshopcartitem?goodsID=<%=goods.getgoodsID() %>">删除</a></td>
					</tr>
					
					<%
					}%>

					<tr bgcolor="#dadada">
						<td width="50" height="22" align="center"><font
							color="#000000">合计</font></td>
						<td height="22" align="center"><font color="#000000">-</font></td>
						<td width="104" height="22" align="center"><font
							color="#000000">-</font></td>
						<td width="100" class="hh" height="22" align="center"><font
							color="#000000">-</font></td>
						<td width="116" class="bb" align="center" height="22"><font
							color="#000000">￥<%=new DecimalFormat("0.00").format(total) %> </font></td>
					</tr>
					
				</table>
				<br>
				<table width="300" border="0" cellspacing="1" cellpadding="4"
					align="CENTER" bgcolor="#c0c0c0">
					<tr bgcolor="#c3deac">
						<td height="10" align="center"><a href="removeshopcart"><font
							color="#000000">清空购物车</font></a>
						</td>
						<td height="10" align="center" style="cursor:hand">
							<form method="post" action="index.jsp">
								<input type="submit" value="继续购物">
							</form>
						</td>
						<td height="10" align="center" style="cursor:hand">
						<form method="post" action="shoppingcart/checkOut.jsp">
							<input type="submit" value="生成订单">
						</form>
						</td>
					</tr>
				</table>
				</td>
			</tr>
		</table>
		</td>
	</tr>
</table>
<br>
				    <%
				         // 把当前餐品总价格放入session中
					     session.setAttribute("total",new Double(total));
					     }
				    %>
</body>
</html>
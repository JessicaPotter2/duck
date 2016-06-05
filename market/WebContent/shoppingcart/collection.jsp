<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@page import="eb.java.imall.goods.*,java.util.*,eb.java.imall.tablet.*" %>
    <jsp:directive.page import="java.text.DecimalFormat"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的收藏</title>
</head>
<body>
<center><img src="images/header.jpg"/></center>
<a href="index.jsp">回到主页</a>
当前用户:<%=(String)session.getAttribute("user") %>
<TABLE cellSpacing=1 cellPadding=1 width="100%" align=center
							bgColor=#c0c0c0 border=0>
							<TBODY>
								<TR bgColor=#f8e9c8>

									<TD width="100%" align="right"><a href="shopCart.jsp">查看购物车</a></TD>
								</TR>
							</TBODY>
						</TABLE>
<%
                        // 定义Map对象cart，用于存放session中的“cart”值
						Map cart2=(Map)session.getAttribute("cart2");
						// 如果购物车内没有餐品，显示“购物车当前为空”
						if(cart2==null || cart2.size()==0)
						{
							out.println("<br align=center><font color=red>收藏夹当前为空</font><br>");
							out.println("<a href=index.jsp>继续购物</a>");
						}
						else
						{
						    // 得到Map中Key值的Set集合
						    Set keySet=cart2.keySet();
						    //将Set中元素转换成数组，以便使用循环进行遍历
							Object[] keyItems=keySet.toArray();	
					%>
				<table border="0" cellspacing="1" cellpadding="2" align="center">
			<tr valign="bottom">
				<td height="30"><font
					color="#000000">您的收藏夹中有以下商品</font></td>
			</tr>
		</table>						
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
						<td width="50" height="22">删除</td>
					</tr>
                    <%		
                         // 循环遍历购物车内餐品，并显示各个餐品的餐品名称，价格，数量				
						for(int i=0;i<keyItems.length;i++)
						{						   
						    // 从Map对象cart中取出第i个商品，放入cartItem中
							Item cartItem=(Item)cart2.get((String)keyItems[i]);
							// 从cartItem中取出addgoodsBean对象
							addgoodsBean goods=cartItem.getGoods();
							// 定义int类型变量quantity，用于表示购物车中单个商品的数量
							int quantity=cartItem.getQuantity();
							// 定义double变量price，表示商品单价
							double goodsPrice=goods.getgoodsPrice();
					 %>
					
					<tr bgcolor="#bed5fe">
						<td width="50" align="center" height="22"><font
							color="#000000"><%=goods.getgoodsID() %></font></td>
						<td align="center" height="22"><font color="#000000"><%=goods.getgoodsName() %></font>
						<input type="hidden" name="prodid" value="500047"></td>
						<td width="104" align="center" height="22"><font
							color="#000000">￥<%=new DecimalFormat("0.00").format(goodsPrice) %></font></td>
						<td><a href="delshopcartitem?goodsID=<%=goods.getgoodsID() %>">删除</a></td>
					</tr>
					<%
					}}%>
				</table>
</body>
</html>
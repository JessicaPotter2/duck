<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="eb.java.imall.*,eb.java.imall.tablet.*,java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>商品展示</title>
</head>
<body>
<center><img src="../images/header.jpg"/></center>
当前用户:<%=(String)session.getAttribute("user") %>
<a href="../index.jsp">回到主页</a>
<TABLE cellSpacing=1 cellPadding=1 width="100%" align=center
							bgColor=#c0c0c0 border=0>
							<TBODY>
								<TR bgColor=#f8e9c8>

									<TD width="100%" align="right"><a href="shopCart.jsp">查看购物车</a></TD>
								</TR>
							</TBODY>
						</TABLE>
<%
									GetDataBean getDataBean = new GetDataBean();
									List goods = getDataBean.getGoods();
									addgoodsBean currentGoods;
									session.setAttribute("goods", goods);
									for (int i = 0; i < goods.size(); i++) {
										currentGoods = (addgoodsBean) goods.get(i);
										%>
<table >
<tr>
<td align="center" rowspan="8" width="500px"><a href="details.jsp?goodsID=<%=currentGoods.getgoodsID() %>"><img src="..<%=currentGoods.getgoodsImage() %>"width="350" height="300"/></a></td>
<tr>
<tr>
<td><h3><%=currentGoods.getgoodsType()%></h3></td>
<td><h3><%= currentGoods.getgoodsID()%></h3></td>
</tr>
<tr>
<td colspan="2" ><h3><a href="details.jsp?goodsID=<%=currentGoods.getgoodsID() %>"><%=currentGoods.getgoodsName()%></a></h3></td>
</tr>
<tr>
<td><h3><FONT color=#ff0000>人民币：<%=currentGoods.getgoodsPrice()%></FONT></h3></td>
</tr>
<tr>
<td colspan="2"><h3><a href="details.jsp?goodsID=<%=currentGoods.getgoodsID() %>">详情</a></h3></td>
</tr>
<hr width=100%/>
</table>
<%
									}
									
								%>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>进货</title>
<style type="text/css">
	form { width: 300px; margin: 200px auto; }
</style>
</head>
<body>
<center><img src="../images/header2.jpg"/></center>
<a href="../myTree.jsp">返回商品管理界面</a>
<form method="post" action="add.jsp" >
		<p>
			<label for="goodsID">商品编号:</label>
			<input type="text" name="goodsID" id="goodsID" />
		</p>
		<p>
			<label for="goodsName">商品名称:</label>
			<input type="text" name="goodsName" id="goodsName" />
		</p>
		<p>
			<label for="goodsType">商品类型:</label>
			<input type="text" name="goodsType" id="goodsType" />
		</p>
		<p>
			<label for="goodsPrice">商品定价:</label>
			<input type="text" name="goodsPrice" id="goodsPrice" />
		</p>
		<p>
			<label for="goodsImage">商品图片:</label>
			<input type="text" name="goodsImage" id="goodsImage" />
		</p>
		<p>
			<label for="description">商品描述:</label>
			<input type="text" name="description" id="description" />
		</p>
		<p>
			<label for="quantity">商品数量:</label>
			<input type="text" name="quantity" id="quantity" />
		</p>
		<p>
			<input type="submit" value="添加商品" />
		</p>
	</form>
</body>
</html>
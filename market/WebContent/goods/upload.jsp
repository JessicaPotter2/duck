<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>上传图片</title>
</head>
<body>
<center><img src="../images/header2.jpg"/></center>
<a href="../myTree.jsp">返回商品管理界面</a>
<p align="center">请选择你要上传的图片</p>
<form method="post" action="upload_picture.jsp" enctype="multipart/form-data">

<table border="0" align="center">
<tr>
<td><div align="center">
<p>
<lable for="goodsID">商品编号:</lable>
<input type="text" name="goodsID" id="goodsID" size="30">
</p>
<p>
<input type="file" name="file" size="30">
</p>

</div></td>
</tr>
<tr>
<td><div align="center">
<input type="submit" name="Submit" value="上传">
</div></td>
</tr>
</table>
</form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>商品后台管理</title>
<link rel="StyleSheet" href="css/dtree.css" type="text/css" />
	<script type="text/javascript" src="js/dtree.js"></script>
</head>
<body>
<center><img src="images/header2.jpg"/></center>
<a href="../myTree.jsp">返回商品管理界面</a>
<div class="dtree">

	<p><a href="javascript: d.openAll();">open all</a> | <a href="javascript: d.closeAll();">close all</a></p>

	<script type="text/javascript">
		<!--

		d = new dTree('d');

		d.add(0,-1,'树形商品管理');
		d.add(1,0,'用户管理','member.jsp');
		d.add(2,0,'商品管理','myTree.jsp');
		d.add(3,0,'库存与订单','myTree.jsp');
		
		d.add(4,2,'添加商品','myTree.jsp');
		d.add(5,2,'修改商品信息','goods/modify.jsp');
		d.add(6,2,'删除商品','goods/deletegoods.jsp');
		d.add(15,2,'商品类别管理','myTree.jsp');
		
		d.add(16,15,'类别查看','goods/l1.jsp');
		d.add(21,15,'类别','goods/l6.jsp');
		
		d.add(7,4,'添加商品信息','goods/addgoods.jsp');
		d.add(8,4,'添加商品图片','goods/upload2.jsp');
		d.add(6,4,'添加商品详情图片','goods/upload.jsp');
		d.add(14,4,'商品多图片展示','goods/picture.jsp');
		
		d.add(9,3,'库存管理','goods/inventory.jsp');
		d.add(10,3,'销售管理','goods/saled.jsp');
		d.add(11,3,'订单处理','myTree.jsp');
		
		d.add(12,11,'已完成订单处理','goods/deal.jsp');
		d.add(13,11,'未完成订单处理','goods/undeal.jsp');

		document.write(d);

		//-->
	</script>

</div>
</body>
</html>
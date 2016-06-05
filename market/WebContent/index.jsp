<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@include file="loginSession.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>imall</title>
<script type="text/javascript" src="js/jquery1.42.min.js"></script>
<script type="text/javascript" src="js/jquery.SuperSlide.2.1.1.js"></script>

<link href="css/style.css" rel="stylesheet" type="text/css">

</head>
<body>

<div class="tmall_box">
	<div class="menu">
    	<ul>
            <li><a href="shoppingcart/shopCart.jsp">我的购物车</a></li>
            <li><a href="shoppingcart/myorder.jsp">我的订单</a></li>
            <li><a href="shoppingcart/collection.jsp">我的收藏</a></li>
        </ul>
    </div>
    <div id="tmall_nav">
    	<!--左侧栏目开始-->
    	<div class="tmall_cat_nav fl">
        	<div class="tmall_mod_title">商品服务分类</div>
            <ul class="cate_nav">
            	<li>
                	<div class="cat_4_nav">
                    	<s class="cat-nav-icon fp-iconfont">&#x345c;</s>
                        <a >化妆品</a> / <a href="http://www.mycodes.net">个人护理</a>
                    </div>
                </li>
            	<li>
                	<div class="cat_5_nav">
                    	<s class="cat-nav-icon fp-iconfont">&#x3457;</s>
                        <a >手机数码</a> / <a href="http://www.mycodes.net">电脑办公</a>
                    </div>
                </li>
            	<li>
                	<div class="cat_7_nav">
                    	<s class="cat-nav-icon fp-iconfont">&#x3455;</s>
                        <a >食品</a>
                    </div>
                </li>
            	
            </ul>
        </div>
        <!--左侧栏目结束-->
        <!--右侧内容开始-->
        <div class="tmall_cat_content fr">
        	
            
            <div class="cat_pannel clearfix">
            	<div class="fl cat_detail grid_col_4">
                	<h3 class="cat_title">i 美妆</h3>
                    <ul class="cat_label_list clearfix">
                        <li><a href="shoppingcart/goodsMessage.jsp">护理套装</a></li>
                        <li class="second_label"><a href="shoppingcart/goodsMessage2.jsp">面膜</a></li>
                        
                    </ul>
                    
                </div>
                <div class="fl cat_banner">
                	<a href="http://www.mycodes.net"><img src="images/30.jpg" /></a>
                </div>
                
            </div>
            <div class="cat_pannel clearfix">
            	<div class="fl cat_detail grid_col_5">
                	<h3 class="cat_title">手机数码</h3>
                    <ul class="cat_label_list clearfix">
                    	<li><a href="shoppingcart/goodsMessage3.jsp">大屏手机</a></li>
                        <li class="second_label"><a href="shoppingcart/goodsMessage4.jsp">笔记本</a></li>
                       
                    </ul>
                   
                </div>
                <div class="fl cat_banner">
                	<a class="banner-grid-b1" href="http://www.mycodes.net"><img src="images/31.jpg" /></a>
                    
                </div>
                
            </div>
            
            <div class="cat_pannel clearfix">
            	<div class="fl cat_detail grid_col_7">
                	<h3 class="cat_title">食品</h3>
                    <ul class="cat_label_list clearfix">
                        <li><a href="shoppingcart/goodsMessage5.jsp">坚果</a></li>
                    </ul>
                    
                </div>
                <div class="fl cat_banner">
                	<a href="http://www.mycodes.net"><img src="images/33.jpg" /></a>
                </div>
                
            </div>
        </div>
        <!--右侧内容结束-->
    </div>
</div>
<script type="text/javascript">
$(".cat_banner").hover(function(){
		$(this).find(".prev_pic,.next_pic").fadeTo("show",0.2);
	},function(){
		$(this).find(".prev_pic,.next_pic").hide();
})
$(".prev_pic,.next_pic").hover(function(){
	$(this).fadeTo("show",0.5);
},function(){
	$(this).fadeTo("show",0.2);
})
$(".cat_banner").slide({ 
	titCell:".num ul" , 
	mainCell:".cat_banner_pic" , 
	effect:"left",
	prevCell:".prev_pic",
	nextCell:".next_pic",
	autoPlay:true, 
	interTime:3000, 
	delayTime:500,
	autoPage:true 
});
$(".cat_small_banner li").hover(function(){
	$(this).animate({"left":-5},200);
},function(){
	$(this).animate({"left":0},200);
});
$(".cat_brand").slide({ 
	titCell:".cat_slide_nav li", 
	mainCell:".cat_slide_brand", 
	effect:"left",
	autoPlay:true,
	interTime:3000,
	delayTime:700
});
$("#tmall_nav").slide({ 
	titCell:".cate_nav li",
	mainCell:".tmall_cat_content",
	autoPlay:true,
	interTime:7400,
	delayTime:0 
});
</script>
<div style="text-align:center;margin:50px 0; font:normal 14px/24px 'MicroSoft YaHei';">

</div>
</body>
</html>
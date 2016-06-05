<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*,java.util.*,java.io.*,eb.java.imall.DbUtil"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>订单评论</title>
</head>
<body>
<center>

<%
Connection conn=DbUtil.getConnection();
	//创建查询
	String content=(String)session.getAttribute("content");
	String ispaied="paied";
	PreparedStatement stmt=conn.prepareStatement("select * from goodsorderinfo where content=? and ispaied=?");
	stmt.setString(1,content);
	stmt.setString(2,ispaied);
	ResultSet rs= stmt.executeQuery();
	//遍历查询
	while(rs.next()){
		String loginName=(rs.getString("loginName"));
		session.setAttribute("loginName", loginName);
		Integer orderID=(rs.getInt("orderID"));
		session.setAttribute("orderID", orderID);
		out.print("用户名"+loginName+"<br/>");
		out.print("订单号"+orderID+"<br/>");
		out.println("付款状态"+ispaied+"<br/>");	
		out.println("订单内容"+content+"<br/>");
	}
	stmt.close();
	conn.close();
%>
<form name="comment" action="com.jsp" method="post" enctype="multipart/form-data">
<div>
			<p>物流评分:</p>
			<lable for="g1">1分</lable>
			<input type="radio" name="grade1" id="g1" value="1分"/>
		<lable for="g2">2分</lable>
			<input type="radio" name="grade1" id="g2" value="2分"/>
			<lable for="g3">3分</lable>
			<input type="radio" name="grade1" id="g3" value="3分"/>
			<lable for="g4">4分</lable>
			<input type="radio" name="grade1" id="g4" value="4分"/>
			<lable for="g5">5分</lable>
			<input type="radio" name="grade1" id="g5" value="5分"/>
			<p>质量评分:</p>
			<lable for="g6">1分</lable>
			<input type="radio" name="grade2" id="g6" value="1分"/>
			<lable for="g7">2分</lable>
			<input type="radio" name="grade2" id="g7" value="2分"/>
			<lable for="g8">3分</lable>
			<input type="radio" name="grade2" id="g8" value="3分"/>
			<lable for="g9">4分</lable>
			<input type="radio" name="grade2" id="g9" value="4分"/>
			<lable for="g10">5分</lable>
			<input type="radio" name="grade2" id="g10" value="5分"/>
			<p>服务评分:</p>
			<lable for="g11">1分</lable>
			<input type="radio" name="grade3" id="g11" value="1分"/>
			<lable for="g12">2分</lable>
			<input type="radio" name="grade3" id="g12" value="2分"/>
			<lable for="g13">3分</lable>
			<input type="radio" name="grade3" id="g13" value="3分"/>
			<lable for="g14">4分</lable>
			<input type="radio" name="grade3" id="g14" value="4分"/>
			<lable for="g15">5分</lable>
			<input type="radio" name="grade3" id="g15" value="5分"/>
		</div>
<div>
<center>
<p>
<lable for="comment">订单评论：</lable>
<textarea name="comment" cols="45" rows="6" id="comment"></textarea></td>
</p>
<table border="0" align="center">
<tr>
<td><div align="center">
<p>上传图片：
<input type="file" name="file" size="30">
</p>
</div>
</td>
</tr>
</table>
			<input type="submit" value="评论" />
			<input type="reset" value="重置" /><br/>
			</center>
</div>
</form>
<hr/>
</center>
</body>
</html>
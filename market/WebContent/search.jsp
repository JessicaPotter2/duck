<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>找回密码</title>
<style type="text/css">
	form { width: 400px; margin: 200px auto; }
</style>
</head>
<body>
<center>
<form action="searchservlet" method="POST">
<table border="0">
<tr>
   <td>请输入您注册时用的邮箱:</td>
   <td><input type="text" name="email"/></td>
</tr>
<tr>
   <td><input type="submit" name="submit1" value="确定"/></td>
   <td>&nbsp;</td>
</tr>
</table>
<a href="login.jsp">返回</a>
</form>
</center>
</body>
</html>
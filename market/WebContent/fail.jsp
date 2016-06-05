<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改密码失败</title>
</head>
<body>
<center><h2>修改密码失败</h2></center>
<h3>你输入的旧密码不正确</h3>
<%response.setHeader("refresh","5;url=edit_pwd.jsp"); %>
</body>
</html>
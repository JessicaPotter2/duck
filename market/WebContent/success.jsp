<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改密码成功</title>
</head>
<body>
<center><h2>修改密码成功</h2></center>
<jsp:useBean id="message" class="eb.java.imall.login.UserOperation" scope="request"/>
<p>3秒后跳转到主页</p>
<%response.setHeader("refresh","3;url=index.jsp"); %>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="eb.java.imall.login.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>欢迎来到imall商城</title>
</head>
<body>
<table >
<tr>
当前在线人数：<%=OnlineUserCounter.getonlineUsercount() %>人
<td><a href="login.jsp">普通用户登录</a></td>&nbsp;&nbsp;
<td><a href="adminlogin.jsp">管理员登录</a></td>&nbsp;&nbsp;
<td>还没注册？<a href="reg.html">注册</a></td>&nbsp;&nbsp;
<td><a href="index.jsp">回到主页</a></td>
<td width='100'><a href="Logout">[注销]</a></td>
</tr></table>
<hr size="1"/>
</body>
</html>
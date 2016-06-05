<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录界面</title>
<link rel="stylesheet" href="css/reg.css" type="text/css" />
</head>
<body>
<center>
<form name="loginForm" action="LoginServlet" method="post" class="form">
<p>
			<label for="username">用户名:</label>
			<input type="text" name="username" id="username" />
		</p>
<p>
			<label for="password">密&emsp;码:</label>
			<input type="password" name="password" id="password" />
		</p>
		<p>
			<label for="cookie">记住密码:</label>
			<input type="radio" name="cookie" id="cookie" />
		</p>
<p>
			<input type="submit" value="登录" />
			<input type="reset" value="重置" /><br/>
</p>
		<td>还没注册？<a href="reg.html">注册</a></td>&nbsp;&nbsp;
		<td class="td"><a href="index.jsp">返回首页</a></td>&nbsp;&nbsp;
<td class="td"><a href="edit_pwd.jsp">修改密码</a></td>&nbsp;&nbsp;
<td class="td"><a href="Logout">[注销]</a></td>
<td class="td"><a href="search.jsp">找回密码</a></td>
</tr>
</form>
</center>
</body>
</html>
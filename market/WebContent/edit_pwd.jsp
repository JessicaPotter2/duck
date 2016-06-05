<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>密码修改</title>
<script type="text/javascript">
<!--
function myFunction()
{
	if(myForm.oldpass.value=="")
		{
		alert("原密码不能为空");
		}
	else if(myForm.newpass.value=="")
		{
		alert("新密码不能为空");
		}
	else if(myForm.newpass.value!=myForm.surepass.value)
		{
		alert("两次修改的密码不相同");
		}
	else
		{
		myForm.submit();
		}
	}
	-->
</script>
<link rel="stylesheet" href="css/reg.css" type="text/css" />
</head>
<body>

<form method="post" action="EditPwdServlet" class="form" name="myForm">
		
		<p>
			<label for="username">用户名:</label>
			<input type="text" name="username" id="username" />
		</p>
		<p>
			<label for="oldpass">旧密码:</label>
			<input type="password" name="oldpass" id="oldpass" />
		</p>
		<p>
			<label for="newpass">新密码:</label>
			<input type="password" name="newpass" id="newpass" />
		</p>
		<p>
			<label for="surepass">确认密码:</label>
			<input type="password" name="surepass" id="surepass" />
		</p>
		<p>
			<input type="button" value="修改" onclick="myFunction()"/>
			<input type="reset" value="重置"/>
		</p>
	</form>
</body>
</html>
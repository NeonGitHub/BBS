<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>登录</title>
<link rel="stylesheet" type="text/css" href="css/styles.css">
</head>
<body>
<div class="htmleaf-container">
	<div class="wrapper">
		<div class="container">
			<h1>Welcome</h1>


			<form class="form"  action="login.do">
				<input class="input" type="text" name="userid" placeholder="Username">
				<input class="input" type="password" name="password" placeholder="Password">

				<div class="danxuan"><label><input type="radio" value="1" name="check" />用户</label>
					<label><input type="radio" name="check" value="2" />版主</label>
					<label><input  type="radio"  name="check" value="3" />管理员</label></div>

				<button  type="submit" id="login-button" >Login</button>

			</form>
		</div>
		
		<ul class="bg-bubbles">
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
		</ul>
	</div>
</div>



</body>
</html>
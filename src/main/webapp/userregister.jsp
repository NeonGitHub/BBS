<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<meta charset="UTF-8">
		<title>西科大BBS论坛-用户回复页面-欢迎来到西科大BBS论坛，这里有最新的校园咨询，最热的校园热点！</title>
		<link rel="stylesheet" href="css/register.css" />
		<link rel="stylesheet" href="css/bootstrap.css" />
	

	</head>

	<body>
		<div class="top">
			<div class="topicon"></div>
			<div class="toptitle"></div>
			<div class="toplogin">
		
			</div>
		</div>
		<div class="topimg">
			<!--CSS里图片背景-->
		</div>
		<div class="mid">
			<div class="page-header">
				<h1><center>帐号注册</center></h1>

			</div>
			<div class="ta">
				<form action="register.do" method="post" >
					<div class="form-group">
						<label for="exampleInputEmail1">用户帐号</label>
						<input type="text"  name="userId"  class="form-control" placeholder="请输入帐号" >
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">密码</label>
						<input type="password" name="userPwd" class="form-control" id="exampleInputPassword1" placeholder="请输入密码">
					</div>
					<div class="form-group">
						<label >姓名</label>
						<input type="text" class="form-control" name="userName" placeholder="请输入姓名">
					</div>
				
					<div class="form-group">
						<label >性别</label>
						<label >男</label><input type="radio"  name="userSex" value="男">
						<label >女</label><input type="radio"  name="userSex" value="女">
					</div>
						<div class="form-group">
						<label >生日</label>
						<input type="text" class="form-control" name="userBirth" placeholder="请输入姓名">
					</div>
					<div class="form-group">
						<label >个性签名</label>
						<textarea class="form-control" name="userShow" placeholder="请输入个性签名"></textarea>
					</div>
					
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button type="submit" class="btn btn-default">注册</button>
				</form>
				</div>

			</div>
			<!--mid2中间板块-->

		</div>

		<div class="bottom">
			<div class="bottom1">
				<div class="bottom1_1"></div>
				<div class="gif"></div>
				<ul>
					<li>斗鱼TV</li>
					<li>智联招聘</li>
					<li>百度贴吧</li>
					<li>去哪儿网</li>
					<li>哔哩哔哩</li>
					<li>网易云音乐</li>
					<li>今日头条</li>
					<li>起点中文网</li>
				</ul>
			</div>

			<div class="bottom2">
				<span>
					版权所有：西科大项目一组
				</span>
			</div>
		</div>

	</body>

</html>
<%@page import="com.bbs.model.User"%>
<%@page import="com.bbs.model.Section"%>
<%@page import="com.bbs.model.Annoucement"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta charset="UTF-8">
<title>西科大BBS论坛-用户首页-欢迎来到西科大BBS论坛，这里有最新的校园咨询，最热的校园热点！</title>
<link rel="stylesheet" href="css/logincommon.css" />
<link rel="stylesheet" href="css/userhome.css" />
<script>
	window.onload = function() {
		var dm = document.getElementById("img");
		var imgs = dm.getElementsByTagName("div");
		var dm2 = document.getElementById("sign");
		var sign = dm2.children;
		sign[0].style.opacity = 1;
		var img = 1; //从第二张图片开始
		imgs[0].style.opacity = 1;
		for (var i = 0; i < imgs.length - 1; i++) {
			imgs[i + 1].style.opacity = 0;
		}
		sign[0].onclick = function() {
			for (var i = 1; i < sign.length; i++) {
				if (imgs[i].style.opacity == 1) {
					sign[i].style.opacity = 0.6;
					sign[0].style.opacity = 1;
					startMove(imgs[i]);
					startMove1(imgs[0]);
				}
			}
		}
		sign[1].onclick = function() {
			for (var i = 0; i < sign.length; i++) {
				if (i != 1 && imgs[i].style.opacity == 1) {
					sign[i].style.opacity = 0.6;
					sign[1].style.opacity = 1;
					startMove(imgs[i]);
					startMove1(imgs[1]);
				}
			}
		}
		sign[2].onclick = function() {
			for (var i = 0; i < sign.length; i++) {
				if (i != 2 && imgs[i].style.opacity == 1) {
					sign[i].style.opacity = 0.6;
					sign[2].style.opacity = 1;
					startMove(imgs[i]);
					startMove1(imgs[2]);
				}
			}
		}
		sign[3].onclick = function() {
			for (var i = 0; i < sign.length; i++) {
				if (i != 3 && imgs[i].style.opacity == 1) {
					sign[i].style.opacity = 0.6;
					sign[3].style.opacity = 1;
					startMove(imgs[i]);
					startMove1(imgs[3]);
				}
			}
		}

		var timer2 = setInterval(function() {
			var rank = img % 4;

			for (var i = 0; i < imgs.length; i++) {
				if (i != rank && imgs[i].style.opacity == 1) {
					sign[i].style.opacity = 0.6;
					sign[rank].style.opacity = 1;
					startMove(imgs[i]);
					startMove1(imgs[rank]);
				}
			}

			img++;
		}, 5000);

	}

	function startMove(obj) {
		var s = 10;
		var timer1 = setInterval(function() {
			if (s == -1) {
				obj.style.opacity = 0;
				clearInterval(timer1);
				return;
			}
			obj.style.opacity = s-- / 10;
		}, 50);
	}

	function startMove1(obj) {
		var s = 1;
		var timer2 = setInterval(function() {
			if (s == 11) {
				obj.style.opacity = 1;
				clearInterval(timer2);
				return;
			}
			obj.style.opacity = s++ / 10;
		}, 50);
	}
</script>

</head>

<body>
	<div class="top">
		<div class="topicon"></div>
		<div class="toptitle"></div>
		<div class="toplogin">
			<a href="#"><span class="span1">修改个人信息</span></a> <a href="<%=request.getContextPath()%>/login.jsp"><span
				class="span2">注销</span></a>
		</div>
	</div>
	<%
		HttpSession Session = request.getSession();
		User user = (User) Session.getAttribute("user");
		List<Section> secList = (List<Section>) request.getAttribute("secList");
		Annoucement annouce = new Annoucement();
		annouce.setAnnContent((String) request.getAttribute("annouce"));
	%>
	<div class="topimg"></div>
	<div class="mid">
		<div class="mid1">
			<!--公告显示在这里-->
			<div class="mid1_1announce">
				<div class="mid1_1title">
					<span>论坛公告</span>
				</div>
				<div class="mid1_1content">
					<span><%=annouce.getAnnContent()%></span>
				</div>
			</div>
			<!--用户信息要显示在这里-->
			<div class="mid1_2user">
				<!--用户头像-->
				<div class="mid1_2usericon"><img  src="img/usericon.jpg"/></div>

				<div class="mid1_2userinfo">
					<ul>
						<li>用户：<%=user.getUserId()%></li>
						<li>性别：<%=user.getUserSex()%></li>
						<li>个性签名：<%=user.getUserShow()%></li>
					</ul>
				</div>

			</div>

		</div>
		<!--中间板块-->
		<div class="mid2">
			<!--CSS不再公用-->
			<div class="imgtop">
				<img src="img/xufengjingicon.jpg" /> <span>西科风光</span>

			</div>

			<div class="bigimg">

				<div class="d2" id="img">
					<div class="d21">
						<img src="img/xust1.jpg" />
					</div>
					<div class="d22">
						<img src="img/xust2.jpg" />
					</div>
					<div class="d23">
						<img src="img/xust3.jpg" />
					</div>
					<div class="d24">
						<img src="img/xust4.png" />
					</div>

					<ul class="d2_2" id="sign">
						<li></li>
						<li></li>
						<li></li>
						<li></li>
					</ul>
				</div>

			</div>

			<div class="sectiontop">
				<img src="img/modicon.jpg" /> <span>进入板块</span>

			</div>

			<div class="section">
				<ul>
					<%
						for (Section section : secList) {
					%>



					<a href="<%=request.getContextPath()%>/section.do?type=<%=section.getSectionType()%>&page=1&pagesize=10">
						<li>
							<div class="section1">
								<div class="sectiontitle">
									<span><%=section.getSectionType()%></span>
								</div>
								<img src="img/bottomgif.gif" />
								<div class="sectioncontent">
									<p><%=section.getSectionContent() %></p>
								</div>

							</div>
					</li>
					</a>
					<%
						}
					%>
				</ul>
			</div>

		</div>

		<div class="mid3">
			<div class="mid3_1">
				<span>版规</span>
			</div>
			<div class="mid3_2">
				<p>
					1、欢迎您来到西科大BBS论坛。本论坛是以交流学习生活的经验、心得体会，娱乐休闲等为主的网络社区，希望您能够在论坛得到有用的心得和经验，大学生论坛感谢您的支持！
					2、本规定为本论坛规定总则，具体各个版块仍需遵守各版块规定，如版块规定有与本规定冲突的，以本规定为主。
					3、会员应当遵守法律、法规，并单独承担发表内容的责任，因会员发帖造成的后果，大学生论坛不承担任何责任。
					4、会员有团结友爱，互帮互助，维护论坛秩序的义务。
					5、请自觉遵守《全国人大常委会关于维护互联网安全的决定》、《互联网信息服务管理办法》、《互联网电子公告服务管理规定》及中华人民共和国其他各项有关法律法规。
				</p>
			</div>
		</div>
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
			<span> 版权所有：西科大项目一组 </span>
		</div>
	</div>

</body>

</html>
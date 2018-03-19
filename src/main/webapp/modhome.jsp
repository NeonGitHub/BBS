<%@page import="com.bbs.model.Moderator"%>
<%@page import="com.bbs.model.Section"%>
<%@page import="com.bbs.model.Annoucement"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta charset="UTF-8">
<title>西科大BBS论坛-版主首页-欢迎各位版主的到来！</title>
<link rel="stylesheet" href="css/logincommon.css" />
<link rel="stylesheet" href="css/modhome.css" />

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
	<div class="topimg"></div>
	<%
		HttpSession Session = request.getSession();
		Moderator moderator = (Moderator) Session.getAttribute("moderator");
		List<Section> secList = (List<Section>) request.getAttribute("secList");
		Annoucement annouce = new Annoucement();
		annouce.setAnnContent((String) request.getAttribute("annouce"));
		
	%>
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


		</div>
		<!--中间板块-->
		<div class="mid2">
			<!--CSS bigimg不再公用-->
			<div class="mod">
				<div class="modleft">
					<div class="modicon"><img  src="img/xusticon.png"/></div>

					<div class="modinfo">
						<ul>
							<li>版主：<%=moderator.getModId() %></li>
							<li>性别：<%=moderator.getModSex() %></li>
							<li>个性签名：<%=moderator.getModShow() %></li>
						</ul>
					</div>
				</div>

				<div class="modright">
					<div class="modright1">
						<ul>
							<li>所属板块：<%=moderator.getModType() %></li>
							<li>板块主题数：<%=request.getAttribute("forumnum") %></li>
						</ul>
					</div>
				</div>
			</div>

			<!--这里公用-->

			<div class="sectiontop">
				<img src="img/modicon.jpg" /> <span>进入板块</span>

			</div>

			<div class="section">
				<ul>
					<%
						for (Section section : secList) {
					%>



					<a href="<%=request.getContextPath()%>/modsection.do?type=<%=section.getSectionType()%>&page=1&pagesize=10">
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
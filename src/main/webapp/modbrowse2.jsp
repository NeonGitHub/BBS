<%@page import="java.util.List"%>
<%@page import="com.bbs.model.Moderator"%>
<%@page import="com.bbs.model.Annoucement"%>
<%@page import="com.bbs.model.Forum"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta charset="UTF-8">
<title>西科大BBS论坛-用户查看主题贴-欢迎来到西科大BBS论坛，这里有最新的校园咨询，最热的校园热点！</title>
<link rel="stylesheet" href="css/browsecommon.css" />
<link rel="stylesheet" href="css/browse.css" />

<script type="text/javascript">
	function docheck() {
		alert("发帖成功！");
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
		Moderator moderator = (Moderator) request.getSession().getAttribute("moderator");
		Annoucement annouce = new Annoucement();
		annouce.setAnnContent((String) request.getAttribute("annouce"));
		List<Forum> forumList = (List<Forum>) request.getAttribute("forumList");
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
				<div class="mid1_2usericon"><img  src="img/xusticon.png"/></div>

				<div class="mid1_2userinfo">
					<ul>
						<li>版主：<%=moderator.getModId()%>
						</li>
						<li>负责版块：<%=moderator.getModType()%>
						</li>
						<li>性别：<%=moderator.getModSex()%></li>
						<li>个性签名：<%=moderator.getModShow()%></li>
					</ul>
				</div>

			</div>

		</div>
		<!--中间板块-->
		<div class="mid2">

			<div class="imgtop">
				<img src="img/tiezi.jpg" /> <span><%=forumList.get(0).getForumType()%>-最新主题</span>
                <a href="<%=request.getContextPath()%>/login.do?modhome">返回板块页</a>
			</div>

			<div class="tiezi">
				<table cellspacing="0" cellpadding="0" class="table">
					<tr>
						<th style="width: 40px;">图片</th>
						<th style="width: 480px;">帖子标题</th>
						<th style="width: 100px;">发帖人</th>
						<th style="width: 100px;">最后回复</th>
						<th style="width: 80px;">热度</th>
					</tr>
					<%
						for (Forum forum : forumList) {
					%>

					<tr>
						<td><img src="img/tieziicon.jpg"></td>
						<td class="td1"><a
							href="<%=request.getContextPath()%>/reply.do?modfindforumId=<%=forum.getForumId()%>&page=1&pagesize=15">
								<div><%=forum.getForumTitle()%></div>
						</a></td>
						<td><a href="#">
								<div><%=forum.getForumUserid()%></div>
						</a></td>
						<td><%=forum.getForumTime()%></td>
						<td><%=forum.getForumHeat()%></td>
					</tr>
					<%
						}
					%>

				</table>
				<div class="page_all">
					<div class="page">
						<ul>
							<ul>
								<%
									int totalPage = Integer.parseInt(request.getAttribute("totalPage") + "");
									int pageSize = Integer.parseInt(request.getAttribute("pageSize") + "");
								%>
								<li><a
									href="<%=request.getContextPath()%>/modsection.do?type=<%=forumList.get(0).getForumType()%>&page=<%=1%>&pagesize=<%=pageSize%>"><span
										class="arrow_left"></span></a></li>
								<%
									for (int i = 0; i < totalPage; i++) {
								%>
								<li><a
									href="<%=request.getContextPath()%>/modsection.do?type=<%=forumList.get(0).getForumType()%>&page=<%=i + 1%>&pagesize=<%=pageSize%>"><%=i + 1%></a>
								</li>
								<%
									}
								%>
								<li><a
									href="<%=request.getContextPath()%>/modsection.do?type=<%=forumList.get(0).getForumType()%>&page=<%=totalPage%>&pagesize=<%=pageSize%>"><span
										class="arrow_right"></span></a></li>
							</ul>
							<div class="clr"></div>
						</ul>
					</div>
				</div>
			</div>
			<!--CSS不再公用-->

			<div class="publish">
				<form
					action="modaddforum.do?type=<%=forumList.get(0).getForumType()%>"
					method="post">
					<p>发表主题贴</p>
					<div>
						<span>标题</span> </br> <input
							style="width: 100%; height: 100%; font-size: 18px;" type="text"
							name="forumTitle" /> </br> <span>内容</span> </br>
						<textarea name="forumContent"
							style="width: 100%; height: 150px; resize: none; font-size: 18px;"
							></textarea>

					</div>
					<input type="submit" onclick="docheck()" class="submit" value="发表" />
				</form>

			</div>
		</div>
		<!--mid2中间板块-->

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
<script type="text/javascript">
window.onload = function(){
	var url=document.location.href;  //获取浏览器访问栏里的地址
	        if( url.indexOf("r=")==-1 ){    //判断地址后面是否多了某些值，没有就进方法里进行刷新
	  var t = new Date();
	            window.location.href ="<%=request.getContextPath()%>/modsection.do?type=<%=forumList.get(0).getForumType()%>&page=<%=request.getSession().getAttribute("pagenum")%>&pagesize=10&r="+ t.getTime();
		}
	}
</script>
</html>
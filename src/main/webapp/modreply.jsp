<%@page import="java.util.List"%>
<%@page import="com.bbs.model.Moderator"%>
<%@page import="com.bbs.model.Forum"%>
<%@page import="com.bbs.model.Reply"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta charset="UTF-8">
<title>西科大BBS论坛-版主回复贴-欢迎来到西科大BBS论坛，这里有最新的校园咨询，最热的校园热点！</title>
<link rel="stylesheet" href="css/replycommon.css" />
<link rel="stylesheet" href="css/reply.css" />
<script type="text/javascript">
	function docheck() {
		alert("发帖成功！");
	}
</script>
</head>
<%
	Moderator moderator = (Moderator) request.getSession().getAttribute("moderator");
	Forum forum = (Forum) request.getAttribute("forum");
	List<Reply> replyList = (List<Reply>) request.getAttribute("replyList");
%>
<body>
	<div class="top">
		<div class="topicon"></div>
		<div class="toptitle"></div>
		<div class="toplogin">
			<a href="#"><span class="span1">修改个人信息</span></a> <a href="<%=request.getContextPath()%>/login.jsp"><span
				class="span2">注销</span></a>
		</div>
	</div>
	<div class="topimg">
		<!--CSS里图片背景-->
	</div>
	<div class="mid">

		<!--中间板块-->
		<div class="mid2">

			<div class="imgtop">
				<img src="img/tieziicon.jpg" /> <span><%=forum.getForumTitle()%></span>
                <a href="<%=request.getContextPath()%>/modsection.do?type=<%= forum.getForumType()%>&page=1&pagesize=10">返回主题页</a>
			</div>

			<div class="tiezi">
				<table cellspacing="0" cellpadding="0" class="table">
					<!--楼主层-->
					<tr>
						<td style="width: 145px;">
							<div class="perinfo">
								<img src="img/xusticon.png" />
								<div></div>
								<p><%=forum.getForumUserid() %></p>
								<a href="<%=request.getContextPath()%>/gaguser.do?userId=<%=forum.getForumUserid()%>&forumId=<%=forum.getForumId() %>&forumType=<%=forum.getForumType() %>&page=1&&pagesize=15"><span>禁言</span></a>
							</div>
						</td>
						<td style="width: 480px;">
							<div class="huitiecom">
								<div class="huitietop">
									<span>发表于<%=forum.getForumTime()%></span> <span class="louceng">1楼</span>
								</div>
								<span><%=forum.getForumContent()%></span>

							</div>
						</td>
					</tr>
					<%
						int i = 2;
						for (Reply reply : replyList) {
					%>


					<!--回复层-->
					<tr>
						<td style="width: 145px;">
							<div class="perinfo">
								<img src="img/usericon.jpg" />
								<div></div>
								<!--用户名-->
								<p><%=reply.getReplyUserid()%></p>
								<a href="<%=request.getContextPath()%>/gaguser.do?userId=<%=reply.getReplyUserid()%>&forumId=<%=reply.getReplyForumid()%>&forumType=<%=reply.getReplyType() %>&page=1&&pagesize=15"><span>禁言</span></a> 
								<a href="<%=request.getContextPath()%>/deletereply.do?replyId=<%=reply.getReplyId()%>&page=1&&pagesize=15"><span>删除此层</span></a>
							</div>
						</td>
						<td style="width: 480px;">
							<div class="huitiecom">
								<div class="huitietop">
									<!--时间-->
									<span>发表于<%=reply.getReplyTime()%></span>
									<!--楼层-->
									<span class="louceng"><%=i%>楼</span>
								</div>
								<!--帖子内容-->
								<span><%=reply.getReplyContent()%></span>

							</div>
						</td>
					</tr>

					<%
						i++;
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
									href="<%=request.getContextPath()%>/reply.do?modfindforumId=<%=forum.getForumId()%>&pagesize=<%=pageSize%>"><span
										class="arrow_left"></span></a></li>
								<%
									for (int j = 0; j < totalPage; j++) {
								%>
								<li><a
									href="<%=request.getContextPath()%>/reply.do?modfindforumId=<%=forum.getForumId()%>&page=<%=j + 1%>&pagesize=<%=pageSize%>"><%=j + 1%></a>
								</li>
								<%
									}
								%>
								<li><a
									href="<%=request.getContextPath()%>/reply.do?modfindforumId=<%=forum.getForumId()%>&page=<%=totalPage%>&pagesize=<%=pageSize%>"><span
										class="arrow_right"></span></a></li>
							</ul>
							<div class="clr"></div>
						</ul>
					</div>
				</div>

			</div>


			<div class="tiezi1">
				<form action="reply.do?modaddreply=<%=forum.getForumId()%>&page=1&pagesize=15"
					method="post">
					<p>发表回复</p>
					<table cellspacing="0" cellpadding="0" class="table">
						<tr>
							<td style="width: 145px;">
								<div class="perinfo">
									<img src="img/tiezi.jpg" />
									<div></div>
									<span><%=moderator.getModId()%></span> <input type="hidden"
										name=replyUserid value="<%=moderator.getModId()%>" /> <input
										type="hidden" name=replyType value="<%=forum.getForumType()%>" />
								</div>
							</td>
							<td style="width: 480px;">
								<div class="huitiecom">
										<textarea
										style="width: 100%; height: 100%; font-size: 18px; resize: none;"
										name=replyContent></textarea>
								</div>
							</td>
						</tr>

					</table>
					<input type="submit" onclick="docheck()" class="submit" value="回复" />
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
			<span> 版权所有：西科大项目一组 </span>
		</div>
	</div>

</body>
<script type="text/javascript">
window.onload = function(){
	var url=document.location.href;  //获取浏览器访问栏里的地址
	        if( url.indexOf("r=")==-1 ){    //判断地址后面是否多了某些值，没有就进方法里进行刷新
	  var t = new Date();
	            window.location.href ="<%=request.getContextPath()%>/reply.do?modfindforumId=<%=forum.getForumId()%>&page=<%=request.getSession().getAttribute("pagenum")%>&pagesize=15&r="+ t.getTime();
		}
	}
</script>
</html>
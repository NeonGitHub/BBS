package com.bbs.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bbs.model.Forum;
import com.bbs.model.Reply;
import com.bbs.model.User;
import com.bbs.service.PageService;
import com.bbs.service.ReplyService;
import com.bbs.service.UserService;

@Controller
public class ManagerController {

	@Resource
	private UserService userService;
	@Resource
	private ReplyService replyService;
	@Resource
	private PageService pageService;

	@RequestMapping(value = "/deletereply.do", params = "replyId")
	public String deleteReply(Model model, HttpServletRequest req){
		String replyId = (String) req.getParameter("replyId");
		String forumId=replyService.findFidById(replyId);
		int page=Integer.parseInt(req.getParameter("page"));
		int pageSize=Integer.parseInt(req.getParameter("pagesize"));
		int totalPage=pageService.getReplyPage(pageSize,forumId);
		//删除并查询
		List<Reply> replyList=replyService.deletereply(forumId,replyId,page,pageSize);
		Forum forum = replyService.findForumOne(forumId);
		model.addAttribute("replyList", replyList);
		model.addAttribute("forum", forum);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("pageSize",pageSize);
		return "forward:/modreply.jsp";		
	}

		@RequestMapping(value = "/gaguser.do", params = "userId")
		public String gagUser(Model model, HttpServletRequest req){
			String userId = (String) req.getParameter("userId");
			String forumType = (String) req.getParameter("forumType");
			String forumId = (String) req.getParameter("forumId");
			int page=Integer.parseInt(req.getParameter("page"));
			int pageSize=Integer.parseInt(req.getParameter("pagesize"));
			int totalPage=pageService.getReplyPage(pageSize,forumId);
			User user=userService.findUserById(userId);
			//用户表里没有这个用户（管理员或版主），进行禁言
			if(user!=null){
			   
				userService.gagUser(userId, forumType);
				
			}
			List<Reply> replyList = replyService.findReplyById(forumId,page,pageSize);
			Forum forum = replyService.findForumOne(forumId);
			model.addAttribute("replyList", replyList);
			model.addAttribute("forum", forum);
			model.addAttribute("totalPage", totalPage);
			model.addAttribute("pageSize",pageSize);
			return "forward:/modreply.jsp";		
		}
		
		
		
		
	
}

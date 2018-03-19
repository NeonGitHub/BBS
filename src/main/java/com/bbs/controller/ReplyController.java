package com.bbs.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bbs.model.Forum;
import com.bbs.model.Moderator;
import com.bbs.model.Reply;
import com.bbs.service.PageService;
import com.bbs.service.ReplyService;

@Controller
@RequestMapping("/reply.do")
public class ReplyController {
	@Resource
	private ReplyService replyService;
	@Resource
	private PageService pageService;
	//用户
	@RequestMapping(params = "findforumId")
	public String replyShow(HttpServletRequest req, Model model) {
		String forumId = req.getParameter("findforumId");
		int page=Integer.parseInt(req.getParameter("page"));
		int pageSize=Integer.parseInt(req.getParameter("pagesize"));
		int totalPage=pageService.getReplyPage(pageSize,forumId);
		HttpSession session=req.getSession();
		session.setAttribute("pagenum",page);
		List<Reply> replyList = replyService.findReplyById(forumId,page,pageSize);
		Forum forum = replyService.findForumOne(forumId);

		model.addAttribute("totalPage", totalPage);
		model.addAttribute("pageSize",pageSize);
		model.addAttribute("replyList", replyList);
		model.addAttribute("forum", forum);
		return "forward:/userreply.jsp";
	}

	@RequestMapping(params = "addreply")
	public String addreply(HttpServletRequest req, Model model,Reply reply) {
		String forumId = req.getParameter("addreply");
		reply.setReplyForumid(forumId);
		int page=Integer.parseInt(req.getParameter("page"));
		int pageSize=Integer.parseInt(req.getParameter("pagesize"));
		int totalPage=pageService.getReplyPage(pageSize,forumId);
		HttpSession session=req.getSession();
		session.setAttribute("pagenum",page);
		replyService.addReply(reply);
		List<Reply> replyList = replyService.findReplyById(forumId,page,pageSize);
		Forum forum = replyService.findForumOne(forumId);
		model.addAttribute("replyList", replyList);
		model.addAttribute("forum", forum);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("pageSize",pageSize);
		return "forward:/userreply.jsp";
	}
	
	//版主
	@RequestMapping(params = "modfindforumId")
	public String modreplyShow(HttpServletRequest req, Model model) {
		String forumId = req.getParameter("modfindforumId");
		int page=Integer.parseInt(req.getParameter("page"));
		int pageSize=Integer.parseInt(req.getParameter("pagesize"));
		int totalPage=pageService.getReplyPage(pageSize,forumId);
		HttpSession session=req.getSession();
		session.setAttribute("pagenum",page);
		List<Reply> replyList = replyService.findReplyById(forumId,page,pageSize);
		Forum forum = replyService.findForumOne(forumId);

		model.addAttribute("replyList", replyList);
		model.addAttribute("forum", forum);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("pageSize",pageSize);
		Moderator moderator = (Moderator) req.getSession().getAttribute("moderator");
		if(forum.getForumType().equals(moderator.getModType())){
			return "forward:/modreply.jsp";
		}
		return "forward:/modreply2.jsp";
		
	}

	@RequestMapping(params = "modaddreply")
	public String modaddreply(HttpServletRequest req, Model model,Reply reply) {
		String forumId = req.getParameter("modaddreply");
		reply.setReplyForumid(forumId);
		Moderator moderator = (Moderator) req.getSession().getAttribute("moderator");
		int page=Integer.parseInt(req.getParameter("page"));
		int pageSize=Integer.parseInt(req.getParameter("pagesize"));
		int totalPage=pageService.getReplyPage(pageSize,forumId);
		HttpSession session=req.getSession();
		session.setAttribute("pagenum",page);
		replyService.addReply(reply);
		List<Reply> replyList = replyService.findReplyById(forumId,page,pageSize);
		Forum forum = replyService.findForumOne(forumId);
		model.addAttribute("replyList", replyList);
		model.addAttribute("forum", forum);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("pageSize",pageSize);
		if(forum.getForumType().equals(moderator.getModType())){
			return "forward:/modreply.jsp";
		}
		return "forward:/modreply2.jsp";
		
	}
	
	

}

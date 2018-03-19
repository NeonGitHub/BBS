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
import com.bbs.model.User;
import com.bbs.service.AnnouceService;
import com.bbs.service.ForumService;
import com.bbs.service.PageService;

@Controller
public class ForumController {

	@Resource
	private ForumService forumService;
	@Resource
	private AnnouceService annouceService;
	@Resource
	private PageService pageService;
	
	
	//普通用户
	@RequestMapping(value = "/section.do", params = "type")
	public String forumBrowse(Model model, HttpServletRequest req) {
		HttpSession session=req.getSession();
		
		String typekey = (String) req.getParameter("type");
		int page=Integer.parseInt(req.getParameter("page"));
		session.setAttribute("pagenum",page);
		int pageSize=Integer.parseInt(req.getParameter("pagesize"));
		int totalPage=pageService.getkctotalpage(pageSize,typekey);
		/*
		 * List<Forum>forumList=forumService.choose(typeKey);
		 * model.addAttribute("forumList", forumList);
		 * 
		 * public List<Forum> choose(String){
		 * 
		 *   
		 * 
		 * }
		 * 
		 */
		switch (typekey) {
		case "校园热点":
			List<Forum> forumList1 = forumService.findForum("校园热点",page,pageSize);
			model.addAttribute("forumList", forumList1);
			break;
		case "社团活动":
			List<Forum> forumList2 = forumService.findForum("社团活动",page,pageSize);
			model.addAttribute("forumList", forumList2);
			break;
		case "学术交流":
			List<Forum> forumList3 = forumService.findForum("学术交流",page,pageSize);
			model.addAttribute("forumList", forumList3);
			break;
		case "失物招领":
			List<Forum> forumList4 = forumService.findForum("失物招领",page,pageSize);
			model.addAttribute("forumList", forumList4);
			break;
		default:
			break;
		}
		String annouce = annouceService.findAnnouce();
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("pageSize",pageSize);
		model.addAttribute("annouce", annouce);
		return "forward:/userbrowse.jsp";
	}

	@RequestMapping(value = "/addforum.do", params = "type")
	public String addforum(Model model, Forum forum, HttpServletRequest req) {
		User user = (User) req.getSession().getAttribute("user");
		String forumtype = (String) req.getParameter("type");
		forum.setForumUserid(user.getUserId());
		System.out.println(forumtype);
		forum.setForumType(forumtype);
		forum.setForumHeat(0);
		forum.setForumSort(0);

		System.out.println(forum.getForumTitle());
		forumService.addForum(forum);
		int page=Integer.parseInt(req.getParameter("page"));
		int pageSize=Integer.parseInt(req.getParameter("pagesize"));
		HttpSession session=req.getSession();
		session.setAttribute("pagenum",page);
		int totalPage=pageService.getkctotalpage(pageSize,forumtype);
		List<Forum> forumList = forumService.findForum(forumtype,page,pageSize);
		String annouce = annouceService.findAnnouce();
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("pageSize",pageSize);
		model.addAttribute("annouce", annouce);
		model.addAttribute("forumList", forumList);

		return "forward:/userbrowse.jsp";
	}

	
	//版主
	@RequestMapping(value = "/modsection.do", params = "type")
	public String modforumBrowse(Model model, HttpServletRequest req) {
		String typekey = (String) req.getParameter("type");
		int page=Integer.parseInt(req.getParameter("page"));
		int pageSize=Integer.parseInt(req.getParameter("pagesize"));
		HttpSession session=req.getSession();
		session.setAttribute("pagenum",page);
		int totalPage=pageService.getkctotalpage(pageSize,typekey);
		Moderator moderator = (Moderator) req.getSession().getAttribute("moderator");
		if (typekey.equals(moderator.getModType())) {
			List<Forum> forumList1 = forumService.findForum(typekey,page,pageSize);
			model.addAttribute("forumList", forumList1);
			String annouce = annouceService.findAnnouce();
			model.addAttribute("totalPage", totalPage);
			model.addAttribute("pageSize",pageSize);
			model.addAttribute("annouce", annouce);
			return "forward:/modbrowse.jsp";
		}
		switch (typekey) {
		case "校园热点":
			List<Forum> forumList1 = forumService.findForum("校园热点",page,pageSize);
			model.addAttribute("forumList", forumList1);
			break;
		case "社团活动":
			List<Forum> forumList2 = forumService.findForum("社团活动",page,pageSize);
			model.addAttribute("forumList", forumList2);
			break;
		case "学术交流":
			List<Forum> forumList3 = forumService.findForum("学术交流",page,pageSize);
			model.addAttribute("forumList", forumList3);
			break;
		case "失物招领":
			List<Forum> forumList4 = forumService.findForum("失物招领",page,pageSize);
			model.addAttribute("forumList", forumList4);
			break;
		default:
			break;
		}
		String annouce = annouceService.findAnnouce();
		model.addAttribute("annouce", annouce);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("pageSize",pageSize);
		return "forward:/modbrowse2.jsp";
	}

	@RequestMapping(value = "/modaddforum.do", params = "type")
	public String modaddforum(Model model, Forum forum, HttpServletRequest req) {
		Moderator moderator = (Moderator) req.getSession().getAttribute("moderator");
		String forumtype = (String) req.getParameter("type");
		int page=Integer.parseInt(req.getParameter("page"));
		int pageSize=Integer.parseInt(req.getParameter("pagesize"));
		HttpSession session=req.getSession();
		session.setAttribute("pagenum",page);
		int totalPage=pageService.getkctotalpage(pageSize,forumtype);
		forum.setForumUserid(moderator.getModId());
		System.out.println(forumtype);
		forum.setForumType(forumtype);
		forum.setForumHeat(0);
		forum.setForumSort(0);

		System.out.println(forum.getForumTitle());
		forumService.addForum(forum);
		List<Forum> forumList = forumService.findForum(forumtype,page,pageSize);
		String annouce = annouceService.findAnnouce();
		model.addAttribute("annouce", annouce);
		model.addAttribute("forumList", forumList);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("pageSize",pageSize);

		if(forumtype.equals(moderator.getModType())){
			return "forward:/modbrowse.jsp";	
		}
		return "forward:/modbrowse2.jsp";
	}
	
	@RequestMapping(value = "/deleteforum.do", params = "forumId")
	public String deleteForum(Model model, HttpServletRequest req) {
		String forumId = req.getParameter("forumId");
		int page=Integer.parseInt(req.getParameter("page"));
		int pageSize=Integer.parseInt(req.getParameter("pagesize"));
		HttpSession session=req.getSession();
		session.setAttribute("pagenum",page);
		Moderator moderator = (Moderator) session.getAttribute("moderator");
		String type=moderator.getModType();
		int totalPage=pageService.getkctotalpage(pageSize,type);
		List<Forum> forumList = forumService.deleteforum(type, forumId,page,pageSize);
		String annouce = annouceService.findAnnouce();
		model.addAttribute("annouce", annouce);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("pageSize",pageSize);
		model.addAttribute("forumList", forumList);
		return "forward:/modbrowse.jsp";
	}

	@RequestMapping(value = "/topforum.do", params = "forumId")
	public String topForum(Model model, HttpServletRequest req) {
		String forumId = req.getParameter("forumId");
		int page=Integer.parseInt(req.getParameter("page"));
		int pageSize=Integer.parseInt(req.getParameter("pagesize"));
		HttpSession session=req.getSession();
		session.setAttribute("pagenum",page);
		Moderator moderator = (Moderator) session.getAttribute("moderator");
		String type=moderator.getModType();
		int totalPage=pageService.getkctotalpage(pageSize,type);
		List<Forum> forumList = forumService.topforum(type, forumId,page,pageSize);
		String annouce = annouceService.findAnnouce();
		model.addAttribute("annouce", annouce);
		model.addAttribute("forumList", forumList);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("pageSize",pageSize);
		return "forward:/modbrowse.jsp";
	}

}

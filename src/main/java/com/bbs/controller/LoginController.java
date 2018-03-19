package com.bbs.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bbs.model.Manager;
import com.bbs.model.Moderator;
import com.bbs.model.Section;
import com.bbs.model.User;
import com.bbs.service.AnnouceService;
import com.bbs.service.SectionService;
import com.bbs.service.UserService;

@Controller
@RequestMapping("/login.do")
public class LoginController {

	@Resource
	private UserService userService;
	@Resource
	private SectionService sectionService;
	@Resource
	private AnnouceService annouceService;

	@RequestMapping(params = "check=1")
	public String Login(Model model, HttpServletRequest req) {
		String userId = req.getParameter("userid");
		String pass = req.getParameter("password");
		HttpSession session = req.getSession();

		String loginkey = userService.userlogin(userId, pass);
		if (loginkey.equals("success")) {
			User user = userService.findUserById(userId);
			session.setAttribute("user", user);
			List<Section> secList = sectionService.findSection();
			String annouce = annouceService.findAnnouce();
			System.out.println(annouce);
			model.addAttribute("annouce", annouce);
			model.addAttribute("secList", secList);
			return "forward:/userhome.jsp";
		} else {

			return "forward:/login.jsp";
		}

	}

	@RequestMapping(params = "home")
	public String Home(Model model, HttpServletRequest req) {
			List<Section> secList = sectionService.findSection();
			String annouce = annouceService.findAnnouce();
			System.out.println(annouce);
			model.addAttribute("annouce", annouce);
			model.addAttribute("secList", secList);
			return "forward:/userhome.jsp";
	}
	
	@RequestMapping(params = "modhome")
	public String modHome(Model model, HttpServletRequest req) {
		HttpSession session = req.getSession();
		Moderator moderator =(Moderator) session.getAttribute("moderator");
		int forumnum=sectionService.findSectionForum(moderator.getModType());
		List<Section> secList = sectionService.findSection();
		String annouce = annouceService.findAnnouce();
		model.addAttribute("forumnum", forumnum);
		model.addAttribute("annouce", annouce);
		model.addAttribute("secList", secList);
		return "forward:/modhome.jsp";
	}
	
	@RequestMapping(params = "check=2")
	public String Login2(Model model, HttpServletRequest req) {
		String modId = req.getParameter("userid");
		String pass = req.getParameter("password");
		HttpSession session = req.getSession();

		String loginkey = userService.modlogin(modId, pass);
		if (loginkey.equals("success")) {
			Moderator moderator = userService.findModeratorById(modId);
			session.setAttribute("moderator",moderator);
			List<Section> secList = sectionService.findSection();
			String annouce = annouceService.findAnnouce();
			int forumnum=sectionService.findSectionForum(moderator.getModType());
			
			model.addAttribute("forumnum", forumnum);
			model.addAttribute("annouce", annouce);
			model.addAttribute("secList", secList);
			return "forward:/modhome.jsp";
		} else {

			return "forward:/login.jsp";
		}
	}
	
	
	@RequestMapping(params = "check=3")
	public String Login3(Model model, HttpServletRequest req) {
		String managerId = req.getParameter("userid");
		String pass = req.getParameter("password");
		HttpSession session = req.getSession();

		String loginkey = userService.managerlogin(managerId, pass);
		if (loginkey.equals("success")) {
			Manager manager = userService.findManagerById(managerId);
			session.setAttribute("manager",manager);
			List<Section> secList = sectionService.findSection();
			String annouce = annouceService.findAnnouce();
			List<User> userList=userService.findAllUser();
			model.addAttribute("userList", userList);
			model.addAttribute("annouce", annouce);
			model.addAttribute("secList", secList);
			return "forward:/managerhome.jsp";
		} else {

			return "forward:/login.jsp";
		}
	}
	
	
	
}

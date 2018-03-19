package com.bbs.controller;


import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.bbs.model.Section;
import com.bbs.model.User;
import com.bbs.service.AnnouceService;
import com.bbs.service.SectionService;
import com.bbs.service.UserService;

@Controller
public class RegisterController {
	@Resource
	private UserService userService;

	@Resource
	private SectionService sectionService;
	@Resource
	private AnnouceService annouceService;

	@RequestMapping(value="/register.do")
	public String Register( Model model, User user, HttpServletRequest req) {

		
		User user1=userService.findUserById(user.getUserId());
	    if(user1==null){
		userService.addUser(user);
		HttpSession session = req.getSession();
		session.setAttribute("user", user);
		List<Section> secList = sectionService.findSection();
		String annouce = annouceService.findAnnouce();
		model.addAttribute("annouce", annouce);
		model.addAttribute("secList", secList);
		return "forward:/userhome.jsp";
	    }
		return "forward:/error.html";
	    
	}

}

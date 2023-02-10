package com.gym.controller;

import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.gym.domain.UserVO;
import com.gym.service.MessageService;
import com.gym.service.NewsService;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/")
public class HomeController {
	@Inject
	private NewsService service;
	
	@Inject
	private MessageService mservice;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model, HttpServletRequest req) throws Exception {
		UserVO loginUser = (UserVO)req.getSession().getAttribute("loginUser");
		if(loginUser != null) {
			if(mservice.newMsg(loginUser.getUserid()) == 0) {
				req.getSession().setAttribute("newMsg", "F");
			} else {
				req.getSession().setAttribute("newMsg", "T");
			}
		}
		model.addAttribute("fnews", service.getFreeNews());
		model.addAttribute("nnews", service.getNotiNews());
		model.addAttribute("enews", service.getExNews());
		
		return "index";
	}
	
}
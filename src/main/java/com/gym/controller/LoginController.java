package com.gym.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

	@Controller
	@RequestMapping("/login/*")
	
	public class LoginController {
		@RequestMapping(value = "/login_index", method=RequestMethod.GET)
			public String getLogin() {
			
			return "/user/login";
		}
		
	
	}

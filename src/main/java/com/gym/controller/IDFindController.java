package com.gym.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

	@Controller
	@RequestMapping("/id/*")
	public class IDFindController {
	@RequestMapping(value = "/id_find", method = RequestMethod.GET)
	
	public String idFind() {
		
		return "/user/id_find";
	}
}

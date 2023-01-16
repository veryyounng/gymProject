package com.gym.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/pw/*")
public class PWFindController {
	@RequestMapping(value= "/pw_find", method = RequestMethod.GET)
	
	public String pwFind() {
		
		return "user/pw_find";
	}
}

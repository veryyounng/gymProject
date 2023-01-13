package com.gym.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ProfileController {

	@RequestMapping(value = "/profile/profile_check", method = RequestMethod.GET)
	public String profile_check() {
		return "/profile/profile_check";
	}
	
	@RequestMapping(value = "/profile/profile_modify", method = RequestMethod.GET)
	public String profile_modify() {
		return "/profile/profile_modify";
	}
	
	@RequestMapping(value = "/profile/profile_pw_modify", method = RequestMethod.GET)
	public String profile_pw_modify() {
		return "/profile/profile_pw_modify";
	}
	
	@RequestMapping(value = "/profile/profile_delete_user", method = RequestMethod.GET)
	public String profile_delete_user() {
		return "/profile/profile_delete_user";
	}
	
}

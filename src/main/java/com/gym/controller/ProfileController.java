package com.gym.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.gym.domain.UserVO;
import com.gym.service.UserService;

@Controller
@RequestMapping("/profile/*")
public class ProfileController {

	@Autowired
	private UserService userservice;
	
	@RequestMapping(value = {"/profile_pw_modify", "/profile_delete_user", "/my_freeboard", "/my_exercise"}, method = RequestMethod.GET)
	public void replace() {}
	
//	개인 정보 보기
	@RequestMapping(value = "/profile_check", method = RequestMethod.GET)
	public void profile_check(String userid, UserVO vo, Model model) throws Exception {
		userservice.userlist(userid);
		model.addAttribute(vo);
	}
	
//	개인 정보 수정
	@RequestMapping(value = "/profile_modify", method = RequestMethod.GET)
	public void profile_modify(String userid, UserVO vo, Model model) throws Exception {
		userservice.userlist(userid);
		model.addAttribute(vo);
	}
	
	@RequestMapping(value = "/profile_modify", method = RequestMethod.POST)
	public String profile_modify(UserVO vo) throws Exception {
		userservice.profile_modify(vo);
		return "redirect:/profile/profile_check";
	}
	
	@RequestMapping(value = "/profile_pw_modify", method = RequestMethod.POST)
	public String profile_pw_modify(UserVO vo) throws Exception {
		userservice.pw_modify(vo);
		return "redirect:/profile/profile_check";
	}
	
	@RequestMapping(value = "/profile/profile_delete_user", method = RequestMethod.POST)
	public String profile_delete_user(UserVO vo) throws Exception {
		userservice.delete_user(vo);
		return "redirect:/";
	}
	
}

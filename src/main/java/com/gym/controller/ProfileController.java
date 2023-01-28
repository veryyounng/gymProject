package com.gym.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.gym.domain.FreeBoardVO;
import com.gym.domain.UserVO;
import com.gym.service.ProfileService;
import com.gym.service.UserService;

@Controller
@RequestMapping("/profile/*")
public class ProfileController {

	@Autowired
	private UserService userservice;

	@Autowired
	private ProfileService profileservice;

//	단순 페이지 이동
//	특별한 기능이나 요구 없이 단순히 페이지를 이동하고자 할 때 사용한다.
//	ex) 메인 화면에서 로그인화면으로 이동
	@RequestMapping(value = { "/profile_pw_modify", "/profile_delete_user", "/my_freeboard"}, method = RequestMethod.GET)
	public void replace() {}

//	개인 정보 보기
	@RequestMapping(value = "/profile_check", method = RequestMethod.GET)
	public void profile_check(String userid, UserVO vo, Model model) throws Exception {
		userservice.userlist(userid);
		model.addAttribute("profile", vo);
	}

//	개인 정보 수정
	@RequestMapping(value = "/profile_modify", method = RequestMethod.GET)
	public void profile_modify(String userid, UserVO vo, Model model) throws Exception {
		userservice.userlist(userid);
		model.addAttribute("profile", vo);
	}

	@RequestMapping(value = "/profile_modify", method = RequestMethod.POST)
	public String profile_modify(UserVO vo) throws Exception {
		userservice.profile_modify(vo);
		return "redirect:/profile/profile_check";
	}

//	비밀번호 수정
	@RequestMapping(value = "/profile_pw_modify", method = RequestMethod.POST)
	public String profile_pw_modify(UserVO vo) throws Exception {
		userservice.pw_modify(vo);
		return "redirect:/profile/profile_check";
	}

//	회원 탈퇴
	@RequestMapping(value = "/profile/profile_delete_user", method = RequestMethod.POST)
	public String profile_delete_user(UserVO vo) throws Exception {
		userservice.delete_user(vo);
		return "redirect:/";
	}

//	타입은 void 혹은 String 둘 중 하나로 생각하기
//	void를 사용하는 경우는 Mapping에 적은 value 값과 목적지가 같을 때
//	String을 사용하는 경우는 value와 목적지가 다를 때
//	예를 들어 회원가입 기능이 완전히 실행된 뒤 index 페이지로 가고자 한다.
//	이럴 경우 Mapping의 value는 "/join"이지만 목적지는 "/index"가 된다.
//	이럴 경우 타입을 String으로 선언해준 후
//	return에 "/index"를 써줘서 메인화면으로 이동할 수 있게 해준다.
//	마이페이지 게시글목록
	@RequestMapping(value = "/my_exercise", method = RequestMethod.GET)
	public void my_exercise(Model model) throws Exception {
		List<FreeBoardVO> list = null;
		list = profileservice.my_exercise();
	//FreeBoardVO에있는 데이터들을 list에 담아서 가져오기때문에 model을 이용한다!
		model.addAttribute("list", list);
	}
	
//	마이페이지 게시글조회 / 마이페이지 수정용 게시글 조회
//	<a href="${cp}/profile/my_exercise_detail">
	@RequestMapping(value = {"/my_exercise_detail", "/my_exercise_modify"}, method = RequestMethod.GET)
	public void my_exercise(@RequestParam("b_num") int b_num, Model model) throws Exception{
		
//		데이터베이스에서 정보 수집
		FreeBoardVO vo = profileservice.my_exercise(b_num);
//		데이터베이스에서 수집한 정보들을 view에 뿌려줄 준비 완료
		model.addAttribute("vo",vo);
	}
	
//	form의 method에 따라 같은 이름의 목적지를 가졌지만 controller의 requestMethod를 참고해서 다른 곳으로 간다.
//	<form method="get" action="${path}/profile/my_exercise_modify">
//	<form method="post" action="${path}/profile/my_exercise_modify">
	
//	마이페이지 게시글 수정하는 기능
	@RequestMapping(value = "/my_exercise_modify", method = RequestMethod.POST)
	public String my_exercise_modify(FreeBoardVO free) throws Exception{
		profileservice.mymodify(free);
//		게시글을 수정하는 메소드를 완료한 후 게시글 목록으로 들어가겠다
		return "redirect:/profile/my_exercise";
//		게시글을 수정하는 메소드를 완료한 후 애가 수정한 게시글을 확인하겠다.
//		return "redirect:/profile/my_exercise_detail?B_num="+free.getB_num();
	}
	
//	마이페이지 게시글 삭제
	@RequestMapping(value = "/my_exercise_delete", method = RequestMethod.POST)
	public String my_exercise_delete(@RequestParam("b_num") int b_num) throws Exception{
		profileservice.mydelete(b_num);
		return "redirect:/profile/my_exercise";
	}
}

package com.gym.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gym.dao.MessageDAO;
import com.gym.domain.UserVO;
import com.gym.service.MailSendService;
import com.gym.service.MessageService;
import com.gym.service.UserService;

@Controller
@RequestMapping("/user/*")
public class UserController {

	@Autowired
	private UserService service;

	@Autowired
	private MailSendService mailService;
	
	@Autowired
	private MessageService messageService;
	


	@RequestMapping(value = { "/login", "/join", "id_find", "/pw_find" , "/changePw"}, method = RequestMethod.GET)
	public void replace() {
	}

//  로그인
	@PostMapping("/login")
	public String login(UserVO vo, HttpServletRequest req, RedirectAttributes ra) throws Exception {
		UserVO loginUser = service.login(vo);
		if(loginUser == null) {
		
			ra.addFlashAttribute("loginfail", "F");
			return "redirect:/user/login";
		}
		else {
			req.getSession().setAttribute("loginUser", loginUser);
			if(messageService.newMsg(loginUser.getUserid()) == 0) {
				req.getSession().setAttribute("newMsg", "F");
			} else {
				req.getSession().setAttribute("newMsg", "T");
			}
			return "redirect:/";
		}
	}

	@RequestMapping(value = "/join_email", method = RequestMethod.POST)
	public void join_email() {

	}

//	이메일 인증
	@GetMapping("/mailCheck")
	@ResponseBody
	public String mailCheck(@RequestParam("email") String email) {
		System.out.println("이메일 인증 요청이 들어옴!");
		System.out.println("인증 이메일 : " + email);
		return mailService.joinEmail(email);
	}

//  회원가입 폼으로 이동할 때 미리 입력한 이메일 가져오기
	@RequestMapping(value = "/join_form", method = RequestMethod.POST)
	public void join_form(@RequestParam("email") String email, Model model) {
		model.addAttribute("email", email);
	}

//  id 중복체크 
	@ResponseBody
	@RequestMapping(value = "/idchk", method = RequestMethod.POST)
	public String idchk(@RequestParam("userid") String userid) throws Exception {
		int result = service.idchk(userid);
		if (result != 0) {
			return "fail";
		} else {
			return "success";
		}
	}

//	회원가입 완료
	@RequestMapping(value = "/join_complete", method = RequestMethod.POST)
	public String join_complete(UserVO vo, @RequestParam("userid") String userid) throws Exception {
		int result = service.idchk(userid);
		try {
			if (result != 0) {
				return "/";
			} else {
				service.join(vo);
			}
		} catch (Exception e) {
			throw new RuntimeException();
		}
		return "redirect:/user/login";
	} 

//	로그아웃
	@GetMapping("/logout")
	public String logout(HttpServletRequest req, RedirectAttributes ra) {
		HttpSession session = req.getSession();
		session.invalidate();
		ra.addFlashAttribute("logout", "T");
		return "redirect:/";
	}
	
//	아이디 찾기
	@PostMapping("/findedid")
	public @ResponseBody UserVO postFindId(@RequestParam("username") String username, @RequestParam("email") String email) throws Exception {
		UserVO result = service.findId(username, email);
		if(result == null) {
			return null;
		}
		return result;
	}
	
//	이메일로 인증번호 인증
	@PostMapping("/findpw")
	public @ResponseBody String postfindpw(@RequestParam("email") String email, @RequestParam("userid") String userid) throws Exception {
		if(service.findpw(userid, email) == 1) {
			String result = mailService.findPwEmail(email);
			return result;
		}
		else {
			return null;
		}
		
	}
	
//	비밀번호 변경 view 보여주기 post방식
	@PostMapping("/changePW_view")
	public String postChangePW_view(@RequestParam("username") String userid, Model model) throws Exception{
		model.addAttribute("userid", userid);
		return "/user/changePW";
	}
//	비밀번호 변경하기
	@PostMapping("/changePW")
	public String postChangePW(String userpw, String userid) throws Exception{
		service.changePW(userid, userpw);
		return "redirect:/user/login";
	}

}
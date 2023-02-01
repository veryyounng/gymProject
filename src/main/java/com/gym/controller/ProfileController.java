package com.gym.controller;

import java.util.List;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gym.domain.FreeBoardVO;
import com.gym.domain.Page;
import com.gym.domain.ReplyPage;
import com.gym.domain.ReplyVO;
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

	@RequestMapping(value = { "/profile_pw_modify", "/profile_delete_user" }, method = RequestMethod.GET)
	public void replace() {
	}

//	개인 정보 보기, 개인 정보 수정
	@RequestMapping(value = { "/profile_check", "/profile_modify" }, method = RequestMethod.GET)
	public void profile_check(String userid, UserVO vo, Model model) throws Exception {
		userservice.userlist(userid);
		model.addAttribute("profile", vo);
	}

//	개인 정보 수정
	@RequestMapping(value = "/profile_modify", method = RequestMethod.POST)
	public String profile_modify(UserVO vo, HttpServletRequest req) throws Exception {
		userservice.profile_modify(vo);
		HttpSession session = req.getSession();
		session.setAttribute("loginUser", vo);
		return "redirect:/profile/profile_check";
	}

//	비밀번호 수정
	@RequestMapping(value = "/profile_pw_modify", method = RequestMethod.POST)
	public String profile_pw_modify(UserVO vo, String userpw, HttpServletRequest req, RedirectAttributes ra)
			throws Exception {
		if (userservice.pw_modify(vo) == 1) {
			HttpSession session = req.getSession();
			session.setAttribute("loginUser.userpw", userpw);
			return "redirect:/profile/profile_check";
		} else {
			ra.addFlashAttribute("modifyFail", "F");
			return "redirect:/profile/profile_pw_modify";
		}
	}

//	회원 탈퇴
	@RequestMapping(value = "/profile/profile_delete_user", method = RequestMethod.POST)
	public String profile_delete_user(UserVO vo, HttpServletRequest req) throws Exception {
		userservice.delete_user(vo);
		HttpSession session = req.getSession();
		session.invalidate();
		return "redirect:/";
	}

	
	
//	마이페이지(자게) 게시글 목록, 개수
	@RequestMapping(value = "/my_freeboard", method = RequestMethod.GET)
	public void my_free(Model model, HttpServletRequest req, int num) throws Exception {
		Page page = new Page();
		String userid = ((UserVO) req.getSession().getAttribute("loginUser")).getUserid();

		page.setNum(num);
		page.setCount(profileservice.getMyFreeCnt(userid));

		List<FreeBoardVO> list = null;
		list = profileservice.getMyFreeList(userid, page.getDisplayPost(), page.getPostNum());

		model.addAttribute("list", list);
		model.addAttribute("page", page);
		model.addAttribute("select", num);
	}

//	마이페이지(자게) 게시글 조회

//	마이페이지(자게) 게시글 작성

//	마이페이지(자게) 수정용 게시글 조회

//	마이페이지(자게) 게시글 수정

//	마이페이지(자게) 게시글 삭제
	@RequestMapping(value = "/my_free_delete", method = RequestMethod.POST)
	public String my_free_delete(int b_num) throws Exception {
		profileservice.myFreeDelete(b_num);
		return "redirect:/profile/my_freeboard?num=1";
	}

//	마이페이지(자게) 게시글 일괄 삭제
	@RequestMapping(value = "my_free_delete_all", method = RequestMethod.POST)
	public String my_free_delete_all(HttpServletRequest req) throws Exception {
		String userid = ((UserVO) req.getSession().getAttribute("loginUser")).getUserid();
		profileservice.myFreeDeleteAll(userid);
		return "redirect:/profile/my_freeboard?num=1";
	}

//	마이페이지(자게) 댓글 조회, 개수
	@RequestMapping(value = "/my_freeboard_reply", method = RequestMethod.GET)
	public String my_free_rep(Model model, HttpServletRequest req, int num) throws Exception {
		ReplyPage page = new ReplyPage();
		String userid = ((UserVO) req.getSession().getAttribute("loginUser")).getUserid();

		page.setNum(num);
		page.setCount(profileservice.getMyFreeRepCnt(userid));

		List<ReplyVO> list = null;
		list = profileservice.getMyFreeRepList(userid, page.getDisplayPost(), page.getPostNum());

		model.addAttribute("list", list);
		model.addAttribute("page", page);
		model.addAttribute("select", num);
		
		return "profile/my_freeboard?num=1";
	} 

//	마이페이지(자게) 댓글 삭제
	@RequestMapping(value = "/my_free_reply_delete", method = RequestMethod.POST)
	public String my_free_reply_delete(int c_num) throws Exception {
		profileservice.myFreeRepDelete(c_num);
		return "redirect:/profile/my_freeboard?num=1";
	}

//	마이페이지(자게) 댓글 일괄 삭제
	@RequestMapping(value = "my_free_reply_delete_all", method = RequestMethod.POST)
	public String my_free_delete_reply_all(HttpServletRequest req) throws Exception {
		String userid = ((UserVO) req.getSession().getAttribute("loginUser")).getUserid();
		profileservice.myFreeRepDeleteAll(userid);
		return "redirect:/profile/my_freeboard_reply?num=1";
	}
}

	
	
	
	
	
	
	
	
	
	
	
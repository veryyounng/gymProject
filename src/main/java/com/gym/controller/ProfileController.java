package com.gym.controller;

import java.util.List;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gym.domain.FreeBoardVO;
import com.gym.domain.Page;
import com.gym.domain.ReplyPage;
import com.gym.domain.ReplyVO;
import com.gym.domain.ReservationVO;
import com.gym.domain.UserVO;
import com.gym.service.FreeBoardService;
import com.gym.service.ProfileService;
import com.gym.service.UserService;

@Controller
@RequestMapping("/profile/*")
public class ProfileController {

	@Autowired
	private UserService userservice;

	@Autowired
	private ProfileService profileservice;

	@Autowired
	private FreeBoardService freeservice;

	@RequestMapping(value = { "/profile_pw_modify", "/profile_delete_user",
			"/my_reserve_past", "/my_free_write", "/my_exe" }, method = RequestMethod.GET)
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
	
	
	
//	현재 예약 내역 조회, 개수
	@RequestMapping(value = "/my_reserve_now", method = RequestMethod.GET)
	public void my_reserve(int num, Model model, HttpServletRequest req)  throws Exception {
		String userid = ((UserVO) req.getSession().getAttribute("loginUser")).getUserid();
		Page page = new Page();
		
		page.setNum(num);
		page.setCount(profileservice.getMyReserveCnt(userid));
		
		List<ReservationVO> list = null;
		list = profileservice.getMyReserve(userid, page.getDisplayPost(), page.getPostNum());
		
		model.addAttribute("page", page);
		model.addAttribute("select", num);
		model.addAttribute("list", list);
	}
	
//	예약 취소
	@RequestMapping(value = "/my_reserve_delete", method = RequestMethod.POST)
	public String my_reserve_delete(int rv_num, int num) throws Exception {
		profileservice.my_reserve_delete(rv_num);
		return "redirect:/profile/my_reserve_now?num=" + num;
	}
	
//	과거 예약 내역 조회, 개수
	@RequestMapping(value = "/my_reserve_past", method = RequestMethod.POST)
	public String my_reserve_past
	(int num, String datepick, String date_list, String lecturepick,
			String lecture_list, Model model, HttpServletRequest req)  throws Exception {
		String userid = ((UserVO) req.getSession().getAttribute("loginUser")).getUserid();
		Page page = new Page();
		
		page.setNum(num);
		page.setCount(profileservice.getMyReservePastCnt(userid, datepick, date_list, lecturepick, lecture_list));
		
		List<ReservationVO> list = null;
		list = profileservice.getMyReservePast(userid, datepick, date_list, lecturepick, lecture_list, page.getDisplayPost(), page.getPostNum());
		
		model.addAttribute("page", page);
		model.addAttribute("datepick", datepick);
		model.addAttribute("lecturepick", lecturepick);
		model.addAttribute("select", num);
		model.addAttribute("list", list);
		
		return "/profile/my_reserve_past?num=1";
	}

	
	
//	마이페이지(자게) 게시글 목록, 개수
	@RequestMapping(value = "/my_free", method = RequestMethod.GET)
	public void my_free(int num, Model model, HttpServletRequest req) throws Exception {
		String userid = ((UserVO) req.getSession().getAttribute("loginUser")).getUserid();
		Page page = new Page();
		ReplyPage replypage = new ReplyPage();

		page.setNum(num);
		page.setCount(profileservice.getMyFreeCnt(userid));
		replypage.setCount(profileservice.getMyFreeRepCnt(userid));

		List<FreeBoardVO> list = null;
		list = profileservice.getMyFreeList(userid, page.getDisplayPost(), page.getPostNum());

		model.addAttribute("page", page);
		model.addAttribute("replypage", replypage);
		model.addAttribute("select", num);
		model.addAttribute("list", list);
	}

//	마이페이지(자게) 게시글 조회
	@RequestMapping(value = "/my_free_detail", method = RequestMethod.GET)
	public void my_free_detail(@RequestParam("b_num") int b_num, int reply_num, Model model) throws Exception {
		FreeBoardVO vo = profileservice.getMyFreeDetail(b_num);

		ReplyPage page = new ReplyPage();
		page.setNum(reply_num);
		page.setCount(freeservice.getReplyCnt(b_num)); // 이거는 b_num에 대한 reply 개수

		List<ReplyVO> reply = null;
		reply = freeservice.freeReplylist(b_num, page.getDisplayPost(), page.getPostNum());

		model.addAttribute("freedetail", vo);
		model.addAttribute("page", page);
		model.addAttribute("reply", reply);
		model.addAttribute("select", reply_num);
	}

//	마이페이지(자게) 게시글 작성
	@RequestMapping(value = "/my_free_write", method = RequestMethod.POST)
	public String my_free_write(FreeBoardVO vo) throws Exception {
		freeservice.freeWrite(vo);
		return "redirect:/profile/my_free?num=1";
	}

//	마이페이지(자게) 수정용 게시글 조회
	@RequestMapping(value = "/my_free_modify", method = RequestMethod.GET)
	public void my_free_modify(@RequestParam("b_num") int b_num, Model model) throws Exception {
		FreeBoardVO vo = freeservice.getFreeDetail(b_num);
		model.addAttribute("freedetail", vo);
	}

//	마이페이지(자게) 게시글 수정
	@RequestMapping(value = "/my_free_modify", method = RequestMethod.POST)
	public String my_free_modify(FreeBoardVO vo) throws Exception {
		freeservice.freeModify(vo);
		int b_num = vo.getB_num();
		return "redirect:/profile/my_free_detail?reply_num=1&b_num=" + b_num;
	}

//	마이페이지(자게) 게시글 삭제
	@RequestMapping(value = "/my_free_delete", method = RequestMethod.POST)
	public String my_free_delete(int b_num, int num) throws Exception {
		profileservice.myFreeDelete(b_num);
		return "redirect:/profile/my_free?num=" + num;
	}

//	마이페이지(자게) 게시글 일괄 삭제
	@RequestMapping(value = "my_free_delete_all", method = RequestMethod.POST)
	public String my_free_delete_all(HttpServletRequest req, int num) throws Exception {
		String userid = ((UserVO) req.getSession().getAttribute("loginUser")).getUserid();
		profileservice.myFreeDeleteAll(userid);
		return "redirect:/profile/my_free?num=" + num;
	}

//	마이페이지(자게) 댓글 목록, 개수
	@RequestMapping(value = "/my_free_reply", method = RequestMethod.GET)
	public void my_free_reply(Model model, HttpServletRequest req, int num) throws Exception {
		String userid = ((UserVO) req.getSession().getAttribute("loginUser")).getUserid();
		Page page = new Page();
		ReplyPage replypage = new ReplyPage();

		replypage.setNum(num);
		page.setCount(profileservice.getMyFreeCnt(userid));
		replypage.setCount(profileservice.getMyFreeRepCnt(userid));

		List<ReplyVO> replylist = null;
		replylist = profileservice.getMyFreeRepList(userid, replypage.getDisplayPost(), replypage.getPostNum());

		model.addAttribute("page", page);
		model.addAttribute("replypage", replypage);
		model.addAttribute("replyselect", num);
		model.addAttribute("replylist", replylist);
	}

//	마이페이지(자게) 댓글 삭제
	@RequestMapping(value = "/my_free_reply_delete", method = RequestMethod.POST)
	public String my_free_reply_delete(int num, int c_num) throws Exception {
		profileservice.myFreeRepDelete(c_num);
		return "redirect:/profile/my_free_reply?num=" + num;
	}

//	마이페이지(자게) 댓글 일괄 삭제
	@RequestMapping(value = "my_free_reply_delete_all", method = RequestMethod.POST)
	public String my_free_delete_reply_all(HttpServletRequest req, int num) throws Exception {
		String userid = ((UserVO) req.getSession().getAttribute("loginUser")).getUserid();
		profileservice.myFreeRepDeleteAll(userid);
		return "redirect:/profile/my_free_reply?num=" + num;
	}
}

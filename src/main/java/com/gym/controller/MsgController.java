package com.gym.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gym.domain.MessageVO;
import com.gym.domain.Page;
import com.gym.domain.UserVO;
import com.gym.service.MessageService;

@Controller
@RequestMapping("/msg/*")
public class MsgController {
	
	@Inject
	private MessageService service;
	
	@GetMapping("/msgmain")
	public String getMsgmain(HttpServletRequest req, int num, Model model) {
		UserVO user = (UserVO)req.getSession().getAttribute("loginUser");
		String userid = user.getUserid();
		List<MessageVO> list = service.getMailbox(userid);
		Page page = new Page();
		
		page.setNum(num);
		page.setCount(service.getCount(userid));
		
		model.addAttribute("list", list);
		model.addAttribute("page", page);
		model.addAttribute("select", num);
		
		return "/msg/message";
	} 
	@GetMapping("/receiveDetail")		// 수신메세지 자세히보기
	public String receiveDetail(int msg_num, Model model,@ModelAttribute("select")int select, @ModelAttribute("page")Page page) {
		service.updateReception(msg_num);	// 수신여부 업데이트
		MessageVO result = service.getMSG(msg_num); // msg_num에 해당하는 MessageVO 가져오기
		
		model.addAttribute("result",result);
		
		return "/msg/msgview";
	}
	
	@GetMapping("/msgwrite")
	public void getPage() {}
	
	@PostMapping("/msgwrite")
	public void postwrite(String receiver, Model model) {
		model.addAttribute("receiver",receiver);
	}
	
	@PostMapping("/send")
	public String postSend(MessageVO vo, RedirectAttributes ra, HttpServletRequest req) throws Exception {
		UserVO user = (UserVO)req.getSession().getAttribute("loginUser");
		String userid = user.getUserid();
		vo.setSender(userid);
		if(service.msgSend(vo) == 1) {			// form에 hidden으로 loginUser.userid 넣어야함. 
			ra.addFlashAttribute("send","T");
		} else {
			ra.addFlashAttribute("send","F");
		}
		
		return "redirect:/msg/msgmain?num=1";			// msgmain에 send c:if문 생성해야함.
	}
	
	@GetMapping("/msgsend")
	public void getSentMsg(HttpServletRequest req, Model model, int num) {
		UserVO user = (UserVO)req.getSession().getAttribute("loginUser");
		String userid = user.getUserid();
		List<MessageVO> list = service.getSentMsg(userid);
		
		Page page = new Page();
		
		page.setNum(num);
		page.setCount(service.getSentCount(userid));
		
		model.addAttribute("list", list);
		model.addAttribute("page", page);
		model.addAttribute("select", num);
	}
	
	@GetMapping("/sentMsgDetail")		// 보낸메세지 자세히보기
	public String sentMsgDetail(int msg_num, Model model,@ModelAttribute("select")int select, @ModelAttribute("page")Page page) {
		MessageVO result = service.getMSG(msg_num);
		
		model.addAttribute("result",result);
		
		return "/msg/msgview_2";
	}
	
	@PostMapping("/msgDelete")
	public String msgDelete(int msg_num, RedirectAttributes ra) {
		if(service.msgDelete(msg_num) == 1) { 
			ra.addFlashAttribute("delete","T");
		} else {
			ra.addFlashAttribute("delete","F");
		}
		return "redirect:/msg/msgmain?num=1";
	}
}
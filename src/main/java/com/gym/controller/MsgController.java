package com.gym.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gym.domain.MessageVO;
import com.gym.domain.Page;
import com.gym.service.MessageService;

@Controller
@RequestMapping("/msg/*")
public class MsgController {
	
	@Autowired
	private MessageService service;
	
	@GetMapping("/msgmain")
	public void getMsgmain(HttpServletRequest req, int num, Model model) {
		String userid = (String)req.getSession().getAttribute("loginUser.userid");
		List<MessageVO> list = service.getMailbox(userid);
		
		Page page = new Page();
		
		page.setNum(num);
		page.setCount(service.getCount(userid));
		
		model.addAttribute("list", list);
		model.addAttribute("page", page);
		model.addAttribute("select", num);
	}
	@GetMapping("/receiveDetail")		// 수신메세지 자세히보기
	public void receiveDetail(int msg_num, Model model,@ModelAttribute("select")int select, @ModelAttribute("page")Page page) {
		service.updateReception(msg_num);	// 수신여부 업데이트
		MessageVO result = service.getMSG(msg_num); // msg_num에 해당하는 MessageVO 가져오기
		
		model.addAttribute("result",result);
	}
	
	@GetMapping("/send")
	public void getPage() {}
	
	@PostMapping("/send")
	public String postSend(MessageVO vo, RedirectAttributes ra) throws Exception {
		if(service.msgSend(vo) == 1) {			// form에 hidden으로 loginUser.userid 넣어야함. 
			ra.addFlashAttribute("send","T");
		} else {
			ra.addFlashAttribute("send","F");
		}
		
		return "redirect:/msg/msgmain";			// msgmain에 send c:if문 생성해야함.
	}
	
	@GetMapping("/sentMsg")
	public void getSentMsg(HttpServletRequest req, Model model, int num) {
		String userid = (String)req.getSession().getAttribute("loginUser.userid");
		List<MessageVO> list = service.getSentMsg(userid);
		
		Page page = new Page();
		
		page.setNum(num);
		page.setCount(service.getSentCount(userid));
		
		model.addAttribute("list", list);
		model.addAttribute("page", page);
		model.addAttribute("select", num);
	}
	
	@GetMapping("/sentMsgDetail")		// 보낸메세지 자세히보기
	public void sentMsgDetail(int msg_num, Model model,@ModelAttribute("select")int select, @ModelAttribute("page")Page page) {
		MessageVO result = service.getMSG(msg_num);
		
		model.addAttribute("result",result);
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
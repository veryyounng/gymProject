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
import com.gym.service.UserService;

@Controller
@RequestMapping("/msg/*")
public class MsgController {
	
	@Inject
	private MessageService service;
	
	@GetMapping("/msgmain")
	public String getMsgmain(HttpServletRequest req, int num, Model model) {
		UserVO user = (UserVO)req.getSession().getAttribute("loginUser");
		String userid = user.getUserid();
		
		Page page = new Page();
		
		page.setNum(num);
		page.setCount(service.getCount(userid));
		List<MessageVO> list = service.getMailbox(userid,page.getDisplayPost(),page.getPostNum());
		model.addAttribute("list", list);
		model.addAttribute("page", page);
		model.addAttribute("select", num);
		
		return "/msg/message";
	} 
	@GetMapping("/receiveDetail")		// 수신메세지 자세히보기
	public String receiveDetail(int msg_num, Model model,@ModelAttribute("select")int select, @ModelAttribute("page")Page page,HttpServletRequest req) {
		service.updateReception(msg_num);	// 수신여부 업데이트
		MessageVO result = service.getMSG(msg_num); // msg_num에 해당하는 MessageVO 가져오기
		UserVO loginUser = (UserVO)req.getSession().getAttribute("loginUser");
		if(service.newMsg(loginUser.getUserid()) == 0) {
			req.getSession().setAttribute("newMsg", "F");
		} else {
			req.getSession().setAttribute("newMsg", "T");
		}
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
		
		Page page = new Page();
		
		page.setNum(num);
		page.setCount(service.getSentCount(userid));
		List<MessageVO> list = service.getSentMsg(userid,page.getDisplayPost(),page.getPostNum());
		
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
	public String msgDelete(@RequestParam(value = "delete_num", required=false)int[] delete_num,@RequestParam(value="msg_num",required = false)int msg_num, RedirectAttributes ra) {
		
		if(delete_num != null) {
			boolean flag = false;
			for(int i=0;i<delete_num.length;i++) {
				if(service.msgDelete(delete_num[i]) == 1) {
					flag = true;
				}
				else {
					flag = false;
					break;
				}
			}
			if(flag) {
				ra.addFlashAttribute("delete","T");
			} else {
				ra.addFlashAttribute("delete","F");
			}
		}else {
			if(service.msgDelete(msg_num) == 1) {
				ra.addFlashAttribute("delete","T");
			} else {
				ra.addFlashAttribute("delete","F");
			}
		}
		return "redirect:/msg/msgmain?num=1";
	}
	
	@PostMapping("/msgSentDelete")
	public String msgSentDelete(int[] delete_num, RedirectAttributes ra) {
		boolean flag = false;
		for(int i=0;i<delete_num.length;i++) {
			if(service.msgDelete(delete_num[i]) == 1) {
				flag = true;
			}
			else {
				flag = false;
				break;
			}
		}
		if(flag) {
			ra.addFlashAttribute("delete","T");
		} else {
			ra.addFlashAttribute("delete","F");
		}
		
		return "redirect:/msg/msgsend?num=1";
	}
}
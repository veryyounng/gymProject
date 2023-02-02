package com.gym.ex_board.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.gym.ex_board.service.Ex_ReplyService;
import com.gym.ex_board.vo.Ex_ReplyVO;

@Controller
@RequestMapping(value="/ex_reply")
public class Ex_ReplyController {
	
	@Inject
	private Ex_ReplyService ex_replyservice;
	
	// 댓글 조회
	
	
	// 댓글 작성
	@RequestMapping(value = "/exc_write", method = RequestMethod.POST)
	public String exc_write(Ex_ReplyVO ervo) throws Exception {
		ex_replyservice.exc_write(ervo);
		
		return "redirect:/ex_board/ex_view?reply_num=1&ex_num=" + ervo.getEx_num();
	}
	
	// 댓글 단일 조회(수정용)
	@RequestMapping(value = "/ex_replymodify", method = RequestMethod.GET)
	public void exc_modify(@RequestParam("ex_num") int ex_num,
			@RequestParam("exc_num") int exc_num, Model model) throws Exception {
		
		Ex_ReplyVO ervo = new Ex_ReplyVO();
		ervo.setEx_num(ex_num);
		ervo.setExc_num(exc_num);
		
		Ex_ReplyVO ex_reply = ex_replyservice.exc_replySelect(ervo);
		
		model.addAttribute("ex_reply", ex_reply);
	}
	
	// 댓글 수정
	@RequestMapping(value = "/ex_replymodify", method = RequestMethod.POST)
	public String post_exc_modify(Ex_ReplyVO ervo) throws Exception {
		ex_replyservice.exc_modify(ervo);
		
		return "redirect:/ex_board/ex_view?reply_num=1&ex_num=" + ervo.getEx_num();
	}
	
	// 댓글 삭제
	@RequestMapping(value = "/ex_replydelete", method = RequestMethod.POST)
	public String exc_delete(Ex_ReplyVO ervo) throws Exception {
		
		ex_replyservice.exc_delete(ervo.getExc_num());
		
		return "redirect:/ex_board/ex_view?reply_num=1&ex_num=" + ervo.getEx_num();
		
	}	
	
}

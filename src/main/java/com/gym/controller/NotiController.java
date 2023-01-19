package com.gym.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.gym.domain.NoticeVO;
import com.gym.domain.Page;
import com.gym.service.NoticeService;

@Controller
@RequestMapping("/board/*")
public class NotiController {
	
	@Inject
	private NoticeService service;
	
	@RequestMapping(value="/notice", method=RequestMethod.GET)
	public void getNotice(Model model, @RequestParam("num") int num) throws Exception{
		
		Page page = new Page();
		
		page.setNum(num);
		page.setCount(service.getCnt());
		
		List<NoticeVO> list = service.getContent(page.getDisplayPost(), page.getPostNum());
		
		model.addAttribute("contents",list);
		model.addAttribute("page",page);
		model.addAttribute("select", num);
	}
	
	@RequestMapping(value="/notidetail", method=RequestMethod.GET)
	public void getDetail(@RequestParam("notice_num") int notice_num, Model model) throws Exception{
	
		service.notiViewCnt(notice_num);
		model.addAttribute("view", service.getDetail(notice_num));
	}
	
	@RequestMapping(value="/search_notice", method=RequestMethod.GET)
	public void getsearchList(String keyword, Model model, int num) throws Exception{
			
		Page page = new Page();
		
		page.setNum(num);
		page.setCount(service.getSearchCnt(keyword));
		
		List<NoticeVO> list = null;
		list = service.getSearchList(page.getDisplayPost(),page.getPostNum(), keyword);
		model.addAttribute("contents",list);
		model.addAttribute("page",page);
		model.addAttribute("select", num);
		model.addAttribute("keyword",keyword);
		
	}
	
}
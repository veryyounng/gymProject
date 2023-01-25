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
	
	@RequestMapping(value="/notidetail", method=RequestMethod.GET)
	public void getDetail(String keyword, int num, int notice_num, Model model) throws Exception{
	
		service.notiViewCnt(notice_num);
		model.addAttribute("view", service.getDetail(notice_num));
		model.addAttribute("keyword",keyword);
		model.addAttribute("select", num);
	}
	
	@RequestMapping(value="/notice", method=RequestMethod.GET)
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
	
	@RequestMapping(value="/notiwrite", method=RequestMethod.GET)
	public void getNotiWrite() throws Exception {
		
	}
	
	@RequestMapping(value="/notiwrite", method=RequestMethod.POST)
	public String postWrite(NoticeVO nvo) throws Exception{
		service.postWrite(nvo);
		return "redirect:/board/notidetail?num=1&keyword=&notice_num=" + service.getMaxNum();
		
	}

	
}
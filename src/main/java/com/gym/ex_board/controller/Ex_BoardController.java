package com.gym.ex_board.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gym.ex_board.service.Ex_BoardService;
import com.gym.ex_board.service.Ex_ReplyService;
import com.gym.ex_board.vo.Ex_BoardVO;
import com.gym.ex_board.vo.Ex_Page;
import com.gym.ex_board.vo.Ex_ReplyPage;
import com.gym.ex_board.vo.Ex_ReplyVO;

@Controller
@RequestMapping(value="/ex_board")
public class Ex_BoardController {

	@Inject
	private Ex_BoardService service;
	
	@Inject
	private Ex_ReplyService ex_replyservice;
	
	@RequestMapping(value="/ex_test", method=RequestMethod.GET)
	public void Ex_Test() throws Exception {
		
	}
	   
	//게시물 리스트
	@RequestMapping(value="/ex_list", method=RequestMethod.GET)
	public void getlist(Model model, @RequestParam("num") int num,
			@RequestParam(value = "searchType", required = false, defaultValue = "title") String searchType,
			@RequestParam(value = "keyword", required = false, defaultValue = "") String keyword) throws Exception {
		
		Ex_Page page = new Ex_Page();
		
		page.setNum(num);
		page.setCount(service.ex_SearchCount(searchType, keyword));
		
		//검색 타입 + 검색어
		//page.setSearchTypeKey(searchType, keyword);
		page.setSearchType(searchType);
		page.setKeyword(keyword);
		
		List<Ex_BoardVO> list = null;
		list = service.ex_search(page.getDisplayPost(), page.getPostNum(), searchType, keyword);
		
		model.addAttribute("ex_list", list);
		model.addAttribute("ex_page", page);
		model.addAttribute("select", num);

		//model.addAttribute("searchType", searchType);
		//model.addAttribute("keyword", keyword);
		
	}

	//게시물 작성 GET
	@RequestMapping(value="/ex_write", method=RequestMethod.GET)
	public void getEx_Write() throws Exception {
		
	}
	
	//게시물 작성 POST
	@RequestMapping(value = "/ex_write", method = RequestMethod.POST)
	public String postEx_Write(Ex_BoardVO evo) throws Exception {
		
		service.write(evo);
		
		return "redirect:/ex_board/ex_list?num=1";
		
	}
	
	//게시물 보기 GET
	@RequestMapping(value = "/ex_view", method = RequestMethod.GET)
	public String getView(@RequestParam("ex_num") int ex_num, Model model, int reply_num)
		throws Exception {
		
		Ex_BoardVO evo = service.view(ex_num);
		
		model.addAttribute("ex_view", evo);
		
		// 댓글 조회
		Ex_ReplyPage erpage = new Ex_ReplyPage();
		erpage.setNum(reply_num);
		erpage.setCount(ex_replyservice.exc_count(ex_num));
		
		List<Ex_ReplyVO> ex_reply = null;
		ex_reply = ex_replyservice.exc_list(ex_num, erpage.getDisplayPost(), erpage.getPostNum());
		model.addAttribute("erpage",erpage);
		model.addAttribute("ex_reply", ex_reply);
		model.addAttribute("select", reply_num);
		
		return "/ex_board/ex_view";
	}
	
	//게시물 수정 GET
	@RequestMapping(value = "/ex_modify", method = RequestMethod.GET)
	public void getEx_Modify(@RequestParam("ex_num") int ex_num, Model model)
		throws Exception {
		
		Ex_BoardVO evo = service.view(ex_num);
		
		model.addAttribute("ex_view", evo);
		
	}
	
	//게시물 수정 POST
	@RequestMapping(value = "/ex_modify", method = RequestMethod.POST)
	public String postEx_Modify(Ex_BoardVO evo) throws Exception {
		
		service.Ex_Modify(evo);
		
		return "redirect:/ex_board/ex_view?ex_num=" + evo.getEx_num();
		
	}
	
	//게시물 삭제
	@RequestMapping(value = "/ex_delete", method = RequestMethod.POST)
	public String ex_delete(int ex_num) throws Exception {
		
		service.Ex_delete(ex_num);
		
		return "redirect:/ex_board/ex_list?num=1";
		
	}
	
	// ajax 댓글 조회
	@RequestMapping(value = "/exc_modiview", method = RequestMethod.POST)
	@ResponseBody
	public Ex_ReplyVO exc_modi(@RequestParam("exc_num") int exc_num) throws Exception {
		
		Ex_ReplyVO result = ex_replyservice.exc_modiview(exc_num);
		
		return result;
	}
	
	// ajax 댓글 수정
	@RequestMapping(value = "/exc_modireply", method = RequestMethod.POST)
	public String exc_modireply(Ex_ReplyVO ervo, int reply_num) throws Exception {
		
		ex_replyservice.exc_modireply(ervo);
		
		int ex_num = ervo.getEx_num();
		
		return "redirect:/ex_board/ex_view?reply_num=" + reply_num + "&ex_num=" + ex_num;
		
	}
	
	//게시물 목록 + 페이징 추가 + 검색
	/*
	@RequestMapping(value="/ex_search", method=RequestMethod.GET)
	public void getSearch(Model model, @RequestParam("num") int num,
			@RequestParam(value = "searchType", required = false, defaultValue = "title") String searchType,
			@RequestParam(value = "keyword", required = false, defaultValue = "") String keyword) throws Exception {
		
		Ex_Page page = new Ex_Page();
		
		page.setNum(num);
		page.setCount(service.ex_SearchCount(searchType, keyword));
		
		page.setSearchType(searchType);
		page.setKeyword(keyword);
		
		List<Ex_BoardVO> list = null;
		list = service.ex_search(page.getDisplayPost(), page.getPostNum(), searchType, keyword);
		
		model.addAttribute("ex_list", list);
		model.addAttribute("ex_page", page);
		model.addAttribute("select", num);
		
	}
	*/
	
}
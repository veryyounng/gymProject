package com.gym.ex_board.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.gym.ex_board.service.Ex_BoardService;
import com.gym.ex_board.vo.Ex_BoardVO;
import com.gym.ex_board.vo.Ex_Page;

@Controller
@RequestMapping(value="/ex_board")
public class ExBoardController {

	@Inject
	Ex_BoardService service;
	
	@RequestMapping(value="/ex_test", method=RequestMethod.GET)
	public void Ex_Test() throws Exception {
		
	}
	   
	//게시물 리스트
	@RequestMapping(value="/ex_list", method=RequestMethod.GET)
	public void getList(Model model, @RequestParam("num") int num) throws Exception {
		
		Ex_Page page = new Ex_Page();
		
		page.setNum(num);
		page.setCount(service.ex_count());
		
		List<Ex_BoardVO> list = null;
		list = service.ex_listPage(page.getDisplayPost(), page.getPostNum());

		model.addAttribute("ex_list", list);
		model.addAttribute("pageNum", page.getPageNum());

		// 현재 페이지
		model.addAttribute("select", num);

		model.addAttribute("ex_page", page);
	}

	//게시물 작성 GET
	@RequestMapping(value="/ex_write", method=RequestMethod.GET)
	public void getEx_Write() throws Exception {
		
	}
	
	//게시물 작성 POST
	@RequestMapping(value = "/ex_write", method = RequestMethod.POST)
	public String postEx_Write(Ex_BoardVO evo) throws Exception {
		service.write(evo);
		
		return "redirect:/ex_board/ex_list";
	}
	
	//게시물 보기 GET
	@RequestMapping(value = "/ex_view", method = RequestMethod.GET)
	public void getView(@RequestParam("ex_num") int ex_num, Model model)
		throws Exception {
		
		Ex_BoardVO evo = service.view(ex_num);
		
		model.addAttribute("ex_view", evo);
		
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
	@RequestMapping(value = "/ex_delete", method = RequestMethod.GET)
	public String ex_delete(int ex_num) throws Exception {
		
		service.Ex_delete(ex_num);
		
		return "redirect:/ex_board/ex_list";
	}
	
	//게시물 목록 + 페이징 추가
	@RequestMapping(value="/ex_listpage", method=RequestMethod.GET)
	public void getListPage(Model model, @RequestParam("num") int num) throws Exception {
		
		Ex_Page page = new Ex_Page();
		
		page.setNum(num);
		page.setCount(service.ex_count());
		
		List<Ex_BoardVO> list = null;
		list = service.ex_listPage(page.getDisplayPost(), page.getPostNum());

		model.addAttribute("ex_list", list);
		model.addAttribute("pageNum", page.getPageNum());

		// 현재 페이지
		model.addAttribute("select", num);

		model.addAttribute("ex_page", page);
		
		/*
		// 시작 및 끝 번호
		model.addAttribute("startPageNum", page.getStartPageNum());
		model.addAttribute("endPageNum", page.getEndPageNum());
		
		// 이전 및 다음
		model.addAttribute("prev", page.getPrev());
		model.addAttribute("next", page.getNext());
		*/
		
		

		
		/*
		// 게시물 총 갯수
		int count = service.ex_count();
		
		// 한 페이지에 표시될 게시물 갯수
		int postNum = 10;
		
		// 하단 페이징
		int pageNum = (int)Math.ceil((double)count/postNum);

		// 출력할 게시물
		int displayPost = (num - 1) * postNum;
		
		// 한번에 표시할 페이징 번호의 갯수
		int pageNum_cnt = 10;
		
		// 표시되는 페이지의 마지막 번호
		int endPageNum = (int)(Math.ceil((double)num / (double)pageNum_cnt) * pageNum_cnt);
				
		// 표시되는 페이지의 첫번째 번호
		int startPageNum = endPageNum - (pageNum_cnt - 1);
		
		// 마지막 번호 재 계산
		int endPageNum_tmp = (int)(Math.ceil((double)count / (double)pageNum_cnt));

		if(endPageNum > endPageNum_tmp) {
			endPageNum = endPageNum_tmp;
		}

		boolean prev = startPageNum == 1 ? false : true;
		boolean next = endPageNum * pageNum_cnt >= count ? false : true;
		
		List<Ex_BoardVO> list = null;
		list = service.ex_listPage(displayPost, postNum);
		
		model.addAttribute("ex_list", list);
		model.addAttribute("pageNum", pageNum);
		
		// 시작 및 끝 번호
		model.addAttribute("startPageNum", startPageNum);
		model.addAttribute("endPageNum", endPageNum);
		
		// 이전 및 다음
		model.addAttribute("prev", prev);
		model.addAttribute("next", next);
		
		// 현재 페이지
		model.addAttribute("select", num);
		*/
	}
	
	
}
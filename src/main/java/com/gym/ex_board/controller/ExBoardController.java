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
	public void getList(Model model) throws Exception {
		
		List<Ex_BoardVO> list = null;
		list = service.getList();
		
		model.addAttribute("ex_list", list);
	}

	//게시물 작성 GET
	@RequestMapping(value="/ex_write", method=RequestMethod.GET)
	public void Ex_Write() throws Exception {
		
	}
	
	//게시물 작성 POST
	@RequestMapping(value = "/ex_write", method = RequestMethod.POST)
	public String PostEx_Write(Ex_BoardVO evo) throws Exception {
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
	
	
}
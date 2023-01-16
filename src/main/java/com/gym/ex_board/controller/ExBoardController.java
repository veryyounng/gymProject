package com.gym.ex_board.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.gym.ex_board.service.Ex_BoardService;
import com.gym.ex_board.vo.Ex_BoardVO;

@Controller
@RequestMapping(value="/ex_board")
public class ExBoardController {

	@Inject
	Ex_BoardService service;
	
	@RequestMapping(value="/ex_test", method=RequestMethod.GET)
	public void Ex_Test() {
		
	}
	   
	@RequestMapping(value="/ex_list", method=RequestMethod.GET)
	public void getList(Model model) throws Exception {
		
		List<Ex_BoardVO> list = null;
		list = service.getList();
		
		model.addAttribute("ex_list", list);
	}
}
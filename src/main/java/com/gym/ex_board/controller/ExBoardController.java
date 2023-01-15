package com.gym.ex_board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="/ex_board")
public class ExBoardController {

	   @RequestMapping(value="/ex_test", method=RequestMethod.GET)
	   public void Ex_Test() {
	      
	   }
	   
}
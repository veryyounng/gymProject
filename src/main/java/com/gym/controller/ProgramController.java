package com.gym.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/program/*")
public class ProgramController {
	
	   @RequestMapping(value="/programid", method=RequestMethod.GET)
	   public void getProgram() {}
}
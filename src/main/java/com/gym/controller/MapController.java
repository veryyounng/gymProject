package com.gym.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/map/*")
public class MapController {
	   @RequestMapping(value="/map_index", method=RequestMethod.GET)
	   public String getMap() {
	      return "/contactus/map_index";
	   }
	
}
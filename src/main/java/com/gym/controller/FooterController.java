package com.gym.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/footer/*")
public class FooterController {
	
	@GetMapping("/privacy")
	public void getPrivacy() {}
	
	@GetMapping("/media")
	public void getMedia() {}
}

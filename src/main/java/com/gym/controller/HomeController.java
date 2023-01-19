package com.gym.controller;

import java.util.Locale;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.gym.service.NewsService;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/")
public class HomeController {
	@Inject
	public NewsService service;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) throws Exception {
		
		model.addAttribute("fnews", service.getFreeNews());
		model.addAttribute("nnews", service.getNotiNews());
		model.addAttribute("enews", service.getExNews());
		
		return "index";
	}
	
	
}
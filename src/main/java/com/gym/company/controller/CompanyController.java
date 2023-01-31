package com.gym.company.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/company")
public class CompanyController {

	@RequestMapping(value = "/company", method = RequestMethod.GET)
	public void company() throws Exception {
		
	}
}

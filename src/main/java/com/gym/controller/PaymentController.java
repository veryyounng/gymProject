package com.gym.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/payment/*")
public class PaymentController {
	
	@GetMapping("/pay")
	public void getPage() {}
	
}

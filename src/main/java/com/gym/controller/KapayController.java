package com.gym.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gym.service.KapayService;

import lombok.Setter;
import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("/payment/*")
public class KapayController {
	
	@Setter(onMethod_ = @Autowired)
	private KapayService kapayservice;
	
	@GetMapping("/kapay")
	public void getKapay() {}
	
	@PostMapping("/kapay")
	public String postKapay(@RequestBody Map<String, String> chan) {
		return "redirect:"+ kapayservice.kakaoPayReady(chan);
	}
	
	@GetMapping("/kakaoPaySuccess")
	public void kakaoPaySuccess(@RequestParam("pg_token") String pg_token, Model model) {
		model.addAttribute("info", kapayservice.kakaoPayInfo(pg_token));
	}
	
	@GetMapping("/kapayCancel")
	public String getKapaycancel() {return "/payment/kakaoPayCancel";}
	
	@GetMapping("/kakaoPaySuccessFail")
	public void kapayFail() {}
	
	
}

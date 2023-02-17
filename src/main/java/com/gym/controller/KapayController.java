package com.gym.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gym.domain.UserVO;
import com.gym.payment.vo.PreReadyVO;
import com.gym.service.KapayService;

import lombok.Setter;
import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("/payment/*")
public class KapayController {
	
	@Setter(onMethod_ = @Autowired)
	private KapayService kapayservice;
	
	@GetMapping({"/kapay","/pay"})
	public void getKapay() {}

/*	
	@PostMapping("/kapay")
	public String postKapay() {
		return "redirect:"+ kapayservice.kakaoPayReady();
	}
*/
	
	
	@PostMapping("/kapay01")
	public String postKapay01(@RequestParam("proNum") String proNum, HttpServletRequest req) throws Exception {
		
		UserVO vo = (UserVO)req.getSession().getAttribute("loginUser");
		String userId = vo.getUserid();
		PreReadyVO pr = kapayservice.testPreReady(proNum);
		
		String result = kapayservice.kakaoPayReady01(pr, req, userId);
		
		return "redirect:"+result;
		
	}

	/*
	@PostMapping("/kapay01")
	public String postKapay01(PayTestVO pvo) {
		
		String result = kapayservice.kakaoPayReady01(pvo); 
		
		return "redirect:"+result;
	}
	*/
	
	
	@GetMapping("/kakaoPaySuccess")
	public void kakaoPaySuccess(@RequestParam("pg_token") String pg_token, Model model,HttpServletRequest req) throws Exception {
		
		log.info("kakaoPaySuccess get............................................");
        log.info("kakaoPaySuccess pg_token : " + pg_token);
        
		model.addAttribute("info", kapayservice.kakaoPayInfo(pg_token));
		
		UserVO loginUser = (UserVO)req.getSession().getAttribute("loginUser");
		String userid = loginUser.getUserid();
		loginUser = kapayservice.updateloginUser(userid);
		System.out.println(loginUser.getDuedate());
		req.getSession().setAttribute("loginUser", loginUser);
		
	}
	
	@GetMapping("/kapayCancel")
	public String getKapaycancel() {return "/payment/kakaoPayCancel";}
	
	@GetMapping("/kakaoPaySuccessFail")
	public void kapayFail() {}
	
	
}

package com.gym.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gym.domain.UserVO;
import com.gym.service.MailSendService;
import com.gym.service.UserService;

@Controller
@RequestMapping("/user/*")
public class UserController {

   @Autowired
   private UserService service;
   
   @Autowired
   private MailSendService mailService;
 
   @RequestMapping(value = {"/login", "/join", "/id_find", "/pw_find"}, method = RequestMethod.GET)
   public void replace() {}
   
   
   @PostMapping("/login")
	public String login(UserVO vo, HttpServletRequest req) throws Exception{
		if(service.login(vo, req)) {
			
		}
		else {
			
		}
		return "redirect:/";
	}
   
   @RequestMapping(value = "/join_email", method = RequestMethod.POST)
   public void join_email() {
      
   }
   
   //이메일 인증
   @GetMapping("/mailCheck")
   @ResponseBody
   public String mailCheck(@RequestParam("email") String email) {
      System.out.println("이메일 인증 요청이 들어옴!");
      System.out.println("인증 이메일 : " + email);
      return mailService.joinEmail(email);
   }
   
   @RequestMapping(value = "/join_form", method = RequestMethod.POST)
   public void join_form(@RequestParam("email") String email, Model model) {
      model.addAttribute("email", email);
   }
   
   @ResponseBody
   @RequestMapping(value = "/idchk", method = RequestMethod.POST)
   public String idchk(@RequestParam("userid") String userid) throws Exception {
      int result = service.idchk(userid);
      if (result != 0) {
         return "fail";
      }
      else {
         return "success";
      }
   }
   
   @RequestMapping(value = "/join_complete", method = RequestMethod.POST)
   public String join_complete(UserVO vo, @RequestParam("userid") String userid) throws Exception {
      int result  = service.idchk(userid);
      try {
         if (result != 0) {
            return "/join_form";
         }
         else {
            service.join(vo);
         }
      } catch (Exception e) {
         throw new RuntimeException();
      }
      return "redirect:/user/login";
   }
   
   @GetMapping("/logout")
   public String logout(HttpServletRequest req, RedirectAttributes ra) {
	   HttpSession session = req.getSession();
	   session.invalidate();
	   ra.addFlashAttribute("logout", "T");
	   return "redirect:/";
   }
}
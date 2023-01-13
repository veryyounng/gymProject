package com.gym.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/faq/*")
public class FaqController {
   @RequestMapping(value="/faq_index", method=RequestMethod.GET)
   public String getFaq() {
      return "/contactus/faq_index";
   }
}
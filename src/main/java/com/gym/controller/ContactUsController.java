package com.gym.controller;


import java.util.HashMap;
import java.util.Map;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


@Controller
@RequestMapping(value="/contactus")
public class ContactUsController {

   @Autowired
   private JavaMailSender mailSender;
   
   @RequestMapping(value="/email_index", method=RequestMethod.GET)
   public void ContactUs() {
      
   }
   
   @RequestMapping(value="/email_test", method=RequestMethod.GET)
   public void ContactTest() {
      
   }
   
   @RequestMapping(value="/send", method = RequestMethod.GET)
   public ModelAndView sendEmail (@RequestParam Map<String, Object> paramMap, ModelMap model, ModelAndView mv)
   throws Exception {
      
      String username = (String)paramMap.get("username");
      String email = (String)paramMap.get("email");
      String title = (String)paramMap.get("title");
      String message = (String)paramMap.get("message");
      String company = "gymproject02@gmail.com";
   
      try {
         MimeMessage msg = mailSender.createMimeMessage();
         MimeMessageHelper messageHelper = new MimeMessageHelper(msg, true, "UTF-8");
         
         messageHelper.setSubject(title);
         messageHelper.setText("문의자 : " + username + "\n\n" + "내용\n" + message);
         messageHelper.setFrom(email);

         msg.setRecipients(MimeMessage.RecipientType.TO, InternetAddress.parse(company));
         mailSender.send(msg);
      } catch (MessagingException e) {
         System.out.println("MessagingException 오류입니다.");
         e.printStackTrace();
      }
      
      mv.setViewName("/index");
      return mv;
   }
   
   
   @RequestMapping(value="/send", method = RequestMethod.POST)
   @ResponseBody
   public Map <String, Object> sendEmailPost (@RequestBody Map<String, Object> cmail, HttpServletResponse response)
   throws Exception {
      
      String username = cmail.get("username").toString();
      String email = cmail.get("email").toString();
      String title = cmail.get("title").toString();
      String message = cmail.get("message").toString();
      String company = "gymproject02@gmail.com";
      
      try {
         MimeMessage msg = mailSender.createMimeMessage();
         MimeMessageHelper messageHelper = new MimeMessageHelper(msg, true, "UTF-8");
         
         messageHelper.setSubject(cmail.get("title").toString());
         messageHelper.setText("문의자 : " + username + "\n\n" + "내용\n" + message);
         messageHelper.setFrom(email);
         
         msg.setRecipients(MimeMessage.RecipientType.TO, InternetAddress.parse(company));
         mailSender.send(msg);
         
      } catch (MessagingException e) {
         System.out.println("MessagingException 오류입니다.");
         e.printStackTrace();
      }
      
      Map <String, Object> result = new HashMap<String, Object>();
      
      result.put("msg", "Success");
      
      return result;
   }
}
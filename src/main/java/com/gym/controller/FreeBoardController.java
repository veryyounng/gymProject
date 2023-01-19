package com.gym.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.gym.domain.FreeBoardVO;
import com.gym.domain.NoticeVO;
import com.gym.domain.Page;
import com.gym.service.FreeBoardService;

   @Controller 
   @RequestMapping("/free/*")
   
   public class FreeBoardController {
      
      @Autowired
      private FreeBoardService service;
      
      //게시물 목록, 갯수 세기
      @RequestMapping (value="/freelist", method=RequestMethod.GET)
      public String getFreelist (Model model, @RequestParam("num")int num) throws Exception{
         
    	Page page = new Page();
    	
    	page.setNum(num);
    	page.setCount(service.getFreeCnt());
    	
    	List<FreeBoardVO> list = service.getFreelist(page.getDisplayPost(), page.getPostNum());
    	
        model.addAttribute("freelist", list);
        model.addAttribute("page",page);
        model.addAttribute("select", num);
        
         return "/board/freeboard_list";
      }
      
      //게시물 본문 보기
      @RequestMapping (value="/freedetail", method = RequestMethod.GET)
      public String getFreeDetail (@RequestParam("b_num") int b_num, Model model) throws Exception{
       
       FreeBoardVO vo = service.getFreeDetail(b_num);
       model.addAttribute("freedetail", vo);
       
       return "/board/freeboard_detail";
      }
      
     
      
}
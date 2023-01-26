package com.gym.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
      public String getFreelist (String keyword, Model model,int num,String searchType) throws Exception{
        
    	Page page = new Page();
    	
    	page.setNum(num);
    	page.setCount(service.getSearchCnt(keyword,searchType));
    	
    	List<FreeBoardVO> list = service.getFreelist(keyword,searchType,page.getDisplayPost(), page.getPostNum());
    	
        model.addAttribute("freelist", list);
        model.addAttribute("page",page);
        model.addAttribute("select", num);
        model.addAttribute("keyword", keyword);
        
         return "/board/freeboard_list";
      }
       
      //게시물 조회
      @RequestMapping (value="/freedetail", method = RequestMethod.GET)
      public String getFreeDetail (String keyword, int b_num, Model model) throws Exception{
    	   
    	  service.FreeViewCnt(b_num);
    	  //db에 거치면 viewCnt가 +1이 됨-> 메소드 종료시 , 밑줄이 실행됨
    	  
    	  FreeBoardVO vo = service.getFreeDetail(b_num);
    	  model.addAttribute("freedetail", vo);
    	  model.addAttribute("keyword", keyword);
    	  return "/board/freeboard_detail";
      }
      
      //게시물 글쓰기 get 메소드
      @RequestMapping(value="/freewrite", method=RequestMethod.GET)
      public String getFreeWrite() throws Exception{
    	 
    	  return "/board/freeboard_write";
      }

      //게시물 글작성 post 메소드
      @RequestMapping(value = "/freewrite", method=RequestMethod.POST)
      public String postFreeWrite(FreeBoardVO vo) throws Exception{
    	  service.FreeWrite(vo);
    	  
    	  return "redirect:/free/freelist?num=1";
      }
      
      //게시물 수정 get메소드
      @RequestMapping(value = "/freemodify", method = RequestMethod.GET)
      public String getFreeModify(@RequestParam("b_num") int b_num, Model model) throws Exception{
    	  
    	  FreeBoardVO vo = service.getFreeDetail(b_num);
    	  model.addAttribute("freedetail", vo);
    	  
    	  return "/board/freeboard_modify";
      }
      
      //게시물 수정 post 메소드
      @RequestMapping(value = "/freemodify", method = RequestMethod.POST)
      public String postFreeModify(FreeBoardVO vo) throws Exception{
    	  service.FreeModify(vo);
    	  int b_num = vo.getB_num();
    	  return "redirect:/free/freedetail?b_num="+b_num;
      }
      
      //게시물 삭제
      @RequestMapping(value = "/freedelete", method = RequestMethod.GET)
      public String getDelete(@RequestParam("b_num") int b_num) throws Exception{
    	  service.FreeDelete(b_num);
    	  
    	  return  "redirect:/free/freelist?num=1";
    	  
      }
}
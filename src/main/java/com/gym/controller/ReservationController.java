package com.gym.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gym.domain.ReservationVO;
import com.gym.service.ReservationService;

@Controller
@RequestMapping("/reservation/*")
public class ReservationController {
	
	@Autowired
	private ReservationService service;
	
	@GetMapping({"/search","/makeschedule"})
	public void getMap() {}
	
	@PostMapping("/result")
	public @ResponseBody List<ReservationVO> postSearch(@RequestParam("rv_date") String rv_date) throws Exception {
		List<ReservationVO> list = null;
		list = service.getList(rv_date);
		return list;
	}
	
	@PostMapping("/user_rv")
	public String postUser_rv(String userid, int rv_num, RedirectAttributes ra) {
		if(service.findOverlap(userid,rv_num) >= 1) {
			ra.addFlashAttribute("reser","NO");
		} else {
			if(service.addRV(userid,rv_num) == 1) {
				service.plusRV(rv_num);
				ra.addFlashAttribute("reser", "T");
			}
			else {
				ra.addFlashAttribute("reser", "F");
			}
		}
		return "redirect:/reservation/search";
	}
	
	@PostMapping("/makeschedule")
	public String postMakeSchedule(ReservationVO vo,RedirectAttributes ra) {
		if(service.selectReservation(vo) != null) {
			ra.addFlashAttribute("ms","find");			
		} else {
			if(service.insertReservation(vo) == 1) {
				ra.addFlashAttribute("ms", "T");
			} else {
				ra.addFlashAttribute("ms","F");
			}
		}
		return "redirect:/reservation/makeschedule";
	}
	
	@PostMapping("reser_delete")
	public String reservationDelete(int rv_num,RedirectAttributes ra) {
		service.cancelReservation(rv_num);
		if(service.deleteReservation(rv_num) == 1) {
			ra.addFlashAttribute("delete","T");
		} else {
			ra.addFlashAttribute("delete","F");
		}
		return "redirect:/reservation/makeschedule";
	}
}

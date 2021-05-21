package org.used.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.used.service.UserMainService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/mypage/*")
@AllArgsConstructor
public class MypageController {

	private UserMainService service;
//	
//	@GetMapping("/main2")
//	public void get2(){
//		System.out.println("AAAAAAAAAAAAAa");
//	}
	
	@GetMapping("/main")
	public void getMain(@RequestParam("user_id") int user_id, Model model){
		System.out.println("BBBBBBBBBBB");
		model.addAttribute("member", service.member(user_id));
		model.addAttribute("member_img", service.member_img(user_id));
	}


}

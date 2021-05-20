package org.used.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.used.domain.MemberVO;
import org.used.service.ModifyService;
import org.used.service.UserMainService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/mypage/*")
@AllArgsConstructor
public class ModifyController {
	
	private UserMainService user_service;
	private ModifyService modify_service;
	
	@GetMapping("/modify")
	public void getModify(@RequestParam("user_id") int user_id, Model model){
		model.addAttribute("member", user_service.member(user_id));
		model.addAttribute("member_img", user_service.member_img(user_id));
	}
	
	@PostMapping("/modify")
	public String modify(MemberVO member, RedirectAttributes rttr){
		log.info("modify:"+member);
		System.out.println("111111");
		if(modify_service.modify(member)){
			rttr.addFlashAttribute("result", "success");
			System.out.println("22222222");
		}
		return "redirect:/mypage/main?user_id=3";
	}
	
	@PostMapping("/remove")
	public String remove(@RequestParam("user_id") int user_id, RedirectAttributes rttr){
		log.info("remove....."+ user_id);
		System.out.println("33333333333");
		
		if(modify_service.remove(user_id)){
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/main"; //로그인으로 바꿔야함
	}
}

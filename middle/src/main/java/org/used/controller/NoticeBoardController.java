package org.used.controller;

import org.junit.Test;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.used.domain.NoticeBoardVO;
import org.used.service.NoticeBoardService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/noticeBoard/*")
@AllArgsConstructor
public class NoticeBoardController {
 
	private NoticeBoardService service;
	
	@GetMapping("/list")
	public void list(Model model){
		
		log.info("list");
		model.addAttribute("list", service.getList());
	}
	
	@PostMapping("/register")
	public String register(NoticeBoardVO vo, RedirectAttributes rttr) {
		
		log.info("register: " + vo);
		
		service.register(vo);
		
		rttr.addFlashAttribute("result", vo.getManager_id());
		
		return "redirect:/noticeBoard/list";
	}
	
	@GetMapping("/get")
	public void get(@RequestParam("notice_id") Long notice_id, Model model){
		
		log.info("/get");
		model.addAttribute("vo", service.get(notice_id));
	}
	
	@PostMapping("/modify")
	public String modify(NoticeBoardVO vo, RedirectAttributes rttr) {
		
		log.info("modify: " + vo);
		
		if (service.modify(vo)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/noticeBoard/list";
	}
	
	@PostMapping("/remove")
	public String remove(@RequestParam("notice_id") Long notice_id, RedirectAttributes rttr){
		
		log.info("remove...." + notice_id);
		if(service.remove(notice_id)){
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/noticeBoard/list";
	}
	
	
	
}

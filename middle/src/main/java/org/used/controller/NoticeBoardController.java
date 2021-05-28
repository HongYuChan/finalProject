package org.used.controller;

	import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.used.domain.Criteria;
import org.used.domain.NoticeBoardVO;
import org.used.domain.PageDTO;
import org.used.service.NoticeBoardService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/noticeBoard/*")
@AllArgsConstructor
public class NoticeBoardController {
 
	private NoticeBoardService service;
	
//	@GetMapping("/list")
//	public void list(Criteria cri, Model model){
//		
//		log.info("list");
//		model.addAttribute("list", service.getList(cri));
//	}
	@GetMapping("/list")
	public void list(Criteria cri, Model model){
		
		log.info("list: " + cri);
		model.addAttribute("list", service.getList(cri));
//		model.addAttribute("pageMaker", new PageDTO(cri, 123));
		
		int total = service.getTotal(cri);
		
		log.info("total: " + total);
		
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		
	}
	@ResponseBody
	@PostMapping("/register")
	public String register(NoticeBoardVO noticeBoard, RedirectAttributes rttr) {
		
		log.info("register: " + noticeBoard);
		
		service.register(noticeBoard);
		
		rttr.addFlashAttribute("result", noticeBoard.getNotice_id());
		
		return "redirect:/noticeBoard/list";
	}
	
	@GetMapping("/register")
	public void register(){}
	
	
	
	
	
	@GetMapping({"/get", "/modify"})
	public void get(@RequestParam("notice_id") Long notice_id,  @ModelAttribute("cri") Criteria cri, Model model){
		
		log.info("/get or modify");
		model.addAttribute("noticeBoard", service.get(notice_id));
	}
	
	@PostMapping("/modify")
	public String modify(NoticeBoardVO noticeBoard, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		
		log.info("modify: " + noticeBoard);
		
		if (service.modify(noticeBoard)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		return "redirect:/noticeBoard/list";
	}
	
	
	
	
	
	@PostMapping("/remove")
	public String remove(@RequestParam("notice_id") Long notice_id, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr){
		
		log.info("remove...." + notice_id);
		if(service.remove(notice_id)){
			rttr.addFlashAttribute("result", "success");
		}
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		return "redirect:/noticeBoard/list";
	}
	
	
	
}

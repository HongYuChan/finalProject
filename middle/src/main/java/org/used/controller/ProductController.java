package org.used.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.used.domain.ProductVO;
import org.used.service.ProductService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/product/*")
@AllArgsConstructor
public class ProductController {

	private ProductService service;
	
	@GetMapping("/list")
	public void list(Model model){
		
		log.info("list");
		model.addAttribute("list", service.getList());		
	}
	
	@GetMapping("/register")
	public void register(){
		
	}
	
	@PostMapping("/register")
	public String register(ProductVO product, RedirectAttributes rttr){
		
		log.info("register: " + product);
		
		service.register(product);
		
		rttr.addFlashAttribute("result", product.getProduct_id());
		
		return "redirect:/product/list";
	}
	
	@GetMapping({"/get", "/modify"})
	public void get(@RequestParam("product_id")Long product_id, Model model){
		
		log.info("/get or modify");
		model.addAttribute("product", service.get(product_id));
	}
	
	@PostMapping("/modify")
	public String modify(ProductVO product, RedirectAttributes rttr){
		
		log.info("modify: " + product);
		
		if(service.modify(product)){
			rttr.addAttribute("result", "success");
		}
		
		return "redirect:/product/list";
	}
	
	@PostMapping("/remove")
	public String remove(@RequestParam("product_id") Long product_id, RedirectAttributes rttr){
		
		log.info("remove......................................" + product_id);
		if(service.remove(product_id)){
			rttr.addAttribute("resulte", "success");
		}
		
		return "redirect:/product/list";
	}
	
}







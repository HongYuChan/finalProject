package org.used.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.used.domain.AttachFileDTO;
import org.used.domain.ProductVO;
import org.used.service.ProductService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnailator;

@Controller
@Log4j
@RequestMapping("/product/*")
@AllArgsConstructor
public class ProductController {

	private ProductService service;
	
	@GetMapping("/main")
	public void main(Model model){
		
		log.info("main");
		model.addAttribute("list", service.getList());		
	}
	
	@GetMapping("/product")
	public void product(){
		log.info("product...........");
	}
	
	@GetMapping("/list")
	public void list(Model model){
		
		log.info("list");
		model.addAttribute("list", service.getList());		
	}
	
	@GetMapping("/register")
	public void register(){
		
	}	
	
	@PostMapping("/register")
	public String register( ProductVO product, RedirectAttributes rttr){
		
		log.info("register: " + product);
		
		service.register(product);
		
		rttr.addFlashAttribute("result", product.getProduct_id());
		
		return "redirect:/main";
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
		
		return "redirect:/main";
	}
	
	@PostMapping("/remove")
	public String remove(@RequestParam("product_id") Long product_id, RedirectAttributes rttr){
		
		log.info("remove......................................" + product_id);
		if(service.remove(product_id)){
			rttr.addAttribute("resulte", "success");
		}
		
		return "redirect:/main";
	}

private String getFolder(){
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyy-MM-dd");
		
		Date date = new Date();
		
		String str = sdf.format(date);
		
//		System.out.println("sdf: " + sdf);
//		System.out.println("date: " + date);
//		System.out.println("str: " + str);
//		System.out.println("File.separator: " + File.separator);
		
		return str.replace("-", File.separator);
	}
	
	private boolean checkImageType(File file){
		
		try {
			String contentType = Files.probeContentType(file.toPath());
			System.out.println("contentType.startsWith(image) : " + contentType.startsWith("image"));
			return contentType.startsWith("image");
		} catch (IOException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	@GetMapping("/uploadAjax")
	public void uploadAjax() {
		log.info("upload ajax");
	}
	
	@PostMapping(value="/uploadAjaxAction", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<AttachFileDTO>> uploadAjaxPost(MultipartFile[] image) {
	
		List<AttachFileDTO> list = new ArrayList<>();
		
//		String uploadFolder = "C:\\upload";
		String uploadFolder = "C:\\finalProject-dev\\finalProject-develop\\middle\\src\\main\\webapp\\resources\\upload";
		String uploadFolerPath = getFolder();
		
		// make folder
		File uploadpath = new File(uploadFolder, getFolder());
		log.info("upload path: " + uploadpath);
		
		if(uploadpath.exists() == false){
			uploadpath.mkdirs();
		}
	
		for (MultipartFile multipartFile : image) {
			
			AttachFileDTO attachDTO = new AttachFileDTO();
	
			log.info("-------------------------------------");
			log.info("Upload File Name: " + multipartFile.getOriginalFilename());
			log.info("Upload File Size: " + multipartFile.getSize());
	
			String uploadFileName = multipartFile.getOriginalFilename();
	
			// IE has file path
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1);
			log.info("only file name: " + uploadFileName);
			attachDTO.setFileName(uploadFileName);
	
//			UUID uuid = UUID.randomUUID();
			
//			uploadFileName = uuid.toString() + "_" + uploadFileName;
	
			try {
				File saveFile = new File(uploadpath, uploadFileName);				
				multipartFile.transferTo(saveFile);
				
//				attachDTO.setUuid(uuid.toString());
				attachDTO.setUploadPath(uploadFolerPath);
				
				if(checkImageType(saveFile)){
					attachDTO.setImage(true);
					
					FileOutputStream thumbnail = new FileOutputStream(new File(uploadpath, "s_"+uploadFileName));
					Thumbnailator.createThumbnail(multipartFile.getInputStream(), thumbnail, 195, 196);
					thumbnail.close();
				}
				
				list.add(attachDTO);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return new ResponseEntity<>(list, HttpStatus.OK);
	}
	
	
}







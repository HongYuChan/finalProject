package org.used.controller;

import java.io.File;
import java.nio.file.Files;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.apache.tika.Tika;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
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
	private boolean checkImageType(File file){
		try {
			String contentType = Files.probeContentType(file.toPath());
			return contentType.startsWith("image");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return false;
	}
	
	@GetMapping("/profileUpload")
	public void profileupload(){
		
	}
	
	@PostMapping("/profileUpload")
	public void uploadFormPost(MultipartFile[] profile_picture, Model model) {
		String uploadFolder = "C:\\Upload";
		
		for (MultipartFile multipartFile : profile_picture) {
			File profile = new File(uploadFolder, multipartFile.getOriginalFilename());
			try {
				multipartFile.transferTo(profile);
			} catch (Exception e) {
				log.error(e.getMessage());
			}

		}
	}
	
	@PostMapping("/uploadAjaxAction")
	public void uploadAjaxPost(MultipartFile[] uploadFile) {
		log.info("update ajax post...........");

		String uploadFolder = "C:\\Upload";

		for (MultipartFile multipartFile : uploadFile) {
			log.info("Upload File Name:" + multipartFile.getOriginalFilename());
			log.info("Upload File Size:" + multipartFile.getSize());
			String uploadFileName = multipartFile.getOriginalFilename();
			
			UUID uuid = UUID.randomUUID();
			log.info("only file name:" + uploadFileName);
			
			uploadFileName = uuid.toString()+"_"+uploadFileName;
			
			File saveFile = new File(uploadFolder, uploadFileName);

			try {
				multipartFile.transferTo(saveFile);
			} catch (Exception e) {
				log.error(e.getMessage());
			}
		}
	}

	@GetMapping("/modify")
	public void getModify(@RequestParam("user_id") int user_id, Model model) {
		model.addAttribute("member", user_service.member(user_id));
		model.addAttribute("member_img", user_service.member_img(user_id));
	}

	@PostMapping("/modify")
	public String modify(MemberVO member, RedirectAttributes rttr) {
		log.info("modify:" + member);
		System.out.println(member);// user_id값이 0으로 넘어감
		if (modify_service.modify(member)) {
			rttr.addFlashAttribute("result", "success");
			System.out.println("22222222");
		}
		return "redirect:/mypage/main?user_id=4";
	}

	@PostMapping("/remove")
	public String remove(@RequestParam("user_id") int user_id, RedirectAttributes rttr) {
		log.info("remove....." + user_id);
		System.out.println("33333333333");

		if (modify_service.remove(user_id)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/main"; // 로그인으로 바꿔야함
	}
}

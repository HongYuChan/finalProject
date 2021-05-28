package org.used.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.used.domain.MemberVO;
import org.used.domain.ProfileCheckDTO;
import org.used.service.ModifyService;
import org.used.service.UserMainService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnailator;

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
	
	private String getFolder(){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		Date date = new Date();
		
		String str = sdf.format(date);
		return str.replace("-", File.separator);
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
	
	@PostMapping(value="/uploadAjaxAction", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResponseEntity<List<ProfileCheckDTO>> uploadAjaxPost(MultipartFile[] uploadFile, MemberVO member){
		List<ProfileCheckDTO> list = new ArrayList<>();
		String uploadFolder = "C:\\Upload";
		
		File uploadPath = new File(uploadFolder, getFolder());
		log.info("upload path:" + uploadPath);
		
		if(uploadPath.exists() == false){
			uploadPath.mkdirs();
		}
		for (MultipartFile multipartFile : uploadFile) {
			ProfileCheckDTO profile = new ProfileCheckDTO();
			log.info("Upload File Name:" + multipartFile.getOriginalFilename());
			log.info("Upload File Size:" + multipartFile.getSize());
			
			String uploadFileName = multipartFile.getOriginalFilename();
			
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\")+1);
			log.info("only file name:" + uploadFileName);
			profile.setFileName(uploadFileName);
			
			UUID uuid = UUID.randomUUID();
			
			uploadFileName = uuid.toString()+"_"+uploadFileName;
			
			try {
				File saveFile = new File(uploadPath, uploadFileName);
				multipartFile.transferTo(saveFile);
				System.out.println(uploadPath);
				profile.setUuid(uuid.toString());
				profile.setUploadFolder(uploadFolder);
				
				if(checkImageType(saveFile)){
					
					profile.setImage(true);
					
					FileOutputStream thumbnail = new FileOutputStream(new File(uploadFolder, "s_"+uploadFileName));
					Thumbnailator.createThumbnail(multipartFile.getInputStream(),thumbnail,100,100);
					thumbnail.close();
				}
				
				list.add(profile);
			} catch (Exception e) {
				log.error(e.getMessage());
			}
		}
		
		return new ResponseEntity<>(list, HttpStatus.OK);
	}
	
	@GetMapping("/display")
	@ResponseBody
	public ResponseEntity<byte[]> getFile(String fileName){
		log.info("fileName:"+fileName);
		File file = new File("C:\\Upload\\"+fileName);
		
		log.info("file"+file);
		
		ResponseEntity<byte[]> result = null;
		
		try {
			HttpHeaders header = new HttpHeaders();
			
			header.add("Content-Type", Files.probeContentType(file.toPath()));
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return result;
	}
	
	@GetMapping("/modify")
	public void getModify(@RequestParam("user_id") int user_id, Model model) {
		model.addAttribute("member", user_service.member(user_id));
		model.addAttribute("member_img", user_service.member_img(user_id));
	}

	@PostMapping("/modify")
	public String modify(MemberVO member, RedirectAttributes rttr) {
		log.info("modify:" + member);
		System.out.println(member);
		if (modify_service.modify(member)) {
			rttr.addFlashAttribute("result", "success");
			System.out.println("22222222");
		}
		return "redirect:/mypage/main?";
	}

	@PostMapping("/remove")
	public String remove(@RequestParam("user_id") int user_id, RedirectAttributes rttr) {
		log.info("remove....." + user_id);
		System.out.println("33333333333");

		if (modify_service.remove(user_id)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/main"; // �α������� �ٲ����
	}
}

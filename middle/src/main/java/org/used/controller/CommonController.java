package org.used.controller;


import java.io.Console;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.used.domain.MemberVO;
import org.used.service.MemberService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/account/*")
public class CommonController {

	@Setter(onMethod_ = @Autowired)
	MemberService service;

	@GetMapping("/accessError")
	public void accessDenied(Authentication auth, Model model) {
		log.info("access Denid:" + auth);

		model.addAttribute("msg", "Access Denied");
	}

	@GetMapping("/customLogin")
	public void loginInput(String error, String logout, Model model) {
		log.info("error:" + error);
		log.info("logout:" + logout);
		if (error != null) {
			model.addAttribute("error", "Login Error Check Your Account");
		}
		if (logout != null) {
			model.addAttribute("logout", "Logout!!");
		}
	}

	@GetMapping("/customLogout")
	public void logoutGET() {
		log.info("custom logout");
	}

	@GetMapping("/memberJoin")
	public void joinInput() {
		log.info("Join page!!");
	}
	
	@GetMapping("/userSearch")
	public void userIdSearch (){
		log.info("userIdSearch in");
	}
	
// ///////////////기능 컨트롤러////////////////////
	
	
	// 회원가입 버튼 클릭시
	@PostMapping(value = "/memberCreate")
	public ModelAndView memberJoinPro(MemberVO vo) throws Exception {

		ModelAndView mav = new ModelAndView();
		log.info(vo);
		service.passwordCheck(vo);
		service.memberJoin(vo);
		System.out.println("1");

		mav.setViewName("account/customLogin");
		System.out.println("2");

		return mav;
	}// end memberJoinPro()

	// 중복확인 버튼 클릭시
	@PostMapping(value = "/idCheck", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public int idCheck(@RequestBody MemberVO vo) throws Exception {

		int result = service.idCheck(vo);
		System.out.println(result);
		return result;
	}
	
	//아이디 찾기 버튼 클릭시
	@PostMapping(value ="/userSearch", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String userIdSearch(@RequestBody MemberVO vo)throws Exception{
		
		String result = service.userIdSearch(vo);
		System.out.println(result);
		return result;
	}
	
	
	
	
}

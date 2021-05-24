package org.used.controller;


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
import org.used.service.MemberJoinService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/account/*")
public class CommonController {

	@Setter(onMethod_ = @Autowired)
	MemberJoinService memberJoinService;

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

	// 회원가입 버튼 클릭시
	@PostMapping(value = "/memberCreate", produces = "application/json;charset=UTF-8")
	public ModelAndView memberJoinPro(MemberVO vo) throws Exception {

		ModelAndView mav = new ModelAndView();

		memberJoinService.passwordCheck(vo);
		memberJoinService.memberJoin(vo);
		System.out.println("1");

		mav.setViewName("/customLogin");
		System.out.println("2");

		return mav;
	}// end memberJoinPro()

	// 중복확인 버튼 클릭시
	@ResponseBody
	@PostMapping(value = "/idCheck", produces = "application/json;charset=UTF-8")
	public int idCheck(@RequestBody MemberVO vo) throws Exception {

		int result = memberJoinService.idCheck(vo);
		System.out.println(result);
		return result;
		// return new ResponseEntity<Integer>(result, HttpStatus.OK);
	}
	
	// 로그인시 아이디 패스워드 일치하는지
	@ResponseBody
	@PostMapping(value="/loginIdPasswordCheck", produces="application/json;charset=UTF-8")
	public int loginIdPasswordCheck(@RequestBody MemberVO vo) throws Exception{
		
		int result = memberJoinService.loginIdPasswordCheck(vo);
		System.out.println(result);
		return result;
	}
}

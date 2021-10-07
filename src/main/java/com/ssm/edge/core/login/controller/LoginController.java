package com.ssm.edge.core.login.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ssm.edge.core.login.service.LoginService;
import com.ssm.edge.core.map.CommonCommandMap;

/**
 * 공통 컨트롤러
 */
@Controller
public class LoginController {
	@Resource(name="loginService")
	private LoginService loginService;
	
	/**
	 *	FUNCTION 	: loginView
	 *	NOTE 		: 로그인 화면 호출, 사용자 설정
	 *	INPUT 		: commonMap
	 *	OUTPUT 		: none
	**/
	@GetMapping("/core/login")
	public ModelAndView loginView() {
		ModelAndView mv = new ModelAndView();
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();

		if (!(auth instanceof AnonymousAuthenticationToken)) {
		    return new ModelAndView("redirect:/core/main/dashboardPage");
		} else {
		    mv.setViewName("core/login/login");
		}
	    
		return mv;
	}
	
	/**
	 *	FUNCTION 	: registerView
	 *	NOTE 		: 회원가입 화면 호출
	 *	INPUT 		: commonMap
	 *	OUTPUT 		: none
	**/
	@GetMapping("/core/login/register")
	public ModelAndView registerView() {
		ModelAndView mv = new ModelAndView();
		
	    mv.setViewName("core/login/register");
	    
		return mv;
	}
	
	/**
	 *	FUNCTION 	: insertRegister
	 *	NOTE 		: 회원 가입 등록 아이디, 이메일 중복 체크  
	 *	INPUT 		: commonMap
	 *	OUTPUT 		: NONE 
	**/ 
	@PostMapping("/core/login/insertRegister")
	public ModelAndView insertRegister(CommonCommandMap commonCommandMap) {
		ModelAndView mv = new ModelAndView();
		
		mv = loginService.insertRegister(commonCommandMap);
		
	    return mv;
	}
	
	/**
	 *	FUNCTION 	: searchUserInfoView
	 *	NOTE 		: 아이디 / 비밀번호 찾기 화면 호출
	 *	INPUT 		: none
	 *	OUTPUT 		: none
	**/
	@GetMapping("/core/login/searchUserInfo")
	public ModelAndView searchUserInfoView() {
		ModelAndView mv = new ModelAndView();
		
	    mv.setViewName("core/login/searchUserInfo");
	    
		return mv;
	}
	
	/**
	 *	FUNCTION 	: selectUserId
	 *	NOTE 		: 아이디 조회
	 *	INPUT 		: userEmail
	 *	OUTPUT 		: userId, userEmail
	**/
	@PostMapping("/core/login/selectUserId")
	public ModelAndView selectUserId(CommonCommandMap commonCommandMap) {
		ModelAndView mv = new ModelAndView();
		
		mv = loginService.selectUserId(commonCommandMap);
		
		return mv;
	}
	
	/**
	 *	FUNCTION 	: updateUserPassword
	 *	NOTE 		: 비밀번호 변경
	 *	INPUT 		: userId, userEmail, userPassword
	 *	OUTPUT 		: none
	**/
	@PostMapping("/core/login/updateUserPassword")
	public ModelAndView updateUserPassword(CommonCommandMap commonCommandMap) {
		ModelAndView mv = new ModelAndView();

		mv = loginService.updateUserPassword(commonCommandMap);
	    
		return mv;
	}
	
	/**
	 *	FUNCTION 	: userLogin
	 *	NOTE 		: 사용자 로그인
	 *	INPUT 		: userId, userPassword
	 *	OUTPUT 		: none
	**/
	@PostMapping("/core/login/userLoginCheck")
	public ModelAndView userLoginCheck(CommonCommandMap commonCommandMap) {
		ModelAndView mv = new ModelAndView();

		mv = loginService.userLoginCheck(commonCommandMap);
	    
		return mv;
	}

	@GetMapping(value="/logout")
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView();

		mv.setViewName("core/login");

		return mv;
	}
}

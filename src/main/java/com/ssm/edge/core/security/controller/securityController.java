package com.ssm.edge.core.security.controller;

import com.ssm.edge.core.security.service.SecurityService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;

/**
 * Spring Security 컨트롤러
 */
@Controller
public class securityController {

	@Resource(name="securityService")
	private SecurityService securityService;
	
	/**
	 *	FUNCTION 	: securityLoginCheck
	 *	NOTE 		: 사용자 접속 정보 확인 서비스
	 *	INPUT 		: commonMap
	 *	OUTPUT 		: message, page
	**/
	@GetMapping("/core/security/loginCheck")
	public ModelAndView securityLoginCheck() {
		ModelAndView mv = new ModelAndView();

		mv = securityService.securityLoginCheck();
	    
		return mv;
	}
}

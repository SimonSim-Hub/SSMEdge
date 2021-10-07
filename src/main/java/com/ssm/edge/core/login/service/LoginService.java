package com.ssm.edge.core.login.service;

import org.springframework.web.servlet.ModelAndView;

import com.ssm.edge.core.map.CommonCommandMap;

public interface LoginService {
	// 회원 가입
	ModelAndView insertRegister(CommonCommandMap commonCommandMap);
	// 사용자 아이디 조회
	ModelAndView selectUserId(CommonCommandMap commonCommandMap);
	// 사용자 비밀번호 변경
	ModelAndView updateUserPassword(CommonCommandMap commonCommandMap);
	// 사용자 로그인 확인
	ModelAndView userLoginCheck(CommonCommandMap commonCommandMap);
}

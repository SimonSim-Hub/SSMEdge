package com.ssm.edge.core.login.service.impl;

import javax.annotation.Resource;

import com.ssm.edge.core.system.userManagement.vo.UserMasterVO;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.ssm.edge.core.login.dao.LoginDAO;
import com.ssm.edge.core.login.service.LoginService;
import com.ssm.edge.core.map.CommonCommandMap;

@Service("loginService")
public class LoginServiceImpl implements LoginService {
	@Resource(name="loginDAO")
	public LoginDAO loginDAO;

	@Override
	public ModelAndView insertRegister(CommonCommandMap commonCommandMap) {
		ModelAndView mv = new ModelAndView("jsonView");
		
		String resultStatus = null;
		String resultMessage = null;
		
		int userIdCount = 0;
		int userEmailCount = 0;

		ModelMapper modelMapper = new ModelMapper();
		UserMasterVO userMasterVO = modelMapper.map(commonCommandMap.getMap(), UserMasterVO.class);
		
		try {
			userIdCount = loginDAO.selectUserIdCount(userMasterVO);
		} catch (Exception e) {
			e.printStackTrace();
			
			resultStatus = "3";
			resultMessage = "[ERR_LS_IR_0001]<br>아이디 중복 여부 조회에 실패하였습니다.<br>관리자에게 문의하세요.";
			
			mv.addObject("resultStatus", resultStatus);
			mv.addObject("resultMessage", resultMessage);
			
			return mv;
		}
		
		if(userIdCount > 0) {
			
			resultStatus = "2";
			resultMessage = "이미 가입된 아이디 입니다.";

			mv.addObject("resultStatus", resultStatus);
			mv.addObject("resultMessage", resultMessage);

			return mv;
		}
		
		try {
			userEmailCount = loginDAO.selectUserEmailCount(userMasterVO);
		} catch (Exception e) {
			e.printStackTrace();
			
			resultStatus = "3";
			resultMessage = "[ERR_LS_IR_0002]<br>Email 중복 여부 조회에 실패하였습니다.<br>관리자에게 문의하세요.";
			
			mv.addObject("resultStatus", resultStatus);
			mv.addObject("resultMessage", resultMessage);
			
			return mv;
		}
		
		if(userEmailCount > 0) {
			resultStatus = "2";
			resultMessage = "이미 가입된 이메일 입니다.";

			mv.addObject("resultStatus", resultStatus);
			mv.addObject("resultMessage", resultMessage);

			return mv;
		}
		
		if(userIdCount == 0 && userEmailCount == 0) {
			try {
				if(userMasterVO.getUserId().equals("system")) {
					userMasterVO.setUserAuthority("ROLE_SYSTEM");
				} else if(userMasterVO.getUserId().equals("admin")) {
					userMasterVO.setUserAuthority("ROLE_ADMIN");
				} else {
					userMasterVO.setUserAuthority("ROLE_GUEST");
				}

				loginDAO.insertUserMaster(userMasterVO);
				
				resultStatus = "1";
				resultMessage = "계정이 생성되었습니다.<br>관리자 승인 후 시스템에 로그인이 가능합니다.<br>5초 후 로그인 페이지로 이동 합니다.";
				
				mv.addObject("resultStatus", resultStatus);
				mv.addObject("resultMessage", resultMessage);
			} catch (Exception e) {
				e.printStackTrace();
				
				resultStatus = "3";
				resultMessage = "[ERR_LS_IR_0003]<br>사용자 계정 생성에 실패하였습니다.<br>관리자에게 문의하세요.";
				
				mv.addObject("resultStatus", resultStatus);
				mv.addObject("resultMessage", resultMessage);
				
				return mv;
			}
		}
	    
		mv.addObject("resultStatus", resultStatus);
		mv.addObject("resultMessage", resultMessage);
		
		return mv;
	}

	@Override
	public ModelAndView selectUserId(CommonCommandMap commonCommandMap) {
		ModelAndView mv = new ModelAndView("jsonView");

		ModelMapper modelMapper = new ModelMapper();
		UserMasterVO userMasterVO = modelMapper.map(commonCommandMap.getMap(), UserMasterVO.class);

		String resultStatus = null;
		String resultMessage = null;
		
		String userId = null;
		String userEmail = null;

		userEmail = (String) userMasterVO.getUserEmail();
		
		try {
			userId = loginDAO.selectUserId(userMasterVO);
		} catch (Exception e) {
			e.printStackTrace();
			
			resultStatus = "3";
			resultMessage = "[ERR_LS_SUI_0001]<br>사용자 아이디 조회에 실패하였습니다.<br>관리자에게 문의하세요.";
			
			mv.addObject("resultStatus", resultStatus);
			mv.addObject("resultMessage", resultMessage);
			
			return mv;
		}
		
		if(userId !=null && userId.length() > 0) {
			mv.addObject("userId", userId);
			mv.addObject("userEmail", userEmail);
			
			resultStatus = "1";
			resultMessage = "사용자 아이디 조회가 성공하였습니다.<br>사용자 아이디 : " + userId;
		} else {
			resultStatus = "2";
			resultMessage = "가입되지 않은 사용자 이메일 입니다.<br>이메일 주소를 확인하세요.";
		}
		
		mv.addObject("resultStatus", resultStatus);
		mv.addObject("resultMessage", resultMessage);
		
		return mv;
	}

	@Override
	public ModelAndView updateUserPassword(CommonCommandMap commonCommandMap) {
		ModelAndView mv = new ModelAndView("jsonView");

		ModelMapper modelMapper = new ModelMapper();
		UserMasterVO userMasterVO = modelMapper.map(commonCommandMap.getMap(), UserMasterVO.class);
		
		String resultStatus = null;
		String resultMessage = null;
		
		try {
			loginDAO.updateUserPassword(userMasterVO);
			
			resultStatus = "1";
			resultMessage = "사용자 비밀번호 변경이 완료되었습니다..<br>5초 후 로그인 페이지로 이동 합니다.";
		} catch (Exception e) {
			e.printStackTrace();
			
			resultStatus = "3";
			resultMessage = "[ERR_LS_UUP_0001]<br>사용자 비밀번호 변경에 실패하였습니다.<br>관리자에게 문의하세요.";
			
			mv.addObject("resultStatus", resultStatus);
			mv.addObject("resultMessage", resultMessage);
			
			return mv;
		}
		
		mv.addObject("resultStatus", resultStatus);
		mv.addObject("resultMessage", resultMessage);
		
		return mv;
	}

	@Override
	public ModelAndView userLoginCheck(CommonCommandMap commonCommandMap) {
		ModelAndView mv = new ModelAndView("jsonView");

		ModelMapper modelMapper = new ModelMapper();
		UserMasterVO userLoginMapVO = modelMapper.map(commonCommandMap.getMap(), UserMasterVO.class);

		UserMasterVO userMasterVO;

		String resultStatus = null;
		String resultMessage = null;
		
		int userIdCount = 0;
		
		try {
			userIdCount = loginDAO.selectUserIdCount(userLoginMapVO);

		} catch (Exception e) {
			e.printStackTrace();
			
			resultStatus = "3";
			resultMessage = "[ERR_LS_UL_0001]<br>사용자ID 조회에 실패하였습니다.<br>관리자에게 문의하세요.";
			
			mv.addObject("resultStatus", resultStatus);
			mv.addObject("resultMessage", resultMessage); 
			
			return mv;
		}
		
		if(userIdCount > 0) {
			try {
				userMasterVO = loginDAO.selectUserInfo(userLoginMapVO);

				if(userLoginMapVO.getUserPassword().equals(userMasterVO.getUserPassword())) {

					mv.addObject("userInfo", userMasterVO);
					
					resultStatus = "1";
					resultMessage = "사용자 로그인이 완료되었습니다.";
					
				} else {
					resultStatus = "2";
					resultMessage = "비밀번호가 일치하지 않습니다.<br>비밀번호를 확인 하세요.";
				}
			} catch (Exception e) {
				e.printStackTrace();
				
				resultStatus = "3";
				resultMessage = "[ERR_LS_UL_0002]<br>사용자 정보 조회에 실패하였습니다.<br>관리자에게 문의하세요.";
				
				mv.addObject("resultStatus", resultStatus);
				mv.addObject("resultMessage", resultMessage);
				
				return mv;
			}
		} else {
			resultStatus = "2";
			resultMessage = "가입되지 않은 사용자 아이디 입니다.<br>사용자 그룹 및 사용자 아이디를 확인 하세요.";
		}

		mv.addObject("resultStatus", resultStatus);
		mv.addObject("resultMessage", resultMessage);

		return mv;
	}
}

package com.ssm.edge.core.security.service.impl;

import com.ssm.edge.core.security.service.SecurityService;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;


@Service("securityService")
public class SecurityServiceImpl implements SecurityService {
	@Override
	public ModelAndView securityLoginCheck() {
		ModelAndView mv = new ModelAndView();
		
		String resultStatus = null;
		String resultMessage = null;

		try {
			// commonCodeVoList = ConvertUtil.ArrayToString(commonCodeDao.selectCommonCodeList());

			resultStatus = "1";
			mv.addObject("resultStatus", resultStatus);
		} catch (Exception e) {
			e.printStackTrace();

			resultStatus = "3";
			resultMessage = "[ERR_SSI_SLC_0001]<br>사용자 접속 정보 조회에 실패하였습니다.<br>관리자에게 문의하세요.";
			
			mv.addObject("resultStatus", resultStatus);
			mv.addObject("resultMessage", resultMessage);
			
			return mv;
		}

		mv.setViewName("jsonView");

		return mv;
	}
}
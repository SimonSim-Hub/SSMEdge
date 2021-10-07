package com.ssm.edge.core.exceptionHandling.service;

import org.springframework.web.servlet.ModelAndView;

import com.ssm.edge.core.map.CommonCommandMap;

public interface ExceptionHandlingService {
    // 에러 메시지 등록
    ModelAndView insertErrorMessage(CommonCommandMap commonCommandMap);
}

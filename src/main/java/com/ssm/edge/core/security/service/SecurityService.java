package com.ssm.edge.core.security.service;

import org.springframework.web.servlet.ModelAndView;

public interface SecurityService {
	ModelAndView securityLoginCheck();
}
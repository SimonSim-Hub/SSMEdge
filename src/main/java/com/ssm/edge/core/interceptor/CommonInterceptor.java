package com.ssm.edge.core.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.SpringApplication;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

@Component("commonInterceptor")
public class CommonInterceptor extends HandlerInterceptorAdapter {
	
	private static final Logger logger = LoggerFactory.getLogger(CommonInterceptor.class);
	
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
    	// logger.info("======================================          START         ======================================");
    	// logger.info("[SIMON_LOG] [Interceptor] [Info] Request URI \t:  " + request.getRequestURI());
    	// logger.info("[SIMON_LOG] [Interceptor] [Info] Request \t:  " + request.toString());
    	// logger.info("[SIMON_LOG] [Interceptor] [Info] Handler \t:  " + handler.toString());
    	
        return super.preHandle(request, response, handler);
    }
     
    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
    	// logger.info("======================================           END          ======================================");
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object obj, Exception e) throws Exception {
    }
}
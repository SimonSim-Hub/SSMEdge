package com.ssm.edge.core.security.handler;
 
import java.io.IOException;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.WebAttributes;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import com.fasterxml.jackson.databind.ObjectMapper;
 
@Component("authSuccessHandler") 
public class AuthSuccessHandler extends SimpleUrlAuthenticationSuccessHandler {

    private static int TIME = 60 * 60;

	private static final Logger logger = LoggerFactory.getLogger(AuthSuccessHandler.class);
	 
    private RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();
 
    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication)
      throws IOException {
  
        handle(request, response, authentication);

        HttpSession session = request.getSession(false);
        if (session == null) {
            return;
        }
        
        session.removeAttribute(WebAttributes.AUTHENTICATION_EXCEPTION);
    }
 
    protected void handle(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException {
    
        String targetUrl = determineTargetUrl(authentication);
        
        Map<String,Object> resultMap = new HashMap<String,Object>();
        
        if (response.isCommitted()) {
            logger.debug("Response has already been committed. Unable to redirect to " + targetUrl);
            return;
        }
 
        // redirectStrategy.sendRedirect(request, response, targetUrl);
        
        resultMap.put("redirect", true);
        resultMap.put("redirectUrl", targetUrl);
        
        response.getWriter().write(new ObjectMapper().writeValueAsString(resultMap));
        
        response.setStatus(200);
    }
 
    protected String determineTargetUrl(Authentication authentication) {
        boolean isGuest = false;
        boolean isUser = false;
        boolean isAdmin = false;
        boolean isSystem = false;
        
        Collection<? extends GrantedAuthority> authorities
         = authentication.getAuthorities();
        for (GrantedAuthority grantedAuthority : authorities) {
            if (grantedAuthority.getAuthority().equals("ROLE_GUEST")) {
            	isGuest = true;
                break;
            } else if (grantedAuthority.getAuthority().equals("ROLE_USER")) {
            	isUser = true;
                break;
            } else if (grantedAuthority.getAuthority().equals("ROLE_ADMIN")) {
            	isAdmin = true;
                break;
            } else if (grantedAuthority.getAuthority().equals("ROLE_SYSTEM")) {
            	isSystem = true;
                break;
            }
        }
 
        if (isGuest) {
            return "/core/main/dashboardPage";
        } else if (isUser) {
            return "/core/main/dashboardPage";
        } else if (isAdmin) {
            return "/core/main/dashboardPage";
        } else if (isSystem) {
            return "/core/main/dashboardPage";
        } else {
            throw new IllegalStateException(); 
        }
    }
 
    public void setRedirectStrategy(RedirectStrategy redirectStrategy) {
        this.redirectStrategy = redirectStrategy;
    }
    protected RedirectStrategy getRedirectStrategy() {
        return redirectStrategy;
    }
}
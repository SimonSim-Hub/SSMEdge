package com.ssm.edge.core.security.provider;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.stereotype.Component;

import com.ssm.edge.core.system.userManagement.vo.CustomUserMasterDetailsVO;
import com.ssm.edge.core.security.service.CustomUserDetailsService;
 
/**
 * 인증 프로바이더
 * 로그인시 사용자가 입력한 아이디와 비밀번호를 확인하고 해당 권한을 주는 클래스
 * 
 * @author wedul
 *
 */
@Component("authProvider")
public class AuthProvider implements AuthenticationProvider {
    
	@Resource(name = "customUserDetailsService")
	private CustomUserDetailsService customUserDetailsService;
 
    @Override
    public Authentication authenticate(Authentication authentication) throws AuthenticationException {
        String userId = authentication.getName();

        CustomUserMasterDetailsVO user = (CustomUserMasterDetailsVO) customUserDetailsService.loadUserByUsername(userId);
        
        List<GrantedAuthority> grantedAuthorityList = new ArrayList<>();
        
        // 로그인한 계정에게 권한 부여
        grantedAuthorityList.add(new SimpleGrantedAuthority(user.getUserAuthority()));
        
        // 로그인 성공시 로그인 사용자 정보 반환
        return new UsernamePasswordAuthenticationToken(user, null, grantedAuthorityList);
    }
    
    @Override
    public boolean supports(Class<?> authentication) {
        return authentication.equals(UsernamePasswordAuthenticationToken.class);
    }
 
}
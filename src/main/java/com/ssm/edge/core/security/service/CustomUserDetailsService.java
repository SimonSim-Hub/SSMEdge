package com.ssm.edge.core.security.service;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import com.ssm.edge.core.system.userManagement.vo.UserMasterVO;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.ssm.edge.core.database.postgreSql.dao.PostgresqlAbstractDAO;
import com.ssm.edge.core.login.dao.LoginDAO;
import com.ssm.edge.core.system.userManagement.vo.CustomUserMasterDetailsVO;


@Service("customUserDetailsService")
public class CustomUserDetailsService extends PostgresqlAbstractDAO implements UserDetailsService {
	
	@Resource(name="loginDAO")
	public LoginDAO loginDAO;
	
	public CustomUserDetailsService() {
	}
	
	@Override
	public UserDetails loadUserByUsername(String userId) throws UsernameNotFoundException {
		UserMasterVO userMasterVO = new UserMasterVO();

		List<GrantedAuthority> gas = new ArrayList<GrantedAuthority>();
		
		String userName = null;
		String userPassword = null;
		String userEmail = null;
		String userAuthority = null;
		boolean useYn = true;

		try {
			userMasterVO = loginDAO.selectUserById(userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		userName = userMasterVO.getUserName();
		userPassword = userMasterVO.getUserPassword();
		userEmail = userMasterVO.getUserEmail();
		userAuthority = userMasterVO.getUserAuthority();
		
		if(userMasterVO.getUseYn() == 1) {
			useYn = true;
		} else {
			useYn = false;
		}

		gas.add(new SimpleGrantedAuthority(userAuthority));
		
		return new CustomUserMasterDetailsVO(userId, userPassword, userName, userEmail, userAuthority, useYn, true, true, true, gas);
	}

}

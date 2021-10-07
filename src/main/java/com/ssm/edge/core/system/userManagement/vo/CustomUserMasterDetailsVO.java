package com.ssm.edge.core.system.userManagement.vo;

import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.SpringSecurityCoreVersion;
import org.springframework.security.core.userdetails.User;

public class CustomUserMasterDetailsVO extends User{

	private static final long serialVersionUID = SpringSecurityCoreVersion.SERIAL_VERSION_UID;

	private String userId;
	private String userName;
	private String userEmail;
	private String userAuthority;
	private boolean useYn;
	
	public CustomUserMasterDetailsVO(String userName
			   			, String userPassword
			   			, String userRealName
			   			, String userEmail
			   			, String userAuthority
			   			, boolean useYn
			   			, boolean accountNonExpired
			   			, boolean credentialsNonExpired
			   			, boolean accountNonLocked
			   			, Collection<? extends GrantedAuthority> authorities ) {
		
		super(userName, userPassword, useYn, accountNonExpired, credentialsNonExpired, accountNonLocked, authorities);
		
		this.userId = userName; 
		this.userName = userRealName; 
		this.userEmail = userEmail; 
		this.userAuthority = userAuthority; 
		this.useYn = useYn;

	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getUserAuthority() {
		return userAuthority;
	}

	public void setUserAuthority(String userAuthority) {
		this.userAuthority = userAuthority;
	}

	public boolean isUseYn() {
		return useYn;
	}

	public void setUseYn(boolean useYn) {
		this.useYn = useYn;
	}

	@Override
	public String toString() {
		return "UserDetailsVO [userId=" + userId + ", userName=" + userName + ", userEmail=" + userEmail
				+ ", userAuthority=" + userAuthority + ", useYn=" + useYn + "]";
	}
	
}

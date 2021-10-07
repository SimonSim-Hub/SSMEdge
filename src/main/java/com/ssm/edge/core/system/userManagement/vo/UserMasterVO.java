package com.ssm.edge.core.system.userManagement.vo;

import lombok.Data;

import java.util.Date;

@Data
public class UserMasterVO {
	private int rowNum;
	private String userId;
	private String userName;
	private String userEmail;
	private String userPassword;
	private String userAuthority;
	private String userAuthorityStr;
	private int useYn;
	private Date createDate;
	private String createUser;
	private Date updateDate;
	private String updateUser;
}

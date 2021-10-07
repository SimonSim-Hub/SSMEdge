package com.ssm.edge.core.exceptionHandling.vo;

import lombok.Data;

import java.util.Date;

@Data
public class ExceptionHandlingVO {
	private String userId;
	private int errorCode;
	private String errorMsg;
	private String userComment;
	private int useYn;
	private Date createDate;
	private String createUser;
	private Date updateDate;
	private String updateUser;
}

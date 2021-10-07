package com.ssm.edge.turck.admin.deviceManagement.vo;

import lombok.Data;

import java.util.Date;

@Data
public class DeviceMasterVO {
    private int rowNum;
    private int deviceNo;
    private String deviceCode;
    private String deviceName;
    private String deviceFullname;
    private String locationCode;
    private String locationName;
    private String queryStatus;
    private int useYn;
    private Date createDate;
    private String createUser;
    private Date updateDate;
    private String updateUser;

}
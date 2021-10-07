package com.ssm.edge.turck.admin.locationManagement.vo;

import lombok.Data;

import java.util.Date;

@Data
public class LocationMasterVO {
    private int rowNum;
    private int locationNo;
    private String locationCode;
    private String locationName;
    private String factoryCode;
    private String factoryName;
    private int useYn;
    private Date createDate;
    private String createUser;
    private Date updateDate;
    private String updateUser;

}
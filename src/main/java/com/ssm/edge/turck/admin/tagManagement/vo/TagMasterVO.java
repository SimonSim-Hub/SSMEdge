package com.ssm.edge.turck.admin.tagManagement.vo;

import lombok.Data;

import java.util.Date;

@Data
public class TagMasterVO {
    private int rowNum;
    private int tagNo;
    private String tagCode;
    private String tagName;
    private String tagRealname;
    private String tagFullname;
    private String tagType;
    private String warningValue;
    private String alarmValue;
    private int alarmStatus;
    private String sensorCode;
    private String sensorName;
    private String deviceCode;
    private String deviceName;
    private String locationCode;
    private String locationName;
    private String queryStatus;
    private int useYn;
    private Date createDate;
    private String createUser;
    private Date updateDate;
    private String updateUser;
}

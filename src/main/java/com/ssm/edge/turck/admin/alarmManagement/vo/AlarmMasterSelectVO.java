package com.ssm.edge.turck.admin.alarmManagement.vo;

import lombok.Data;

import java.util.Date;

@Data
public class AlarmMasterSelectVO {
    private String alarmCode;
    private int alarmStatus;
    private int alarmCount;
    private int confirmStatus;
    private String locationCode;
    private String deviceCode;
    private String sensorCode;
    private String tagCode;
    private String startDate;
    private String endDate;
    private Date createDate;
    private String createUser;
    private Date updateDate;
    private String updateUser;
}
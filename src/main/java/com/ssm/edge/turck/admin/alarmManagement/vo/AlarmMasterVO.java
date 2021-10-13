package com.ssm.edge.turck.admin.alarmManagement.vo;

import lombok.Data;

import java.util.Date;
import java.util.List;

@Data
public class AlarmMasterVO {
    private int rowNum;
    private int alarmNo;
    private String alarmCode;
    private String alarmName;
    private String tagCode;
    private String tagName;
    private String tagRealname;
    private String sensorCode;
    private String sensorName;
    private String deviceCode;
    private String deviceName;
    private String locationCode;
    private String locationName;
    private String warningValue;
    private String alarmValue;
    private String tagValue;
    private int alarmStatus;
    private String alarmStatusStr;
    private String queryStatus;
    private Date clearDate;
    private String clearDateStr;
    private int clearStatus;
    private String clearStatusStr;
    private Date confirmDate;
    private String confirmDateStr;
    private int confirmStatus;
    private String confirmStatusStr;
    private String historyTagValue;
    private String historyAlarmValue;
    private String startDate;
    private String endDate;
    private int useYn;
    private Date createDate;
    private String createDateStr;
    private String createUser;
    private Date updateDate;
    private String updateUser;
    private String userName;
}
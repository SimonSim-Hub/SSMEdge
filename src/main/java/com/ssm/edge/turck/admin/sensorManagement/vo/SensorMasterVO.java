package com.ssm.edge.turck.admin.sensorManagement.vo;

import lombok.Data;

import java.util.Date;

@Data
public class SensorMasterVO {
    private int rowNum;
    private int sensorNo;
    private String sensorCode;
    private String sensorName;
    private String sensorFullname;
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

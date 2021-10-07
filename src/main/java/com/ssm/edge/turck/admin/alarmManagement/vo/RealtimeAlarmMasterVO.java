package com.ssm.edge.turck.admin.alarmManagement.vo;

import lombok.Data;

import java.util.Date;

@Data
public class RealtimeAlarmMasterVO {
    private String tagName;
    private String sensorCode;
    private String warningValue;
    private String alarmValue;
}
package com.ssm.edge.core.main.vo;

import lombok.Data;

import java.util.Date;

@Data
public class VibrationSensorLowDataVO {
    private int rowNum;
    private Date oTime;
    private String oTimeStr;
    private String sensorCode;
    private String sensorName;
    private String sensorFullname;
    private String deviceCode;
    private String deviceName;
    private String locationCode;
    private String locationName;
    private float xAxisRmsVelocityMmValue;
    private float zAxisRmsVelocityMmValue;
    private float xAxisPeakAccelerationValue;
    private float zAxisPeakAccelerationValue;
    private float temperatureCValue;
    private float zAxisPeakVelocityComponentFrequencyValue;
    private float xAxisPeakVelocityComponentFrequencyValue;
    private float zAxisRmsAccelerationValue;
    private float xAxisRmsAccelerationValue;
    private float zAxisKurtosisValue;
    private float xAxisKurtosisValue;
    private float zAxisCrestFactorValue;
    private float xAxisCrestFactorValue;
    private float zAxisPeakVelocityMmValue;
    private float xAxisPeakVelocityMmValue;
    private float zAxisHighFrequencyRmsAccelerationValue;
    private float xAxisHighFrequencyRmsAccelerationValue;
    private Date startDate;
    private Date endDate;
}

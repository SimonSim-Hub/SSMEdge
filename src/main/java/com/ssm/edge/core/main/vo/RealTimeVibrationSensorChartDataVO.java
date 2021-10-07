package com.ssm.edge.core.main.vo;

import lombok.Data;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Data
public class RealTimeVibrationSensorChartDataVO {
    private String sensorCode;
    private List<Date> oTimeArr = new ArrayList<Date>();
    private List<String> xRMSVelocityArr = new ArrayList<String>();
    private List<String> zRMSVelocityArr = new ArrayList<String>();
    private List<String> xPeakAccelerationArr = new ArrayList<String>();
    private List<String> zPeakAccelerationArr = new ArrayList<String>();
    private List<String> temperatureCArr = new ArrayList<String>();
    private List<String> xPeakVelocityArr = new ArrayList<String>();
    private List<String> zPeakVelocityArr = new ArrayList<String>();
    private List<String> xRMSAccelerationArr = new ArrayList<String>();
    private List<String> zRMSAccelerationArr = new ArrayList<String>();
    private List<String> xCrestFactorArr = new ArrayList<String>();
    private List<String> zCrestFactorArr = new ArrayList<String>();
    private List<String> zHighFrequencyRmsAccelerationArr = new ArrayList<String>();
    private List<String> xHighFrequencyRmsAccelerationArr = new ArrayList<String>();
    private List<String> xPeakVelocityComponentFrequencyArr = new ArrayList<String>();
    private List<String> zPeakVelocityComponentFrequencyArr = new ArrayList<String>();
    private List<String> xKurtosisArr = new ArrayList<String>();
    private List<String> zKurtosisArr = new ArrayList<String>();
    private float x_axis_rms_velocity_mm_value;
    private float x_axis_rms_velocity_mm_warning;
    private float x_axis_rms_velocity_mm_alarm;
    private int x_axis_rms_velocity_mm_status;
    private float z_axis_rms_velocity_mm_value;
    private float z_axis_rms_velocity_mm_warning;
    private float z_axis_rms_velocity_mm_alarm;
    private int z_axis_rms_velocity_mm_status;
    private float x_axis_peak_acceleration_value;
    private float x_axis_peak_acceleration_warning;
    private float x_axis_peak_acceleration_alarm;
    private int x_axis_peak_acceleration_status;
    private float z_axis_peak_acceleration_value;
    private float z_axis_peak_acceleration_warning;
    private float z_axis_peak_acceleration_alarm;
    private int z_axis_peak_acceleration_status;
    private float temperature_c_value;
    private float temperature_c_warning;
    private float temperature_c_alarm;
    private int temperature_c_status;
}

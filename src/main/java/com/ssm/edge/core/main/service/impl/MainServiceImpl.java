package com.ssm.edge.core.main.service.impl;

import com.ssm.edge.core.main.dao.MainDAO;
import com.ssm.edge.core.main.dao.MainMssqlDAO;
import com.ssm.edge.core.main.service.MainService;
import com.ssm.edge.core.main.vo.*;
import com.ssm.edge.core.map.CommonCommandMap;
import com.ssm.edge.core.util.ConvertUtil;
import com.ssm.edge.turck.admin.alarmManagement.dao.AlarmManagementDAO;
import com.ssm.edge.turck.admin.alarmManagement.vo.AlarmMasterVO;
import com.ssm.edge.turck.admin.alarmManagement.vo.RealtimeAlarmMasterVO;
import com.ssm.edge.turck.admin.sensorManagement.dao.SensorManagementDAO;
import com.ssm.edge.turck.admin.sensorManagement.vo.SensorMasterVO;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.*;

@Service("mainService")
public class MainServiceImpl implements MainService {

    @Resource(name = "mainDAO")
    public MainDAO mainDAO;

    @Resource(name = "mainMssqlDAO")
    public MainMssqlDAO mainMssqlDAO;

    @Resource(name = "sensorManagementDAO")
    public SensorManagementDAO sensorManagementDAO;

    @Resource(name = "alarmManagementDAO")
    public AlarmManagementDAO alarmManagementDAO;

    public static Map<String, List<AlarmMasterVO>> memoryAlarmMasterVOMap = new HashMap<>();
    public static Map<String, Integer> memoryAlarmStatusMap = new HashMap<>();
    public static Map<String, Integer> momoryLastAlarmStatusMap = new HashMap<>();

    @Override
    public ModelAndView selectSensorMainChartData(CommonCommandMap commonCommandMap) {
        ModelAndView mv = new ModelAndView("jsonView");

        ModelMapper modelMapper = new ModelMapper();
        SensorMasterVO sensorMasterVO = modelMapper.map(commonCommandMap.getMap(), SensorMasterVO.class);

        String resultStatus = null;
        String resultMessage = null;

        String sensorMasterList = null;

        try {
            sensorMasterList = ConvertUtil.ArrayToString(sensorManagementDAO.selectSensorMasterList(sensorMasterVO));

            mv.addObject("sensorMasterList", sensorMasterList);

        } catch (Exception e) {
            e.printStackTrace();

            resultStatus = "3";
            resultMessage = "[ERR_MSI_SSMCD_0001]<br>센서 목록 조회에 실패하였습니다.<br>관리자에게 문의하세요.";

            mv.addObject("resultStatus", resultStatus);
            mv.addObject("resultMessage", resultMessage);

            return mv;
        }

        mv.addObject("resultStatus", resultStatus);
        mv.addObject("resultMessage", resultMessage);

        return mv;
    }

    @Override
    public String selectTagLowDataMinDate() {
        String resultStartTime = "";

        try {
            resultStartTime = mainDAO.selectTagLowDataMinDate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return resultStartTime;
    }

    @Override
    public List<VibrationSensorLowDataVO> vibrationSensorLowDataGrouppingList(VibrationSensorLowDataVO tagLowDataVO) {
        List<VibrationSensorLowDataVO> vibrationSensorLowDataGrouppingList = new ArrayList<>();

        try {
            vibrationSensorLowDataGrouppingList = mainDAO.selectVibrationSensorLowDataGrouppingList(tagLowDataVO);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return vibrationSensorLowDataGrouppingList;
    }

    @Override
    public void resetVibrationSensorMemoryAlarmList() {
        try {
            List<SensorMasterVO> memorySensorMasterVOList = new ArrayList<>();

            memorySensorMasterVOList = sensorManagementDAO.selectSensorMasterList(null);

            if(memorySensorMasterVOList != null) {
                for(int i = 0; i < memorySensorMasterVOList.size(); i++){
                    String sensorCode = memorySensorMasterVOList.get(i).getSensorCode();

                    AlarmMasterVO alarmMasterVO = new AlarmMasterVO();
                    List<AlarmMasterVO> alarmMasterVOList = new ArrayList<>();

                    alarmMasterVO.setSensorCode(sensorCode);

                    alarmMasterVOList = alarmManagementDAO.selectAlarmMasterList(alarmMasterVO);

                    memoryAlarmMasterVOMap.put(sensorCode, alarmMasterVOList);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        try {
            List<AlarmMasterVO> dbAlarmStatusVOList = alarmManagementDAO.selectAlarmStatus();
            for(int i = 0; i < dbAlarmStatusVOList.size(); i++) {
                memoryAlarmStatusMap.put(dbAlarmStatusVOList.get(i).getAlarmCode(), dbAlarmStatusVOList.get(i).getAlarmStatus());
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        try {
            List<AlarmMasterVO> dbAlarmStatusVOList = alarmManagementDAO.selectAlarmStatus();

            for(int i = 0; i < dbAlarmStatusVOList.size(); i++) {
                momoryLastAlarmStatusMap.put(dbAlarmStatusVOList.get(i).getAlarmCode(), alarmManagementDAO.selectAlarmHistoryMaxAlarmStatus(dbAlarmStatusVOList.get(i)));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void insertVibrationSensorLowDataGrouppingList(VibrationSensorLowDataVO insertVibrationSensorLowDataVO) {
        if(memoryAlarmMasterVOMap != null && memoryAlarmMasterVOMap.size() > 0) {
            if(insertVibrationSensorLowDataVO.getSensorCode() != null) {
                String plcSensorCode = insertVibrationSensorLowDataVO.getSensorCode();

                List<AlarmMasterVO> alarmMasterVOList = new ArrayList<>();

                alarmMasterVOList = memoryAlarmMasterVOMap.get(plcSensorCode);

                if (alarmMasterVOList != null && alarmMasterVOList.size() > 0) {

                    for (int i = 0; i < alarmMasterVOList.size(); i++) {
                        int alarmStatus = 0;

                        float xAxisRmsVelocityMmValue = insertVibrationSensorLowDataVO.getXAxisRmsVelocityMmValue();
                        float zAxisRmsVelocityMmValue = insertVibrationSensorLowDataVO.getZAxisRmsVelocityMmValue();
                        float xAxisPeakAccelerationValue = insertVibrationSensorLowDataVO.getXAxisPeakAccelerationValue();
                        float zAxisPeakAccelerationValue = insertVibrationSensorLowDataVO.getZAxisPeakAccelerationValue();
                        float temperatureCValue = insertVibrationSensorLowDataVO.getTemperatureCValue();

                        String alarmName = alarmMasterVOList.get(i).getAlarmName();
                        String alarmCode = alarmMasterVOList.get(i).getAlarmCode();
                        float warringValue = Float.parseFloat(alarmMasterVOList.get(i).getWarningValue());
                        float alarmValue = Float.parseFloat(alarmMasterVOList.get(i).getAlarmValue());

                        float historyTagValue = 0;
                        float historyAlarmValue = 0;

                        if (alarmName.equals("X_Axis_RMS_Velocity_mm_Alarm")) {
                            historyTagValue = xAxisRmsVelocityMmValue;

                            if (xAxisRmsVelocityMmValue > warringValue) {
                                alarmStatus = 1;

                                historyAlarmValue = warringValue;
                            }

                            if (xAxisRmsVelocityMmValue > alarmValue) {
                                alarmStatus = 2;

                                historyAlarmValue = alarmValue;
                            }
                        } else if (alarmName.equals("Z_Axis_RMS_Velocity_mm_Alarm")) {
                            historyTagValue = zAxisRmsVelocityMmValue;

                            if (zAxisRmsVelocityMmValue > warringValue) {
                                alarmStatus = 1;

                                historyAlarmValue = warringValue;
                            }

                            if (zAxisRmsVelocityMmValue > alarmValue) {
                                alarmStatus = 2;

                                historyAlarmValue = alarmValue;
                            }
                        } else if (alarmName.equals("X_Axis_Peak_Acceleration_Alarm")) {
                            historyTagValue = xAxisPeakAccelerationValue;

                            if (xAxisPeakAccelerationValue > warringValue) {
                                alarmStatus = 1;

                                historyAlarmValue = warringValue;
                            }

                            if (xAxisPeakAccelerationValue > alarmValue) {
                                alarmStatus = 2;

                                historyAlarmValue = alarmValue;
                            }
                        } else if (alarmName.equals("Z_Axis_Peak_Acceleration_Alarm")) {
                            historyTagValue = zAxisPeakAccelerationValue;

                            if (zAxisPeakAccelerationValue > warringValue) {
                                alarmStatus = 1;

                                historyAlarmValue = warringValue;
                            }

                            if (zAxisPeakAccelerationValue > alarmValue) {
                                alarmStatus = 2;

                                historyAlarmValue = alarmValue;
                            }
                        } else if (alarmName.equals("Temperature_C_Alarm")) {
                            historyTagValue = temperatureCValue;

                            if (temperatureCValue > warringValue) {
                                alarmStatus = 1;

                                historyAlarmValue = warringValue;
                            }

                            if (temperatureCValue > alarmValue) {
                                alarmStatus = 2;

                                historyAlarmValue = alarmValue;
                            }
                        }

                        AlarmMasterVO alarmMasterVO = new AlarmMasterVO();

                        alarmMasterVO.setAlarmStatus(alarmStatus);
                        alarmMasterVO.setAlarmCode(alarmCode);
                        alarmMasterVO.setSensorCode(insertVibrationSensorLowDataVO.getSensorCode());
                        alarmMasterVO.setHistoryTagValue(String.valueOf(historyTagValue));
                        alarmMasterVO.setHistoryAlarmValue(String.valueOf(historyAlarmValue));
                        alarmMasterVO.setUpdateUser("system");
                        alarmMasterVO.setCreateUser("system");

                        if (alarmStatus > 0) {
                            try {
                                if(memoryAlarmStatusMap.get(alarmMasterVO.getAlarmCode()) != null) {
                                    int memoryAlarmStatus = memoryAlarmStatusMap.get(alarmMasterVO.getAlarmCode());

                                    if (alarmStatus > memoryAlarmStatus) {
                                        memoryAlarmStatusMap.put(alarmMasterVO.getAlarmCode(), alarmMasterVO.getAlarmStatus());

                                        alarmManagementDAO.updateAlarmMasterInfo(alarmMasterVO);
                                    }
                                }
                            } catch (Exception e) {
                                e.printStackTrace();
                            }
                        }

                        if(momoryLastAlarmStatusMap.get(alarmMasterVO.getAlarmCode()) != null) {
                            int memoryLastAlarmStatus = momoryLastAlarmStatusMap.get(alarmMasterVO.getAlarmCode());

                            try {
                                if (momoryLastAlarmStatusMap != null && momoryLastAlarmStatusMap.size() > 0) {
                                    momoryLastAlarmStatusMap.put(alarmMasterVO.getAlarmCode(), alarmMasterVO.getAlarmStatus());
                                }

                                if (alarmMasterVO.getAlarmStatus() != memoryLastAlarmStatus) {
                                    alarmManagementDAO.insertAlarmHistory(alarmMasterVO);
                                }
                            } catch (Exception e) {
                                e.printStackTrace();
                            }
                        }
                    }
                }
            }
        }

        try {
            // 두산 인프라코어 Mssql DB가 없어 임시로 Postgresql DB에 이력 데이터 저장
            // mainMssqlDAO.insertVibrationSensorLowDataGrouppingList(insertVibrationSensorLowDataVO);
            if(insertVibrationSensorLowDataVO.getSensorCode() != null) {
                mainDAO.insertVibrationSensorLowDataGrouppingList(insertVibrationSensorLowDataVO);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        try {
            if(insertVibrationSensorLowDataVO.getSensorCode() != null) {
                mainDAO.deleteVibrationSensorLowDataGrouppingList(insertVibrationSensorLowDataVO);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        try {
            if(insertVibrationSensorLowDataVO.getSensorCode() != null) {
                mainDAO.insertVibrationSensorLowDataHotList(insertVibrationSensorLowDataVO);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        try {
            int sensorCount = 0;
            int dataCount = 0;

            Date minDate = new Date();

            sensorCount = mainDAO.selectSensorCount(null);

            dataCount = mainDAO.selectVibrationSensorLowDataHotListCount();

            if(dataCount > 0 && sensorCount > 0) {
                if(dataCount > (sensorCount * 500)) {
                    minDate = mainDAO.selectVibrationSensorLowDataHotListMinDate(sensorCount * 500);

                    if (minDate != null) {
                        mainDAO.deleteVibrationSensorLowDataHotList(minDate);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public ModelAndView selectVibrationSensorLowDataLastCountList(CommonCommandMap commonCommandMap) {
        ModelAndView mv = new ModelAndView("jsonView");

        List<VibrationSensorLowDataVO> vibrationSensorLowDataVOList = new ArrayList<VibrationSensorLowDataVO>();

        SensorMasterVO sensorMasterVO = new SensorMasterVO();
        List<SensorMasterVO> sensorMasterVOList = new ArrayList<SensorMasterVO>();

        List<RealTimeVibrationSensorChartDataVO> realTimeVibrationSensorChartDataVOList = new ArrayList<RealTimeVibrationSensorChartDataVO>();

        int sensorCount = 0;

        int dataCount = 0;
        String chartType = null;
        String locationCode = null;
        String deviceCode = null;
        String sensorCode = null;

        Map<String, String> selectSensorCountMap = new HashMap<>();

        chartType = (String) commonCommandMap.get("chartType");
        locationCode = (String) commonCommandMap.get("locationCode");
        deviceCode = (String) commonCommandMap.get("deviceCode");
        sensorCode = (String) commonCommandMap.get("sensorCode");

        selectSensorCountMap.put("locationCode", locationCode);
        selectSensorCountMap.put("deviceCode", deviceCode);
        selectSensorCountMap.put("sensorCode", sensorCode);

        long threadDelay = 0;

        try {
            sensorCount = mainDAO.selectSensorCount(selectSensorCountMap);

            if(chartType.equals("M")) {
                dataCount = mainDAO.selectSystemSetting().getMainChartQty() * sensorCount;
            } else if(chartType.equals("D")) {
                dataCount = mainDAO.selectSystemSetting().getDetailChartQty() * sensorCount;
            }
        } catch (Exception e) {
            e.printStackTrace();

            return mv;
        }

        try {
            ModelMapper modelMapper = new ModelMapper();
            sensorMasterVO = modelMapper.map(commonCommandMap.getMap(), SensorMasterVO.class);

            sensorMasterVOList = sensorManagementDAO.selectSensorMasterList(sensorMasterVO);
        } catch (Exception e) {
            e.printStackTrace();

            return mv;
        }

        if (sensorCount > 0) {
            try {
                Map<String, String> selectTagLowDataLastCountListMap = new HashMap<>();

                selectTagLowDataLastCountListMap.put("dataCount", String.valueOf(dataCount));
                selectTagLowDataLastCountListMap.put("locationCode", locationCode);
                selectTagLowDataLastCountListMap.put("deviceCode", deviceCode);

                vibrationSensorLowDataVOList = mainDAO.selectVibrationSensorLowDataLastCountList(selectTagLowDataLastCountListMap);

                for(int i = 0; i < sensorMasterVOList.size(); i++) {
                    RealTimeVibrationSensorChartDataVO realTimeVibrationSensorChartDataVO = new RealTimeVibrationSensorChartDataVO();

                    String sensorMasterVOListSensorCode = sensorMasterVOList.get(i).getSensorCode();

                    realTimeVibrationSensorChartDataVO.setSensorCode(sensorMasterVOListSensorCode);

                    realTimeVibrationSensorChartDataVO.getXRMSVelocityArr().add("X_Axis_RMS_Velocity_mm");
                    realTimeVibrationSensorChartDataVO.getZRMSVelocityArr().add("Z_Axis_RMS_Velocity_mm");

                    realTimeVibrationSensorChartDataVO.getXPeakAccelerationArr().add("X_Axis_Peak_Acceleration");
                    realTimeVibrationSensorChartDataVO.getZPeakAccelerationArr().add("Z_Axis_Peak_Acceleration");
                    realTimeVibrationSensorChartDataVO.getTemperatureCArr().add("Temperature_C");
                    realTimeVibrationSensorChartDataVO.getXPeakVelocityArr().add("X_Axis_Peak_Velocity_mm");
                    realTimeVibrationSensorChartDataVO.getZPeakVelocityArr().add("Z_Axis_Peak_Velocity_mm");
                    realTimeVibrationSensorChartDataVO.getXRMSAccelerationArr().add("X_Axis_RMS_Acceleration");
                    realTimeVibrationSensorChartDataVO.getZRMSAccelerationArr().add("Z_Axis_RMS_Acceleration");
                    realTimeVibrationSensorChartDataVO.getXCrestFactorArr().add("X_Axis_Crest_Factor");
                    realTimeVibrationSensorChartDataVO.getZCrestFactorArr().add("Z_Axis_Crest_Factor");
                    realTimeVibrationSensorChartDataVO.getXHighFrequencyRmsAccelerationArr().add("X_Axis_High_Frequency_RMS_Acceleration");
                    realTimeVibrationSensorChartDataVO.getZHighFrequencyRmsAccelerationArr().add("Z_Axis_High_Frequency_RMS_Acceleration");
                    realTimeVibrationSensorChartDataVO.getXPeakVelocityComponentFrequencyArr().add("X_Axis_Peak_Velocity_Component_Frequency");
                    realTimeVibrationSensorChartDataVO.getZPeakVelocityComponentFrequencyArr().add("Z_Axis_Peak_Velocity_Component_Frequency");
                    realTimeVibrationSensorChartDataVO.getXKurtosisArr().add("X_Axis_Kurtosis");
                    realTimeVibrationSensorChartDataVO.getZKurtosisArr().add("Z_Axis_Kurtosis");

                    realTimeVibrationSensorChartDataVOList.add(realTimeVibrationSensorChartDataVO);
                }

                for(int i = 0; i < realTimeVibrationSensorChartDataVOList.size(); i++) {
                    String realTimeVibrationSensorChartSensorCode = realTimeVibrationSensorChartDataVOList.get(i).getSensorCode();

                    for(int j = 0; j < vibrationSensorLowDataVOList.size(); j++) {
                        String vibrationSensorLowSensorCode = vibrationSensorLowDataVOList.get(j).getSensorCode();

                        if(realTimeVibrationSensorChartSensorCode.equals(vibrationSensorLowSensorCode)) {
                            List<RealtimeAlarmMasterVO> alarmMasterVOList = new ArrayList<RealtimeAlarmMasterVO>();
                            AlarmMasterVO alarmMasterVO = new AlarmMasterVO();

                            alarmMasterVO.setSensorCode(vibrationSensorLowSensorCode);

                            alarmMasterVOList = alarmManagementDAO.selectRealtimeAlarmMasterList(alarmMasterVO);

                            Date oTime = vibrationSensorLowDataVOList.get(j).getOTime();

                            realTimeVibrationSensorChartDataVOList.get(i).getOTimeArr().add(oTime);

                            String xRMSVelocity = String.valueOf(vibrationSensorLowDataVOList.get(j).getXAxisRmsVelocityMmValue());
                            String zRMSVelocity = String.valueOf(vibrationSensorLowDataVOList.get(j).getZAxisRmsVelocityMmValue());

                            realTimeVibrationSensorChartDataVOList.get(i).getXRMSVelocityArr().add(xRMSVelocity);
                            realTimeVibrationSensorChartDataVOList.get(i).getZRMSVelocityArr().add(zRMSVelocity);

                            realTimeVibrationSensorChartDataVOList.get(i).setX_axis_rms_velocity_mm_value(Float.parseFloat(xRMSVelocity));
                            realTimeVibrationSensorChartDataVOList.get(i).setZ_axis_rms_velocity_mm_value(Float.parseFloat(zRMSVelocity));

                            realTimeVibrationSensorChartDataVOList.get(i).setX_axis_rms_velocity_mm_status(0);
                            realTimeVibrationSensorChartDataVOList.get(i).setZ_axis_rms_velocity_mm_status(0);

                            for(int k = 0; k < alarmMasterVOList.size(); k++) {
                                if(alarmMasterVOList.get(k).getTagName().equals("X_Axis_RMS_Velocity_mm")) {
                                    realTimeVibrationSensorChartDataVOList.get(i).setX_axis_rms_velocity_mm_warning(Float.parseFloat(alarmMasterVOList.get(k).getWarningValue()));
                                    realTimeVibrationSensorChartDataVOList.get(i).setX_axis_rms_velocity_mm_alarm(Float.parseFloat(alarmMasterVOList.get(k).getAlarmValue()));

                                    if (Float.parseFloat(xRMSVelocity) > Float.parseFloat(alarmMasterVOList.get(k).getWarningValue())) {
                                        realTimeVibrationSensorChartDataVOList.get(i).setX_axis_rms_velocity_mm_status(1);
                                    }
                                    if (Float.parseFloat(xRMSVelocity) > Float.parseFloat(alarmMasterVOList.get(k).getAlarmValue())) {
                                        realTimeVibrationSensorChartDataVOList.get(i).setX_axis_rms_velocity_mm_status(2);
                                    }
                                } else if(alarmMasterVOList.get(k).getTagName().equals("Z_Axis_RMS_Velocity_mm")) {
                                    realTimeVibrationSensorChartDataVOList.get(i).setZ_axis_rms_velocity_mm_warning(Float.parseFloat(alarmMasterVOList.get(k).getWarningValue()));
                                    realTimeVibrationSensorChartDataVOList.get(i).setZ_axis_rms_velocity_mm_alarm(Float.parseFloat(alarmMasterVOList.get(k).getAlarmValue()));

                                    if (Float.parseFloat(zRMSVelocity) > Float.parseFloat(alarmMasterVOList.get(k).getWarningValue())) {
                                        realTimeVibrationSensorChartDataVOList.get(i).setZ_axis_rms_velocity_mm_status(1);
                                    }
                                    if (Float.parseFloat(zRMSVelocity) > Float.parseFloat(alarmMasterVOList.get(k).getAlarmValue())) {
                                        realTimeVibrationSensorChartDataVOList.get(i).setZ_axis_rms_velocity_mm_status(2);
                                    }
                                }
                            }

                            if(sensorCode != null) {
                                String xPeakAcceleration = String.valueOf(vibrationSensorLowDataVOList.get(j).getXAxisPeakAccelerationValue());
                                String zPeakAcceleration = String.valueOf(vibrationSensorLowDataVOList.get(j).getZAxisPeakAccelerationValue());

                                realTimeVibrationSensorChartDataVOList.get(i).getXPeakAccelerationArr().add(xPeakAcceleration);
                                realTimeVibrationSensorChartDataVOList.get(i).getZPeakAccelerationArr().add(zPeakAcceleration);

                                realTimeVibrationSensorChartDataVOList.get(i).setX_axis_peak_acceleration_value(Float.parseFloat(xPeakAcceleration));
                                realTimeVibrationSensorChartDataVOList.get(i).setZ_axis_peak_acceleration_value(Float.parseFloat(zPeakAcceleration));

                                String temperatureC = String.valueOf(vibrationSensorLowDataVOList.get(j).getTemperatureCValue());

                                realTimeVibrationSensorChartDataVOList.get(i).getTemperatureCArr().add(temperatureC);

                                realTimeVibrationSensorChartDataVOList.get(i).setTemperature_c_value(Float.parseFloat(temperatureC));

                                realTimeVibrationSensorChartDataVOList.get(i).setX_axis_peak_acceleration_status(0);
                                realTimeVibrationSensorChartDataVOList.get(i).setZ_axis_peak_acceleration_status(0);

                                realTimeVibrationSensorChartDataVOList.get(i).setTemperature_c_status(0);

                                for(int k = 0; k < alarmMasterVOList.size(); k++) {
                                    if(alarmMasterVOList.get(k).getTagName().equals("X_Axis_Peak_Acceleration")) {
                                        realTimeVibrationSensorChartDataVOList.get(i).setX_axis_peak_acceleration_warning(Float.parseFloat(alarmMasterVOList.get(k).getWarningValue()));
                                        realTimeVibrationSensorChartDataVOList.get(i).setX_axis_peak_acceleration_alarm(Float.parseFloat(alarmMasterVOList.get(k).getAlarmValue()));

                                        if (Float.parseFloat(xPeakAcceleration) > Float.parseFloat(alarmMasterVOList.get(k).getWarningValue())) {
                                            realTimeVibrationSensorChartDataVOList.get(i).setX_axis_peak_acceleration_status(1);
                                        }
                                        if (Float.parseFloat(xPeakAcceleration) > Float.parseFloat(alarmMasterVOList.get(k).getAlarmValue())) {
                                            realTimeVibrationSensorChartDataVOList.get(i).setX_axis_peak_acceleration_status(2);
                                        }
                                    } else if(alarmMasterVOList.get(k).getTagName().equals("Z_Axis_Peak_Acceleration")) {
                                        realTimeVibrationSensorChartDataVOList.get(i).setZ_axis_peak_acceleration_warning(Float.parseFloat(alarmMasterVOList.get(k).getWarningValue()));
                                        realTimeVibrationSensorChartDataVOList.get(i).setZ_axis_peak_acceleration_alarm(Float.parseFloat(alarmMasterVOList.get(k).getAlarmValue()));

                                        if (Float.parseFloat(zPeakAcceleration) > Float.parseFloat(alarmMasterVOList.get(k).getWarningValue())) {
                                            realTimeVibrationSensorChartDataVOList.get(i).setZ_axis_peak_acceleration_status(1);
                                        }
                                        if (Float.parseFloat(zPeakAcceleration) > Float.parseFloat(alarmMasterVOList.get(k).getAlarmValue())) {
                                            realTimeVibrationSensorChartDataVOList.get(i).setZ_axis_peak_acceleration_status(2);
                                        }
                                    } else if(alarmMasterVOList.get(k).getTagName().equals("Temperature_C")) {
                                        realTimeVibrationSensorChartDataVOList.get(i).setTemperature_c_warning(Float.parseFloat(alarmMasterVOList.get(k).getWarningValue()));
                                        realTimeVibrationSensorChartDataVOList.get(i).setTemperature_c_alarm(Float.parseFloat(alarmMasterVOList.get(k).getAlarmValue()));

                                        if (Float.parseFloat(temperatureC) > Float.parseFloat(alarmMasterVOList.get(k).getWarningValue())) {
                                            realTimeVibrationSensorChartDataVOList.get(i).setTemperature_c_status(1);
                                        }
                                        if (Float.parseFloat(temperatureC) > Float.parseFloat(alarmMasterVOList.get(k).getAlarmValue())) {
                                            realTimeVibrationSensorChartDataVOList.get(i).setTemperature_c_status(2);
                                        }
                                    }
                                }

                                String xPeakVelocityArr = String.valueOf(vibrationSensorLowDataVOList.get(j).getXAxisPeakVelocityMmValue());
                                String zPeakVelocityArr = String.valueOf(vibrationSensorLowDataVOList.get(j).getZAxisPeakVelocityMmValue());
                                String xRMSAccelerationArr = String.valueOf(vibrationSensorLowDataVOList.get(j).getXAxisRmsAccelerationValue());
                                String zRMSAccelerationArr = String.valueOf(vibrationSensorLowDataVOList.get(j).getZAxisRmsAccelerationValue());
                                String xCrestFactorArr = String.valueOf(vibrationSensorLowDataVOList.get(j).getXAxisCrestFactorValue());
                                String zCrestFactorArr = String.valueOf(vibrationSensorLowDataVOList.get(j).getZAxisCrestFactorValue());
                                String xHighFrequencyRmsAccelerationArr = String.valueOf(vibrationSensorLowDataVOList.get(j).getXAxisHighFrequencyRmsAccelerationValue());
                                String zHighFrequencyRmsAccelerationArr = String.valueOf(vibrationSensorLowDataVOList.get(j).getZAxisHighFrequencyRmsAccelerationValue());
                                String xPeakVelocityComponentFrequencyArr = String.valueOf(vibrationSensorLowDataVOList.get(j).getXAxisPeakVelocityComponentFrequencyValue());
                                String zPeakVelocityComponentFrequencyArr = String.valueOf(vibrationSensorLowDataVOList.get(j).getZAxisPeakVelocityComponentFrequencyValue());
                                String xKurtosisArr = String.valueOf(vibrationSensorLowDataVOList.get(j).getXAxisKurtosisValue());
                                String zKurtosisArr = String.valueOf(vibrationSensorLowDataVOList.get(j).getZAxisKurtosisValue());


                                realTimeVibrationSensorChartDataVOList.get(i).getXPeakVelocityArr().add(xPeakVelocityArr);
                                realTimeVibrationSensorChartDataVOList.get(i).getZPeakVelocityArr().add(zPeakVelocityArr);
                                realTimeVibrationSensorChartDataVOList.get(i).getXRMSAccelerationArr().add(xRMSAccelerationArr);
                                realTimeVibrationSensorChartDataVOList.get(i).getZRMSAccelerationArr().add(zRMSAccelerationArr);
                                realTimeVibrationSensorChartDataVOList.get(i).getXCrestFactorArr().add(xCrestFactorArr);
                                realTimeVibrationSensorChartDataVOList.get(i).getZCrestFactorArr().add(zCrestFactorArr);
                                realTimeVibrationSensorChartDataVOList.get(i).getXHighFrequencyRmsAccelerationArr().add(xHighFrequencyRmsAccelerationArr);
                                realTimeVibrationSensorChartDataVOList.get(i).getZHighFrequencyRmsAccelerationArr().add(zHighFrequencyRmsAccelerationArr);
                                realTimeVibrationSensorChartDataVOList.get(i).getXPeakVelocityComponentFrequencyArr().add(xPeakVelocityComponentFrequencyArr);
                                realTimeVibrationSensorChartDataVOList.get(i).getZPeakVelocityComponentFrequencyArr().add(zPeakVelocityComponentFrequencyArr);
                                realTimeVibrationSensorChartDataVOList.get(i).getXKurtosisArr().add(xKurtosisArr);
                                realTimeVibrationSensorChartDataVOList.get(i).getZKurtosisArr().add(zKurtosisArr);
                            }
                        }
                    }
                }

                mv.addObject("realTimeVibrationSensorChartDataVOList", ConvertUtil.ArrayToString(realTimeVibrationSensorChartDataVOList));
            } catch (Exception e) {
                e.printStackTrace();

                return mv;
            }

            try {
                TagLowDataThreadDelayVO tagLowDataThreadDelayVO = new TagLowDataThreadDelayVO();

                tagLowDataThreadDelayVO = mainDAO.selectTagLowDataThreadDelay();

                threadDelay = tagLowDataThreadDelayVO.getTimerDelay();

                mv.addObject("threadDelay", threadDelay);
            } catch (Exception e) {
                e.printStackTrace();

                return mv;
            }
        }

        return mv;
    }

    @Override
    public ModelAndView selectThreadDelay(CommonCommandMap commonCommandMap) {
        ModelAndView mv = new ModelAndView("jsonView");

        long threadDelay = 0L;

        try {
            TagLowDataThreadDelayVO tagLowDataThreadDelayVO = new TagLowDataThreadDelayVO();

            tagLowDataThreadDelayVO = mainDAO.selectTagLowDataThreadDelay();

            threadDelay = tagLowDataThreadDelayVO.getTimerDelay();

            mv.addObject("threadDelay", threadDelay);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return mv;
    }

    @Override
    public ModelAndView selectMasterCode(CommonCommandMap commonCommandMap) {
        ModelAndView mv = new ModelAndView();

        String pageSensorCode = (String) commonCommandMap.get("sensorCode");

        MasterCodeVO masterCodeVO = new MasterCodeVO();

        String resultStatus = null;
        String resultMessage = null;

        try {
            masterCodeVO = mainDAO.selectMasterCode(pageSensorCode);

            if(masterCodeVO != null) {
                String sensorCode = masterCodeVO.getSensorCode();
                String deviceCode = masterCodeVO.getDeviceCode();
                String locationCode = masterCodeVO.getLocationCode();

                mv.addObject("sensorCode", sensorCode);
                mv.addObject("deviceCode", deviceCode);
                mv.addObject("locationCode", locationCode);
            } else {
                mv.addObject("sensorCode", "");
                mv.addObject("deviceCode", "");
                mv.addObject("locationCode", "");
            }
        } catch (Exception e) {
            e.printStackTrace();

            resultStatus = "3";
            resultMessage = "[ERR_MSI_SMC_0001]<br>마스터 코드 조회에 실패하였습니다.<br>관리자에게 문의하세요.";

            mv.addObject("resultStatus", resultStatus);
            mv.addObject("resultMessage", resultMessage);

            return mv;
        }

        return mv;
    }

    @Override
    public ModelAndView selectVibrationSensorReportDataList(CommonCommandMap commonCommandMap) {
        ModelAndView mv = new ModelAndView("jsonView");

        List<VibrationSensorLowDataVO> vibrationSensorReportDataList = new ArrayList<VibrationSensorLowDataVO>();

        SensorMasterVO sensorMasterVO = new SensorMasterVO();
        List<SensorMasterVO> sensorMasterVOList = new ArrayList<SensorMasterVO>();

        List<RealTimeVibrationSensorChartDataVO> reportVibrationSensorChartDataVOList = new ArrayList<RealTimeVibrationSensorChartDataVO>();

        String resultStatus = null;
        String resultMessage = null;

        String dataCount = null;
        String locationCode = null;
        String deviceCode = null;
        String sensorCode = null;
        String startDate = null;
        String endDate = null;

        int dataLastCount = 0;

        try {
            dataLastCount = mainDAO.selectSystemSetting().getReportChartQty();
        } catch (Exception e) {
            e.printStackTrace();
        }

        dataCount = (String) commonCommandMap.get("dataCount");
        locationCode = (String) commonCommandMap.get("locationCode");
        deviceCode = (String) commonCommandMap.get("deviceCode");
        sensorCode = (String) commonCommandMap.get("sensorCode");
        startDate = (String) commonCommandMap.get("startDate");
        endDate = (String) commonCommandMap.get("endDate");

        Map<String, String> selectTagLowDataReportListMap = new HashMap<>();

        CountAndDateVO countAndDateVO = new CountAndDateVO();

        selectTagLowDataReportListMap.put("dataCount", String.valueOf(dataCount));
        selectTagLowDataReportListMap.put("locationCode", locationCode);
        selectTagLowDataReportListMap.put("deviceCode", deviceCode);
        selectTagLowDataReportListMap.put("sensorCode", sensorCode);
        selectTagLowDataReportListMap.put("startDate", startDate);
        selectTagLowDataReportListMap.put("endDate", endDate);

        try {
            // 두산 인프라코어 Mssql DB가 없어 임시로 Postgresql DB에 이력 데이터 저장
            // countAndDateMap = mainMssqlDAO.selectVibrationSensorReportDataListCountAndDate(selectTagLowDataReportListMap);
            countAndDateVO = mainDAO.selectVibrationSensorReportDataListCountAndDate(selectTagLowDataReportListMap);
        } catch (Exception e) {
            e.printStackTrace();

            resultStatus = "3";
            resultMessage = "[ERR_MSI_SVSRDL_0001]<br>기간 별 태그 이력 카운트 조회에 실패하였습니다.<br>관리자에게 문의하세요.";

            mv.addObject("resultStatus", resultStatus);
            mv.addObject("resultMessage", resultMessage);

            return mv;
        }

        try {
            int dbDataCount = countAndDateVO.getDataCount();

            if(dbDataCount > dataLastCount) {
                selectTagLowDataReportListMap.put("dataLastCount", String.valueOf(dataLastCount));

                mv.addObject("startDate", String.valueOf(countAndDateVO.getStartDate()));
                mv.addObject("endDate", String.valueOf(countAndDateVO.getEndDate()));

                mv.addObject("listType", "LC");

                // 두산 인프라코어 Mssql DB가 없어 임시로 Postgresql DB에 이력 데이터 저장
                // vibrationSensorReportDataList = mainMssqlDAO.selectVibrationSensorReportDataLastCountList(selectTagLowDataReportListMap);
                vibrationSensorReportDataList = mainDAO.selectVibrationSensorReportDataLastCountList(selectTagLowDataReportListMap);

                resultStatus = "0";
                resultMessage = "조회 데이터가 너무 많아 제한된 검색조건을 적용합니다.<br>제한된 데이터 카운트 : " + dataLastCount + "건";

                mv.addObject("resultStatus", resultStatus);
                mv.addObject("resultMessage", resultMessage);
            } else {
                mv.addObject("startDate", startDate);
                mv.addObject("endDate", endDate);

                mv.addObject("listType", "DT");

                // 두산 인프라코어 Mssql DB가 없어 임시로 Postgresql DB에 이력 데이터 저장
                // vibrationSensorReportDataList = mainMssqlDAO.selectVibrationSensorReportDataList(selectTagLowDataReportListMap);
                vibrationSensorReportDataList = mainDAO.selectVibrationSensorReportDataList(selectTagLowDataReportListMap);

                resultStatus = "1";
                resultMessage = "기간 별 태그 이력 조회가 완료되었습니다.";
            }

            mv.addObject("vibrationSensorReportDataList", ConvertUtil.ArrayToString(vibrationSensorReportDataList));
        } catch (Exception e) {
            e.printStackTrace();

            resultStatus = "3";
            resultMessage = "[ERR_MSI_SVSRDL_0002]<br>기간 별 태그 이력 조회에 실패하였습니다.<br>관리자에게 문의하세요.";

            mv.addObject("resultStatus", resultStatus);
            mv.addObject("resultMessage", resultMessage);

            return mv;
        }

        try {
            ModelMapper modelMapper = new ModelMapper();
            sensorMasterVO = modelMapper.map(commonCommandMap.getMap(), SensorMasterVO.class);

            sensorMasterVOList = sensorManagementDAO.selectSensorMasterList(sensorMasterVO);

            for(int i = 0; i < sensorMasterVOList.size(); i++) {
                RealTimeVibrationSensorChartDataVO realTimeVibrationSensorChartDataVO = new RealTimeVibrationSensorChartDataVO();

                String sensorMasterVOListSensorCode = sensorMasterVOList.get(i).getSensorCode();

                realTimeVibrationSensorChartDataVO.setSensorCode(sensorMasterVOListSensorCode);

                realTimeVibrationSensorChartDataVO.getXRMSVelocityArr().add("X_Axis_RMS_Velocity_mm");
                realTimeVibrationSensorChartDataVO.getZRMSVelocityArr().add("Z_Axis_RMS_Velocity_mm");

                realTimeVibrationSensorChartDataVO.getXPeakAccelerationArr().add("X_Axis_Peak_Acceleration");
                realTimeVibrationSensorChartDataVO.getZPeakAccelerationArr().add("Z_Axis_Peak_Acceleration");
                realTimeVibrationSensorChartDataVO.getTemperatureCArr().add("Temperature_C");
                realTimeVibrationSensorChartDataVO.getXPeakVelocityArr().add("X_Axis_Peak_Velocity_mm");
                realTimeVibrationSensorChartDataVO.getZPeakVelocityArr().add("Z_Axis_Peak_Velocity_mm");
                realTimeVibrationSensorChartDataVO.getXRMSAccelerationArr().add("X_Axis_RMS_Acceleration");
                realTimeVibrationSensorChartDataVO.getZRMSAccelerationArr().add("Z_Axis_RMS_Acceleration");
                realTimeVibrationSensorChartDataVO.getXCrestFactorArr().add("X_Axis_Crest_Factor");
                realTimeVibrationSensorChartDataVO.getZCrestFactorArr().add("Z_Axis_Crest_Factor");
                realTimeVibrationSensorChartDataVO.getXHighFrequencyRmsAccelerationArr().add("X_Axis_High_Frequency_RMS_Acceleration");
                realTimeVibrationSensorChartDataVO.getZHighFrequencyRmsAccelerationArr().add("Z_Axis_High_Frequency_RMS_Acceleration");
                realTimeVibrationSensorChartDataVO.getXPeakVelocityComponentFrequencyArr().add("X_Axis_Peak_Velocity_Component_Frequency");
                realTimeVibrationSensorChartDataVO.getZPeakVelocityComponentFrequencyArr().add("Z_Axis_Peak_Velocity_Component_Frequency");
                realTimeVibrationSensorChartDataVO.getXKurtosisArr().add("X_Axis_Kurtosis");
                realTimeVibrationSensorChartDataVO.getZKurtosisArr().add("Z_Axis_Kurtosis");

                reportVibrationSensorChartDataVOList.add(realTimeVibrationSensorChartDataVO);
            }

            for(int i = 0; i < reportVibrationSensorChartDataVOList.size(); i++) {
                String realTimeVibrationSensorChartSensorCode = reportVibrationSensorChartDataVOList.get(i).getSensorCode();

                for(int j = 0; j < vibrationSensorReportDataList.size(); j++) {
                    String vibrationSensorLowSensorCode = vibrationSensorReportDataList.get(j).getSensorCode();

                    if(realTimeVibrationSensorChartSensorCode.equals(vibrationSensorLowSensorCode)) {
                        List<RealtimeAlarmMasterVO> alarmMasterVOList = new ArrayList<RealtimeAlarmMasterVO>();
                        AlarmMasterVO alarmMasterVO = new AlarmMasterVO();

                        alarmMasterVO.setSensorCode(vibrationSensorLowSensorCode);

                        alarmMasterVOList = alarmManagementDAO.selectRealtimeAlarmMasterList(alarmMasterVO);

                        Date oTime = vibrationSensorReportDataList.get(j).getOTime();
                        String xRMSVelocity = String.valueOf(vibrationSensorReportDataList.get(j).getXAxisRmsVelocityMmValue());
                        String zRMSVelocity = String.valueOf(vibrationSensorReportDataList.get(j).getZAxisRmsVelocityMmValue());

                        reportVibrationSensorChartDataVOList.get(i).getOTimeArr().add(oTime);
                        reportVibrationSensorChartDataVOList.get(i).getXRMSVelocityArr().add(xRMSVelocity);
                        reportVibrationSensorChartDataVOList.get(i).getZRMSVelocityArr().add(zRMSVelocity);

                        if(sensorCode != null) {
                            String xPeakAccelerationArr = String.valueOf(vibrationSensorReportDataList.get(j).getXAxisPeakAccelerationValue());
                            String zPeakAccelerationArr = String.valueOf(vibrationSensorReportDataList.get(j).getZAxisPeakAccelerationValue());
                            String temperatureCArr = String.valueOf(vibrationSensorReportDataList.get(j).getTemperatureCValue());
                            String xPeakVelocityArr = String.valueOf(vibrationSensorReportDataList.get(j).getXAxisPeakVelocityMmValue());
                            String zPeakVelocityArr = String.valueOf(vibrationSensorReportDataList.get(j).getZAxisPeakVelocityMmValue());
                            String xRMSAccelerationArr = String.valueOf(vibrationSensorReportDataList.get(j).getXAxisRmsAccelerationValue());
                            String zRMSAccelerationArr = String.valueOf(vibrationSensorReportDataList.get(j).getZAxisRmsAccelerationValue());
                            String xCrestFactorArr = String.valueOf(vibrationSensorReportDataList.get(j).getXAxisCrestFactorValue());
                            String zCrestFactorArr = String.valueOf(vibrationSensorReportDataList.get(j).getZAxisCrestFactorValue());
                            String xHighFrequencyRmsAccelerationArr = String.valueOf(vibrationSensorReportDataList.get(j).getXAxisHighFrequencyRmsAccelerationValue());
                            String zHighFrequencyRmsAccelerationArr = String.valueOf(vibrationSensorReportDataList.get(j).getZAxisHighFrequencyRmsAccelerationValue());
                            String xPeakVelocityComponentFrequencyArr = String.valueOf(vibrationSensorReportDataList.get(j).getXAxisPeakVelocityComponentFrequencyValue());
                            String zPeakVelocityComponentFrequencyArr = String.valueOf(vibrationSensorReportDataList.get(j).getZAxisPeakVelocityComponentFrequencyValue());
                            String xKurtosisArr = String.valueOf(vibrationSensorReportDataList.get(j).getXAxisKurtosisValue());
                            String zKurtosisArr = String.valueOf(vibrationSensorReportDataList.get(j).getZAxisKurtosisValue());

                            reportVibrationSensorChartDataVOList.get(i).getXPeakAccelerationArr().add(xPeakAccelerationArr);
                            reportVibrationSensorChartDataVOList.get(i).getZPeakAccelerationArr().add(zPeakAccelerationArr);
                            reportVibrationSensorChartDataVOList.get(i).getTemperatureCArr().add(temperatureCArr);
                            reportVibrationSensorChartDataVOList.get(i).getXPeakVelocityArr().add(xPeakVelocityArr);
                            reportVibrationSensorChartDataVOList.get(i).getZPeakVelocityArr().add(zPeakVelocityArr);
                            reportVibrationSensorChartDataVOList.get(i).getXRMSAccelerationArr().add(xRMSAccelerationArr);
                            reportVibrationSensorChartDataVOList.get(i).getZRMSAccelerationArr().add(zRMSAccelerationArr);
                            reportVibrationSensorChartDataVOList.get(i).getXCrestFactorArr().add(xCrestFactorArr);
                            reportVibrationSensorChartDataVOList.get(i).getZCrestFactorArr().add(zCrestFactorArr);
                            reportVibrationSensorChartDataVOList.get(i).getXHighFrequencyRmsAccelerationArr().add(xHighFrequencyRmsAccelerationArr);
                            reportVibrationSensorChartDataVOList.get(i).getZHighFrequencyRmsAccelerationArr().add(zHighFrequencyRmsAccelerationArr);
                            reportVibrationSensorChartDataVOList.get(i).getXPeakVelocityComponentFrequencyArr().add(xPeakVelocityComponentFrequencyArr);
                            reportVibrationSensorChartDataVOList.get(i).getZPeakVelocityComponentFrequencyArr().add(zPeakVelocityComponentFrequencyArr);
                            reportVibrationSensorChartDataVOList.get(i).getXKurtosisArr().add(xKurtosisArr);
                            reportVibrationSensorChartDataVOList.get(i).getZKurtosisArr().add(zKurtosisArr);
                        }

                        for(int k = 0; k < alarmMasterVOList.size(); k++) {
                            if(alarmMasterVOList.get(k).getTagName().equals("X_Axis_RMS_Velocity_mm")) {
                                reportVibrationSensorChartDataVOList.get(i).setX_axis_rms_velocity_mm_warning(Float.parseFloat(alarmMasterVOList.get(k).getWarningValue()));
                                reportVibrationSensorChartDataVOList.get(i).setX_axis_rms_velocity_mm_alarm(Float.parseFloat(alarmMasterVOList.get(k).getAlarmValue()));
                            } else if(alarmMasterVOList.get(k).getTagName().equals("Z_Axis_RMS_Velocity_mm")) {
                                reportVibrationSensorChartDataVOList.get(i).setZ_axis_rms_velocity_mm_warning(Float.parseFloat(alarmMasterVOList.get(k).getWarningValue()));
                                reportVibrationSensorChartDataVOList.get(i).setZ_axis_rms_velocity_mm_alarm(Float.parseFloat(alarmMasterVOList.get(k).getAlarmValue()));
                            } else if(alarmMasterVOList.get(k).getTagName().equals("X_Axis_Peak_Acceleration")) {
                                reportVibrationSensorChartDataVOList.get(i).setX_axis_peak_acceleration_warning(Float.parseFloat(alarmMasterVOList.get(k).getWarningValue()));
                                reportVibrationSensorChartDataVOList.get(i).setX_axis_peak_acceleration_alarm(Float.parseFloat(alarmMasterVOList.get(k).getAlarmValue()));
                            } else if(alarmMasterVOList.get(k).getTagName().equals("Z_Axis_Peak_Acceleration")) {
                                reportVibrationSensorChartDataVOList.get(i).setZ_axis_peak_acceleration_warning(Float.parseFloat(alarmMasterVOList.get(k).getWarningValue()));
                                reportVibrationSensorChartDataVOList.get(i).setZ_axis_peak_acceleration_alarm(Float.parseFloat(alarmMasterVOList.get(k).getAlarmValue()));
                            } else if(alarmMasterVOList.get(k).getTagName().equals("Temperature_C")) {
                                reportVibrationSensorChartDataVOList.get(i).setTemperature_c_warning(Float.parseFloat(alarmMasterVOList.get(k).getWarningValue()));
                                reportVibrationSensorChartDataVOList.get(i).setTemperature_c_alarm(Float.parseFloat(alarmMasterVOList.get(k).getAlarmValue()));
                            }
                        }
                    }
                }
            }

            mv.addObject("reportVibrationSensorChartDataVOList", ConvertUtil.ArrayToString(reportVibrationSensorChartDataVOList));
        } catch (Exception e) {
            e.printStackTrace();

            resultStatus = "3";
            resultMessage = "[ERR_MSI_SVSRDL_0002]<br>기간 별 태그 이력 조회에 실패하였습니다.<br>관리자에게 문의하세요.";

            mv.addObject("resultStatus", resultStatus);
            mv.addObject("resultMessage", resultMessage);

            return mv;
        }
        mv.addObject("resultStatus", resultStatus);
        mv.addObject("resultMessage", resultMessage);

        return mv;
    }

    @Override
    public int selectVibrationSensorLowDataCount() {
        int lowDataCount = 0;

        try {
            lowDataCount = mainDAO.selectVibrationSensorLowDataCount();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return lowDataCount;
    }

    @Override
    public ModelAndView selectSystemSetting(CommonCommandMap commonCommandMap) {
        ModelAndView mv = new ModelAndView("jsonView");

        String resultStatus = null;
        String resultMessage = null;

        try {
            long threadDelay = 0L;
            long threadDelayCount = 0L;

            TagLowDataThreadDelayVO tagLowDataThreadDelayVO = new TagLowDataThreadDelayVO();

            tagLowDataThreadDelayVO = mainDAO.selectTagLowDataThreadDelay();

            threadDelay = tagLowDataThreadDelayVO.getTimerDelay();
            threadDelayCount = tagLowDataThreadDelayVO.getDataCount();

            mv.addObject("threadDelay", threadDelay);

            if(threadDelayCount == 0) {
                mainDAO.insertDefaultThreadDelay();
            }
        } catch (Exception e) {
            e.printStackTrace();

            resultStatus = "3";
            resultMessage = "[ERR_MSI_SSS_0001]<br>시스템 설정 조회에 실패하였습니다.<br>관리자에게 문의하세요.";

            mv.addObject("resultStatus", resultStatus);
            mv.addObject("resultMessage", resultMessage);

            return mv;
        }

        try {
            ServerSettingVO systemSettingVO = new ServerSettingVO();

            systemSettingVO = mainDAO.selectSystemSetting();

            int systemSettingDataCount = systemSettingVO.getDataCount();

            mv.addObject("mainChartQty", systemSettingVO.getMainChartQty());
            mv.addObject("detailChartQty", systemSettingVO.getDetailChartQty());
            mv.addObject("reportChartQty", systemSettingVO.getReportChartQty());

            if(systemSettingDataCount == 0) {
                mainDAO.insertDefaultSystemSetting();
            }

            resultStatus = "1";
            resultMessage = "시스템 설정 조회를 완료하였습니다.";
        } catch (Exception e) {
            e.printStackTrace();

            resultStatus = "3";
            resultMessage = "[ERR_MSI_SSS_0002]<br>시스템 설정 조회에 실패하였습니다.<br>관리자에게 문의하세요.";

            mv.addObject("resultStatus", resultStatus);
            mv.addObject("resultMessage", resultMessage);

            return mv;
        }

        mv.addObject("resultStatus", resultStatus);
        mv.addObject("resultMessage", resultMessage);

        return mv;
    }

    @Override
    public ModelAndView updateSystemSetting(CommonCommandMap commonCommandMap) {
        ModelAndView mv = new ModelAndView("jsonView");

        String resultStatus = null;
        String resultMessage = null;

        long threadDelay = 0L;
        int mainChartQty = 0;
        int detailChartQty = 0;
        int reportChartQty = 0;

        Map<String, String> selectSensorCountMap = new HashMap<>();

        threadDelay = Long.parseLong((String) commonCommandMap.getMap().get("threadDelay"));
        mainChartQty = Integer.parseInt((String) commonCommandMap.getMap().get("mainChartQty"));
        detailChartQty = Integer.parseInt((String) commonCommandMap.getMap().get("detailChartQty"));
        reportChartQty = Integer.parseInt((String) commonCommandMap.getMap().get("reportChartQty"));

        try {
            mainDAO.updateTagLowDataThreadDelay(threadDelay);
        } catch (Exception e) {
            e.printStackTrace();

            resultStatus = "3";
            resultMessage = "[ERR_MSI_USS_0001]<br>시스템 설정 변경에 실패하였습니다.<br>관리자에게 문의하세요.";

            mv.addObject("resultStatus", resultStatus);
            mv.addObject("resultMessage", resultMessage);

            return mv;
        }

        try {
            Map<String, Integer> systemSettingMap = new HashMap<>();

            systemSettingMap.put("mainChartQty", mainChartQty);
            systemSettingMap.put("detailChartQty", detailChartQty);
            systemSettingMap.put("reportChartQty", reportChartQty);

            mainDAO.updateDefaultSystemSetting(systemSettingMap);

            resultStatus = "1";
            resultMessage = "시스템 설정 변경을 완료하였습니다.";
        } catch (Exception e) {
            e.printStackTrace();

            resultStatus = "3";
            resultMessage = "[ERR_MSI_USS_0002]<br>시스템 설정 변경에 실패하였습니다.<br>관리자에게 문의하세요.";

            mv.addObject("resultStatus", resultStatus);
            mv.addObject("resultMessage", resultMessage);

            return mv;
        }

        mv.addObject("resultStatus", resultStatus);
        mv.addObject("resultMessage", resultMessage);

        return mv;
    }

    @Override
    public void deleteVibrationSensorLowDataHotListAll() {
        mainDAO.deleteVibrationSensorLowDataHotListAll();
    }
}

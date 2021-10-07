package com.ssm.edge.turck.admin.sensorManagement.service;

import com.ssm.edge.core.map.CommonCommandMap;
import org.springframework.web.servlet.ModelAndView;

public interface SensorManagementService {
    // 센서 마스터 리스트 조회
    ModelAndView selectSensorMasterList(CommonCommandMap commonCommandMap);
    // 센서 마스터 수정
    ModelAndView updateSensorMasterInfo(CommonCommandMap commonCommandMap);
    // 센서 목록 삭제
    ModelAndView deleteSensorMasterList(CommonCommandMap commonCommandMap);
}
package com.ssm.edge.turck.admin.alarmManagement.service;

import com.ssm.edge.core.map.CommonCommandMap;
import org.springframework.web.servlet.ModelAndView;

import java.util.Map;

public interface AlarmManagementService {
    // 알람 마스터 리스트 조회
    ModelAndView selectAlarmMasterList(CommonCommandMap commonCommandMap);
    // 알람 마스터 수정
    ModelAndView updateAlarmMasterInfo(CommonCommandMap commonCommandMap);
    // 알람 마스터 목록 수정
    ModelAndView updateAlarmMasterList(CommonCommandMap commonCommandMap);
    // 알람 목록 확인
    ModelAndView confirmAlarmList(CommonCommandMap commonCommandMap);
    // 알람 이력 조회
    ModelAndView selectAlarmHistoryList(CommonCommandMap commonCommandMap);
    // 알람 센서 카운트 조회
    ModelAndView selectAlarmSensorCount();
}

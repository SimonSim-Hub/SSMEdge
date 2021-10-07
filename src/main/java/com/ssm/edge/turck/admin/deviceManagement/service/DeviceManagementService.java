package com.ssm.edge.turck.admin.deviceManagement.service;

import com.ssm.edge.core.map.CommonCommandMap;
import org.springframework.web.servlet.ModelAndView;

public interface DeviceManagementService {
    // 디바이스 마스터 리스트 조회
    ModelAndView selectDeviceMasterList(CommonCommandMap commonCommandMap);
    // 디바이스 마스터 수정
    ModelAndView updateDeviceMasterInfo(CommonCommandMap commonCommandMap);
    // 디바이스 목록 삭제
    ModelAndView deleteDeviceMasterList(CommonCommandMap commonCommandMap);
}
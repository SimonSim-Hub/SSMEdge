package com.ssm.edge.turck.admin.locationManagement.service;

import com.ssm.edge.core.map.CommonCommandMap;
import org.springframework.web.servlet.ModelAndView;

public interface LocationManagementService {
    // 로케이션 마스터 리스트 조회
    ModelAndView selectLocationMasterList(CommonCommandMap commonCommandMap);
    // 로케이션 마스터 등록
    ModelAndView insertLocationMasterInfo(CommonCommandMap commonCommandMap);
    // 로케이션 마스터 수정
    ModelAndView updateLocationMasterInfo(CommonCommandMap commonCommandMap);
    // 로케이션 마스터 목록 삭제
    ModelAndView deleteLocationMasterList(CommonCommandMap commonCommandMap);
}

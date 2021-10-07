package com.ssm.edge.core.system.userManagement.service;

import com.ssm.edge.core.map.CommonCommandMap;
import org.springframework.web.servlet.ModelAndView;

public interface UserManagementService {
    // 사용자 마스터 리스트 조회
    ModelAndView selectUserMasterList(CommonCommandMap commonCommandMap);
    // 사용자 정보 등록
    ModelAndView insertUserMasterInfo(CommonCommandMap commonCommandMap);
    // 사용자 정보 변경
    ModelAndView updateUserMasterInfo(CommonCommandMap commonCommandMap);
    // 사용자 정보 삭제
    ModelAndView deleteUserMasterInfo(CommonCommandMap commonCommandMap);
}

package com.ssm.edge.turck.admin.tagManagement.service;

import com.ssm.edge.core.map.CommonCommandMap;
import org.springframework.security.core.Authentication;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

public interface TagManagementService {
    // 태그 마스터 목록 조회
    ModelAndView selectTagMasterList(CommonCommandMap commonCommandMap);
    // 태그 목록 엑셀 업로드
    ModelAndView tagMasterListExcelUpload(Authentication authentication, MultipartHttpServletRequest multipartHttpServletRequest);
    // 태그 정보 등록
    ModelAndView insertTagMasterInfo(CommonCommandMap commonCommandMap);
    // 태그 정보 수정
    ModelAndView updateTagMasterInfo(CommonCommandMap commonCommandMap);
    // 태그 정보 삭제
    ModelAndView deleteTagMasterList(CommonCommandMap commonCommandMap);
}

package com.ssm.edge.turck.admin.tagManagement.controller;

import com.ssm.edge.core.map.CommonCommandMap;
import com.ssm.edge.turck.admin.tagManagement.service.TagManagementService;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

/**
 * 태그 관리 컨트롤러
 */
@Controller
public class TagManagementController {
    @Resource(name="tagManagementService")
    private TagManagementService tagManagementService;

    /**
     *	FUNCTION 	: selectPage
     *	NOTE 		: select 화면 호출
     *	INPUT 		: null
     *	OUTPUT 		: null
     **/
    @RequestMapping(value = "/turck/admin/tagManagement/selectPage")
    public ModelAndView selectPage(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView();

        mv.setViewName("turck/admin/tagManagement/selectPage");

        return mv;
    }

    /**
     *	FUNCTION 	: insertPage
     *	NOTE 		: insert 화면 호출
     *	INPUT 		: null
     *	OUTPUT 		: null
     **/
    @RequestMapping(value = "/turck/admin/tagManagement/insertPage")
    public ModelAndView insertPage(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView();

        mv.setViewName("turck/admin/tagManagement/insertPage");

        return mv;
    }

    /**
     *	FUNCTION 	: updatePage
     *	NOTE 		: update 화면 호출
     *	INPUT 		: null
     *	OUTPUT 		: null
     **/
    @RequestMapping(value = "/turck/admin/tagManagement/updatePage")
    public ModelAndView updatePage(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView();

        mv.setViewName("turck/admin/tagManagement/updatePage");

        return mv;
    }

    /**
     *	FUNCTION 	: deletePage
     *	NOTE 		: delete 화면 호출
     *	INPUT 		: null
     *	OUTPUT 		: null
     **/
    @RequestMapping(value = "/turck/admin/tagManagement/deletePage")
    public ModelAndView deletePage(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView();

        mv.setViewName("turck/admin/tagManagement/deletePage");

        return mv;
    }

    /**
     *	FUNCTION 	: selectTagMasterList
     *	NOTE 		: 태그 마스터 리스트 조회
     *	INPUT 		: commonMap
     *	OUTPUT 		: tagMasterList
     **/
    @PostMapping("/turck/admin/tagManagement/selectTagMasterList")
    public ModelAndView selectTagMasterList(CommonCommandMap commonCommandMap) {
        ModelAndView mv = new ModelAndView();

        mv = tagManagementService.selectTagMasterList(commonCommandMap);

        return mv;
    }

    /**
     *	FUNCTION 	: tagMasterListExcelUpload
     *	NOTE 		: 태그 목록 엑셀 업로드
     *	INPUT 		: tagMasterListExcelUploadExcel
     *	OUTPUT 		: null
     **/
    @PostMapping("/turck/admin/tagManagement/tagMasterListExcelUpload")
    public ModelAndView tagMasterListExcelUpload(Model model, Authentication authentication, MultipartHttpServletRequest multipartHttpServletRequest) {
        ModelAndView mv = new ModelAndView();

        mv = tagManagementService.tagMasterListExcelUpload(authentication, multipartHttpServletRequest);

        return mv;
    }

    /**
     *	FUNCTION 	: insertTagMasterInfo
     *	NOTE 		: 태그 정보 등록
     *	INPUT 		: commonMap
     *	OUTPUT 		: null
     **/
    @PostMapping("/turck/admin/tagManagement/insertTagMasterInfo")
    public ModelAndView insertTagMasterInfo(CommonCommandMap commonCommandMap) {
        ModelAndView mv = new ModelAndView();

        mv = tagManagementService.insertTagMasterInfo(commonCommandMap);

        return mv;
    }

    /**
     *	FUNCTION 	: updateTagMasterInfo
     *	NOTE 		: 태그 정보 수정
     *	INPUT 		: commonMap
     *	OUTPUT 		: null
     **/
    @PostMapping("/turck/admin/tagManagement/updateTagMasterInfo")
    public ModelAndView updateTagMasterInfo(CommonCommandMap commonCommandMap) {
        ModelAndView mv = new ModelAndView();

        mv = tagManagementService.updateTagMasterInfo(commonCommandMap);

        return mv;
    }

    /**
     *	FUNCTION 	: deleteTagMasterList
     *	NOTE 		: 태그 정보 삭제
     *	INPUT 		: commonMap
     *	OUTPUT 		: null
     **/
    @PostMapping("/turck/admin/tagManagement/deleteTagMasterList")
    public ModelAndView deleteTagMasterList(CommonCommandMap commonCommandMap) {
        ModelAndView mv = new ModelAndView();

        mv = tagManagementService.deleteTagMasterList(commonCommandMap);

        return mv;
    }
}

package com.ssm.edge.turck.admin.locationManagement.controller;

import com.ssm.edge.core.map.CommonCommandMap;
import com.ssm.edge.turck.admin.locationManagement.service.LocationManagementService;
import com.ssm.edge.turck.admin.tagManagement.service.TagManagementService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

/**
 * 로케이션 관리 컨트롤러
 */
@Controller
public class LocationManagementController {
    @Resource(name="locationManagementService")
    private LocationManagementService locationManagementService;

    /**
     *	FUNCTION 	: selectPage
     *	NOTE 		: select 화면 호출
     *	INPUT 		: null
     *	OUTPUT 		: null
     **/
    @RequestMapping(value = "/turck/admin/locationManagement/selectPage")
    public ModelAndView selectPage(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView();

        mv.setViewName("turck/admin/locationManagement/selectPage");

        return mv;
    }

    /**
     *	FUNCTION 	: insertPage
     *	NOTE 		: insert 화면 호출
     *	INPUT 		: null
     *	OUTPUT 		: null
     **/
    @RequestMapping(value = "/turck/admin/locationManagement/insertPage")
    public ModelAndView insertPage(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView();

        mv.setViewName("turck/admin/locationManagement/insertPage");

        return mv;
    }

    /**
     *	FUNCTION 	: updatePage
     *	NOTE 		: update 화면 호출
     *	INPUT 		: null
     *	OUTPUT 		: null
     **/
    @RequestMapping(value = "/turck/admin/locationManagement/updatePage")
    public ModelAndView updatePage(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView();

        mv.setViewName("turck/admin/locationManagement/updatePage");

        return mv;
    }

    /**
     *	FUNCTION 	: deletePage
     *	NOTE 		: delete 화면 호출
     *	INPUT 		: null
     *	OUTPUT 		: null
     **/
    @RequestMapping(value = "/turck/admin/locationManagement/deletePage")
    public ModelAndView deletePage(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView();

        mv.setViewName("turck/admin/locationManagement/deletePage");

        return mv;
    }

    /**
     *	FUNCTION 	: selectLocationMasterList
     *	NOTE 		: 로케이션 마스터 리스트 조회
     *	INPUT 		: commonMap
     *	OUTPUT 		: locationMasterList
     **/
    @PostMapping("/turck/admin/locationManagement/selectLocationMasterList")
    public ModelAndView selectLocationMasterList(CommonCommandMap commonCommandMap) {
        ModelAndView mv = new ModelAndView();

        mv = locationManagementService.selectLocationMasterList(commonCommandMap);

        return mv;
    }

    /**
     *	FUNCTION 	: insertLocationMasterInfo
     *	NOTE 		: 로케이션 마스터 등록
     *	INPUT 		: commonMap
     *	OUTPUT 		: null
     **/
    @PostMapping("/turck/admin/locationManagement/insertLocationMasterInfo")
    public ModelAndView insertLocationMasterInfo(CommonCommandMap commonCommandMap) {
        ModelAndView mv = new ModelAndView();

        mv = locationManagementService.insertLocationMasterInfo(commonCommandMap);

        return mv;
    }

    /**
     *	FUNCTION 	: updateLocationMasterInfo
     *	NOTE 		: 로케이션 마스터 수정
     *	INPUT 		: commonMap
     *	OUTPUT 		: null
     **/
    @PostMapping("/turck/admin/locationManagement/updateLocationMasterInfo")
    public ModelAndView updateLocationMasterInfo(CommonCommandMap commonCommandMap) {
        ModelAndView mv = new ModelAndView();

        mv = locationManagementService.updateLocationMasterInfo(commonCommandMap);

        return mv;
    }

    /**
     *	FUNCTION 	: deleteLocationMasterList
     *	NOTE 		: 로케이션 마스터 목록 삭제
     *	INPUT 		: commonMap
     *	OUTPUT 		: null
     **/
    @PostMapping("/turck/admin/locationManagement/deleteLocationMasterList")
    public ModelAndView deleteLocationMasterList(CommonCommandMap commonCommandMap) {
        ModelAndView mv = new ModelAndView();

        mv = locationManagementService.deleteLocationMasterList(commonCommandMap);

        return mv;
    }
}

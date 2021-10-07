package com.ssm.edge.turck.admin.deviceManagement.controller;

import com.ssm.edge.core.map.CommonCommandMap;
import com.ssm.edge.turck.admin.deviceManagement.service.DeviceManagementService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

/**
 * 디바이스 관리 컨트롤러
 */
@Controller
public class DeviceManagementController {
    @Resource(name="deviceManagementService")
    private DeviceManagementService deviceManagementService;

    /**
     *	FUNCTION 	: selectPage
     *	NOTE 		: select 화면 호출
     *	INPUT 		: null
     *	OUTPUT 		: null
     **/
    @RequestMapping(value = "/turck/admin/deviceManagement/selectPage")
    public ModelAndView selectPage(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView();

        mv.setViewName("turck/admin/deviceManagement/selectPage");

        return mv;
    }

    /**
     *	FUNCTION 	: updatePage
     *	NOTE 		: update 화면 호출
     *	INPUT 		: null
     *	OUTPUT 		: null
     **/
    @RequestMapping(value = "/turck/admin/deviceManagement/updatePage")
    public ModelAndView updatePage(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView();

        mv.setViewName("turck/admin/deviceManagement/updatePage");

        return mv;
    }

    /**
     *	FUNCTION 	: deletePage
     *	NOTE 		: delete 화면 호출
     *	INPUT 		: null
     *	OUTPUT 		: null
     **/
    @RequestMapping(value = "/turck/admin/deviceManagement/deletePage")
    public ModelAndView deletePage(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView();

        mv.setViewName("turck/admin/deviceManagement/deletePage");

        return mv;
    }

    /**
     *	FUNCTION 	: selectDeviceMasterList
     *	NOTE 		: 디바이스 마스터 리스트 조회
     *	INPUT 		: commonMap
     *	OUTPUT 		: deviceMasterList
     **/
    @PostMapping("/turck/admin/deviceManagement/selectDeviceMasterList")
    public ModelAndView selectDeviceMasterList(CommonCommandMap commonCommandMap) {
        ModelAndView mv = new ModelAndView();

        mv = deviceManagementService.selectDeviceMasterList(commonCommandMap);

        return mv;
    }


    /**
     *	FUNCTION 	: updateDeviceMasterInfo
     *	NOTE 		: 디바이스 마스터 수정
     *	INPUT 		: commonMap
     *	OUTPUT 		: null
     **/
    @PostMapping("/turck/admin/deviceManagement/updateDeviceMasterInfo")
    public ModelAndView updateDeviceMasterInfo(CommonCommandMap commonCommandMap) {
        ModelAndView mv = new ModelAndView();

        mv = deviceManagementService.updateDeviceMasterInfo(commonCommandMap);

        return mv;
    }
    
    /**
     *	FUNCTION 	: deleteDeviceMasterList
     *	NOTE 		: 디바이스 목록 삭제
     *	INPUT 		: commonMap
     *	OUTPUT 		: null
     **/
    @PostMapping("/turck/admin/deviceManagement/deleteDeviceMasterList")
    public ModelAndView deleteDeviceMasterList(CommonCommandMap commonCommandMap) {
        ModelAndView mv = new ModelAndView();

        mv = deviceManagementService.deleteDeviceMasterList(commonCommandMap);

        return mv;
    }
}

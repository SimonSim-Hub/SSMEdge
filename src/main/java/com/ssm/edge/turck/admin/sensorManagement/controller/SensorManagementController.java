package com.ssm.edge.turck.admin.sensorManagement.controller;

import com.ssm.edge.core.map.CommonCommandMap;
import com.ssm.edge.turck.admin.sensorManagement.service.SensorManagementService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

/**
 * 센서 관리 컨트롤러
 */
@Controller
public class SensorManagementController {
    @Resource(name="sensorManagementService")
    private SensorManagementService sensorManagementService;

    /**
     *	FUNCTION 	: selectPage
     *	NOTE 		: select 화면 호출
     *	INPUT 		: null
     *	OUTPUT 		: null
     **/
    @RequestMapping(value = "/turck/admin/sensorManagement/selectPage")
    public ModelAndView selectPage(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView();

        mv.setViewName("turck/admin/sensorManagement/selectPage");

        return mv;
    }

    /**
     *	FUNCTION 	: updatePage
     *	NOTE 		: update 화면 호출
     *	INPUT 		: null
     *	OUTPUT 		: null
     **/
    @RequestMapping(value = "/turck/admin/sensorManagement/updatePage")
    public ModelAndView updatePage(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView();

        mv.setViewName("turck/admin/sensorManagement/updatePage");

        return mv;
    }

    /**
     *	FUNCTION 	: deletePage
     *	NOTE 		: delete 화면 호출
     *	INPUT 		: null
     *	OUTPUT 		: null
     **/
    @RequestMapping(value = "/turck/admin/sensorManagement/deletePage")
    public ModelAndView deletePage(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView();

        mv.setViewName("turck/admin/sensorManagement/deletePage");

        return mv;
    }

    /**
     *	FUNCTION 	: selectSensorMasterList
     *	NOTE 		: 센서 마스터 리스트 조회
     *	INPUT 		: commonMap
     *	OUTPUT 		: sensorMasterList
     **/
    @PostMapping("/turck/admin/sensorManagement/selectSensorMasterList")
    public ModelAndView selectSensorMasterList(CommonCommandMap commonCommandMap) {
        ModelAndView mv = new ModelAndView();

        mv = sensorManagementService.selectSensorMasterList(commonCommandMap);

        return mv;
    }


    /**
     *	FUNCTION 	: updateSensorMasterInfo
     *	NOTE 		: 센서 마스터 수정
     *	INPUT 		: commonMap
     *	OUTPUT 		: null
     **/
    @PostMapping("/turck/admin/sensorManagement/updateSensorMasterInfo")
    public ModelAndView updateSensorMasterInfo(CommonCommandMap commonCommandMap) {
        ModelAndView mv = new ModelAndView();

        mv = sensorManagementService.updateSensorMasterInfo(commonCommandMap);

        return mv;
    }

    /**
     *	FUNCTION 	: deleteSensorMasterList
     *	NOTE 		: 센서 목록 삭제
     *	INPUT 		: commonMap
     *	OUTPUT 		: null
     **/
    @PostMapping("/turck/admin/sensorManagement/deleteSensorMasterList")
    public ModelAndView deleteSensorMasterList(CommonCommandMap commonCommandMap) {
        ModelAndView mv = new ModelAndView();

        mv = sensorManagementService.deleteSensorMasterList(commonCommandMap);

        return mv;
    }
}

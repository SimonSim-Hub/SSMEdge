package com.ssm.edge.turck.admin.alarmManagement.controller;

import com.ssm.edge.core.map.CommonCommandMap;
import com.ssm.edge.turck.admin.alarmManagement.service.AlarmManagementService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

/**
 * 알람 관리 컨트롤러
 */
@Controller
public class AlarmManagementController {
    @Resource(name="alarmManagementService")
    private AlarmManagementService alarmManagementService;

    /**
     *	FUNCTION 	: selectPage
     *	NOTE 		: select 화면 호출
     *	INPUT 		: null
     *	OUTPUT 		: null
     **/
    @RequestMapping(value = "/turck/admin/alarmManagement/selectPage")
    public ModelAndView selectPage(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView();

        mv.setViewName("turck/admin/alarmManagement/selectPage");

        return mv;
    }

    /**
     *	FUNCTION 	: updatePage
     *	NOTE 		: update 화면 호출
     *	INPUT 		: null
     *	OUTPUT 		: null
     **/
    @RequestMapping(value = "/turck/admin/alarmManagement/updatePage")
    public ModelAndView updatePage(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView();

        mv.setViewName("turck/admin/alarmManagement/updatePage");

        return mv;
    }

    /**
     *	FUNCTION 	: confirmPage
     *	NOTE 		: 알람 확인 화면 호출
     *	INPUT 		: null
     *	OUTPUT 		: null
     **/
    @RequestMapping(value = "/turck/admin/alarmManagement/confirmPage")
    public ModelAndView confirmPage(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView();

        mv.setViewName("turck/admin/alarmManagement/confirmPage");

        return mv;
    }

    /**
     *	FUNCTION 	: historyPage
     *	NOTE 		: 알람 이력 확인
     *	INPUT 		: commonMap
     *	OUTPUT 		: null
     **/
    @RequestMapping("/turck/admin/alarmManagement/historyPage")
    public ModelAndView historyPage(CommonCommandMap commonCommandMap) {
        ModelAndView mv = new ModelAndView();

        mv.addObject("locationCode", commonCommandMap.getMap().get("locationCode"));
        mv.addObject("deviceCode", commonCommandMap.getMap().get("deviceCode"));
        mv.addObject("sensorCode", commonCommandMap.getMap().get("sensorCode"));

        mv.setViewName("turck/admin/alarmManagement/historyPage");

        return mv;
    }

    /**
     *	FUNCTION 	: selectAlarmMasterList
     *	NOTE 		: 알람 마스터 리스트 조회
     *	INPUT 		: commonMap
     *	OUTPUT 		: alarmMasterList
     **/
    @PostMapping("/turck/admin/alarmManagement/selectAlarmMasterList")
    public ModelAndView selectAlarmMasterList(CommonCommandMap commonCommandMap) {
        ModelAndView mv = new ModelAndView();

        mv = alarmManagementService.selectAlarmMasterList(commonCommandMap);

        return mv;
    }

    /**
     *	FUNCTION 	: updateAlarmMasterInfo
     *	NOTE 		: 알람 마스터 수정
     *	INPUT 		: commonMap
     *	OUTPUT 		: null
     **/
    @PostMapping("/turck/admin/alarmManagement/updateAlarmMasterInfo")
    public ModelAndView updateAlarmMasterInfo(CommonCommandMap commonCommandMap) {
        ModelAndView mv = new ModelAndView();

        mv = alarmManagementService.updateAlarmMasterInfo(commonCommandMap);

        return mv;
    }

    /**
     *	FUNCTION 	: updateAlarmMasterList
     *	NOTE 		: 알람 마스터 목록 수정
     *	INPUT 		: commonMap
     *	OUTPUT 		: null
     **/
    @PostMapping("/turck/admin/alarmManagement/updateAlarmMasterList")
    public ModelAndView updateAlarmMasterList(CommonCommandMap commonCommandMap) {
        ModelAndView mv = new ModelAndView();

        mv = alarmManagementService.updateAlarmMasterList(commonCommandMap);

        return mv;
    }

    /**
     *	FUNCTION 	: confirmAlarmList
     *	NOTE 		: 알람 목록 확인
     *	INPUT 		: commonMap
     *	OUTPUT 		: null
     **/
    @PostMapping("/turck/admin/alarmManagement/confirmAlarmList")
    public ModelAndView confirmAlarmList(CommonCommandMap commonCommandMap) {
        ModelAndView mv = new ModelAndView();

        mv = alarmManagementService.confirmAlarmList(commonCommandMap);

        return mv;
    }

    /**
     *	FUNCTION 	: selectAlarmHistoryList
     *	NOTE 		: 알람 이력 조회
     *	INPUT 		: commonMap
     *	OUTPUT 		: alarmHistoryList
     **/
    @PostMapping("/turck/admin/alarmManagement/selectAlarmHistoryList")
    public ModelAndView selectAlarmHistoryList(CommonCommandMap commonCommandMap) {
        ModelAndView mv = new ModelAndView();

        mv = alarmManagementService.selectAlarmHistoryList(commonCommandMap);

        return mv;
    }

    /**
     *	FUNCTION 	: selectAlarmSensorCount
     *	NOTE 		: 알람 센서 카운트 조회
     *	INPUT 		: null
     *	OUTPUT 		: alarmSensorCount, warningSensorCount, threadDelay
     **/
    @PostMapping("/turck/admin/alarmManagement/selectAlarmSensorCount")
    public ModelAndView selectAlarmSensorCount() {
        ModelAndView mv = new ModelAndView();

        mv = alarmManagementService.selectAlarmSensorCount();

        return mv;
    }
}

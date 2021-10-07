package com.ssm.edge.core.main.controller;


import com.ssm.edge.core.main.service.MainService;
import com.ssm.edge.core.map.CommonCommandMap;
import com.ssm.edge.turck.admin.deviceManagement.service.DeviceManagementService;
import com.ssm.edge.turck.admin.locationManagement.service.LocationManagementService;
import com.ssm.edge.turck.admin.sensorManagement.service.SensorManagementService;
import com.ssm.edge.turck.admin.sensorManagement.vo.SensorMasterVO;
import com.ssm.edge.turck.admin.tagManagement.service.TagManagementService;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

/**
 * 메인 화면 컨트롤러
 */
@Controller
public class mainController {
    @Resource(name="mainService")
    private MainService mainService;

    @Resource(name="locationManagementService")
    private LocationManagementService locationManagementService;

    @Resource(name="deviceManagementService")
    private DeviceManagementService deviceManagementService;

    @Resource(name="sensorManagementService")
    private SensorManagementService sensorManagementService;

    @Resource(name="tagManagementService")
    private TagManagementService tagManagementService;

    /**
     *	FUNCTION 	: dashboardPage
     *	NOTE 		: 홈 화면 호출
     *	INPUT 		: null
     *	OUTPUT 		: null
     **/
    @RequestMapping(value = "/core/main/dashboardPage")
    public ModelAndView dashboardPage(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView();

        mv.setViewName("core/main/dashboardPage");

        return mv;
    }

    /**
     *	FUNCTION 	: detailPage
     *	NOTE 		: 상세 정보 화면 호출
     *	INPUT 		: commonCommandMap
     *	OUTPUT 		: locationCode, deviceCode, sensorCode
     **/
    @RequestMapping(value = "/core/main/detailPage")
    public ModelAndView detailPage(CommonCommandMap commonCommandMap) {
        ModelAndView mv = new ModelAndView();

        mv = mainService.selectMasterCode(commonCommandMap);

        mv.setViewName("core/main/detailPage");

        return mv;
    }

    /**
     *	FUNCTION 	: reportPage
     *	NOTE 		: 이력 조회 화면 호출
     *	INPUT 		: null
     *	OUTPUT 		: null
     **/
    @RequestMapping(value = "/core/main/reportPage")
    public ModelAndView reportPage(CommonCommandMap commonCommandMap) {
        ModelAndView mv = new ModelAndView();

        mv = mainService.selectMasterCode(commonCommandMap);

        mv.setViewName("core/main/reportPage");

        return mv;
    }

    /**
     *	FUNCTION 	: selectLocationMasterList
     *	NOTE 		: 로케이션 목록 데이터 조회
     *	INPUT 		: commonMap
     *	OUTPUT 		: locationMasterList
     **/
    @PostMapping("/core/main/selectLocationMasterList")
    public ModelAndView selectLocationMasterList(CommonCommandMap commonCommandMap) {
        ModelAndView mv = new ModelAndView();

        mv = locationManagementService.selectLocationMasterList(commonCommandMap);

        return mv;
    }

    /**
     *	FUNCTION 	: selectDeviceMasterList
     *	NOTE 		: 디바이스 목록 데이터 조회
     *	INPUT 		: commonMap
     *	OUTPUT 		: deviceMasterList
     **/
    @PostMapping("/core/main/selectDeviceMasterList")
    public ModelAndView selectDeviceMasterList(CommonCommandMap commonCommandMap) {
        ModelAndView mv = new ModelAndView();

        mv = deviceManagementService.selectDeviceMasterList(commonCommandMap);

        return mv;
    }

    /**
     *	FUNCTION 	: selectSensorMasterList
     *	NOTE 		: 센서 목록 데이터 조회
     *	INPUT 		: commonMap
     *	OUTPUT 		: sensorMasterList
     **/
    @PostMapping("/core/main/selectSensorMasterList")
    public ModelAndView selectSensorMasterList(CommonCommandMap commonCommandMap) {
        ModelAndView mv = new ModelAndView();

        mv = sensorManagementService.selectSensorMasterList(commonCommandMap);

        return mv;
    }

    /**
     *	FUNCTION 	: selectTagMasterList
     *	NOTE 		: 태그 목록 데이터 조회
     *	INPUT 		: commonMap
     *	OUTPUT 		: tagMasterList
     **/
    @PostMapping("/core/main/selectTagMasterList")
    public ModelAndView selectTagMasterList(CommonCommandMap commonCommandMap) {
        ModelAndView mv = new ModelAndView();

        mv = tagManagementService.selectTagMasterList(commonCommandMap);

        return mv;
    }

    /**
     *	FUNCTION 	: selectSensorMasterList
     *	NOTE 		: 센서 차트 데이터 조회
     *	INPUT 		: commonMap
     *	OUTPUT 		: sensorMasterList, sensorChartDataList
     **/
    @PostMapping("/core/main/dashboard/selectSensorMainChartData")
    public ModelAndView selectSensorMainChartData(CommonCommandMap commonCommandMap) {
        ModelAndView mv = new ModelAndView();

        mv = mainService.selectSensorMainChartData(commonCommandMap);

        return mv;
    }

    /**
     *	FUNCTION 	: selectVibrationSensorLowDataLastCountList
     *	NOTE 		: 센서 이력 이전 30분 조회
     *	INPUT 		: commonMap
     *	OUTPUT 		: tagLowDataHalfAnHourList
     **/
    @PostMapping("/core/main/dashboard/selectVibrationSensorLowDataLastCountList")
    public ModelAndView selectVibrationSensorLowDataLastCountList(CommonCommandMap commonCommandMap) {
        ModelAndView mv = new ModelAndView();

        mv = mainService.selectVibrationSensorLowDataLastCountList(commonCommandMap);

        return mv;
    }

    /**
     *	FUNCTION 	: selectVibrationSensorLowDataList
     *	NOTE 		: 센서 기간 별 리포트 데이터 조회
     *	INPUT 		: commonMap
     *	OUTPUT 		: tagLowDataHalfAnHourList
     **/
    @PostMapping("/core/main/dashboard/selectVibrationSensorReportDataList")
    public ModelAndView selectVibrationSensorReportDataList(CommonCommandMap commonCommandMap) {
        ModelAndView mv = new ModelAndView();

        mv = mainService.selectVibrationSensorReportDataList(commonCommandMap);

        return mv;
    }

    /**
     *	FUNCTION 	: selectThreadDelay
     *	NOTE 		: 스레드 딜레이 조회
     *	INPUT 		: commonMap
     *	OUTPUT 		: threadDelay
     **/
    @PostMapping("/core/main/dashboard/selectThreadDelay")
    public ModelAndView selectThreadDelay(CommonCommandMap commonCommandMap) {
        ModelAndView mv = new ModelAndView();

        mv = mainService.selectThreadDelay(commonCommandMap);

        return mv;
    }

    /**
     *	FUNCTION 	: selectSystemSetting
     *	NOTE 		: 시스템 설정 조회
     *	INPUT 		: commonMap
     *	OUTPUT 		: timerDelay, mainChartQty, detailChartQty, reportChartQyt
     **/
    @PostMapping("/core/main/dashboard/selectSystemSetting")
    public ModelAndView selectSystemSetting(CommonCommandMap commonCommandMap) {
        ModelAndView mv = new ModelAndView();

        mv = mainService.selectSystemSetting(commonCommandMap);

        return mv;
    }

    /**
     *	FUNCTION 	: updateSystemSetting
     *	NOTE 		: 시스템 설정 수정
     *	INPUT 		: commonMap
     *	OUTPUT 		: null
     **/
    @PostMapping("/core/main/dashboard/updateSystemSetting")
    public ModelAndView updateSystemSetting(CommonCommandMap commonCommandMap) {
        ModelAndView mv = new ModelAndView();

        mv = mainService.updateSystemSetting(commonCommandMap);

        return mv;
    }
}

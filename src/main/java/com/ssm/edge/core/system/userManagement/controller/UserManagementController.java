package com.ssm.edge.core.system.userManagement.controller;

import com.ssm.edge.core.system.userManagement.service.UserManagementService;
import com.ssm.edge.core.map.CommonCommandMap;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

/**
 * 사용자 관리 컨트롤러
 */
@Controller
public class UserManagementController {
    @Resource(name="userManagementService")
    private UserManagementService userManagementService;

    /**
     *	FUNCTION 	: selectPage
     *	NOTE 		: select 화면 호출
     *	INPUT 		: null
     *	OUTPUT 		: null
     **/
    @RequestMapping(value = "/core/system/userManagement/selectPage")
    public ModelAndView selectPage(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView();

        mv.setViewName("core/system/userManagement/selectPage");

        return mv;
    }

    /**
     *	FUNCTION 	: insertPage
     *	NOTE 		: insert 화면 호출
     *	INPUT 		: null
     *	OUTPUT 		: null
     **/
    @RequestMapping(value = "/core/system/userManagement/insertPage")
    public ModelAndView insertPage(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView();

        mv.setViewName("core/system/userManagement/insertPage");

        return mv;
    }

    /**
     *	FUNCTION 	: updatePage
     *	NOTE 		: update 화면 호출
     *	INPUT 		: null
     *	OUTPUT 		: null
     **/
    @RequestMapping(value = "/core/system/userManagement/updatePage")
    public ModelAndView updatePage(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView();

        mv.setViewName("core/system/userManagement/updatePage");

        return mv;
    }

    /**
     *	FUNCTION 	: deletePage
     *	NOTE 		: delete 화면 호출
     *	INPUT 		: null
     *	OUTPUT 		: null
     **/
    @RequestMapping(value = "/core/system/userManagement/deletePage")
    public ModelAndView deletePage(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView();

        mv.setViewName("core/system/userManagement/deletePage");

        return mv;
    }

    /**
     *	FUNCTION 	: selectUserMasterList
     *	NOTE 		: 사용자 마스터 리스트 조회
     *	INPUT 		: commonMap
     *	OUTPUT 		: userMasterList
     **/
    @PostMapping("/core/system/userManagement/selectUserMasterList")
    public ModelAndView selectUserMasterList(CommonCommandMap commonCommandMap) {
        ModelAndView mv = new ModelAndView();

        mv = userManagementService.selectUserMasterList(commonCommandMap);

        return mv;
    }

    /**
     *	FUNCTION 	: insertUserMasterInfo
     *	NOTE 		: 사용자 마스터 정보 등록
     *	INPUT 		: commonMap
     *	OUTPUT 		: null
     **/
    @PostMapping("/core/system/userManagement/insertUserMasterInfo")
    public ModelAndView insertUserMasterInfo(CommonCommandMap commonCommandMap) {
        ModelAndView mv = new ModelAndView();

        mv = userManagementService.insertUserMasterInfo(commonCommandMap);

        return mv;
    }
    
    /**
     *	FUNCTION 	: updateUserMasterInfo
     *	NOTE 		: 사용자 마스터 정보 변경
     *	INPUT 		: commonMap
     *	OUTPUT 		: null
     **/
    @PostMapping("/core/system/userManagement/updateUserMasterInfo")
    public ModelAndView updateUserMasterInfo(CommonCommandMap commonCommandMap) {
        ModelAndView mv = new ModelAndView();

        mv = userManagementService.updateUserMasterInfo(commonCommandMap);

        return mv;
    }

    /**
     *	FUNCTION 	: deleteUserMasterInfo
     *	NOTE 		: 사용자 정보 삭제
     *	INPUT 		: commonMap
     *	OUTPUT 		: null
     **/
    @PostMapping("/core/system/userManagement/deleteUserMasterInfo")
    public ModelAndView deleteUserMasterInfo(CommonCommandMap commonCommandMap) {
        ModelAndView mv = new ModelAndView();

        mv = userManagementService.deleteUserMasterInfo(commonCommandMap);

        return mv;
    }
}

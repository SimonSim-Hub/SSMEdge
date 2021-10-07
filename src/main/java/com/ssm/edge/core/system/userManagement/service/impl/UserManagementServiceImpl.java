package com.ssm.edge.core.system.userManagement.service.impl;

import java.util.Iterator;
import java.util.Map.Entry;

import com.ssm.edge.core.login.dao.LoginDAO;
import com.ssm.edge.core.system.userManagement.vo.UserMasterVO;
import com.ssm.edge.core.map.CommonCommandMap;
import com.ssm.edge.core.system.userManagement.dao.UserManagementDAO;
import com.ssm.edge.core.system.userManagement.service.UserManagementService;
import com.ssm.edge.core.util.ConvertUtil;
import com.ssm.edge.core.util.JsonUtil;
import org.modelmapper.ModelMapper;
import org.springframework.boot.configurationprocessor.json.JSONArray;
import org.springframework.boot.configurationprocessor.json.JSONException;
import org.springframework.boot.configurationprocessor.json.JSONObject;
import org.springframework.stereotype.Service;
import org.springframework.transaction.interceptor.TransactionAspectSupport;
import org.springframework.web.servlet.ModelAndView;


import javax.annotation.Resource;

@Service("userManagementService")
public class UserManagementServiceImpl implements UserManagementService {
    @Resource(name = "userManagementDAO")
    public UserManagementDAO userManagementDAO;

    @Resource(name = "loginDAO")
    public LoginDAO loginDAO;

    @Override
    public ModelAndView selectUserMasterList(CommonCommandMap commonCommandMap) {
        ModelAndView mv = new ModelAndView("jsonView");

        ModelMapper modelMapper = new ModelMapper();
        UserMasterVO userMasterVO = modelMapper.map(commonCommandMap.getMap(), UserMasterVO.class);

        String resultStatus = null;
        String resultMessage = null;

        String userMasterList = null;

        try {
            userMasterList = ConvertUtil.ArrayToString(userManagementDAO.selectUserMasterList(userMasterVO));

            mv.addObject("userMasterList", userMasterList);

            resultStatus = "1";
            resultMessage = "사용자 마스터 리스트 조회가 완료되었습니다.";
        } catch (Exception e) {
            e.printStackTrace();

            resultStatus = "3";
            resultMessage = "[ERR_UMSI_SUM_0001]<br>사용자 마스터 리스트 조회에 실패하였습니다.<br>관리자에게 문의하세요.";

            mv.addObject("resultStatus", resultStatus);
            mv.addObject("resultMessage", resultMessage);

            return mv;
        }

        mv.addObject("resultStatus", resultStatus);
        mv.addObject("resultMessage", resultMessage);

        return mv;
    }

    @Override
    public ModelAndView insertUserMasterInfo(CommonCommandMap commonCommandMap) {
        ModelAndView mv = new ModelAndView("jsonView");

        ModelMapper modelMapper = new ModelMapper();
        UserMasterVO userMasterVO = modelMapper.map(commonCommandMap.getMap(), UserMasterVO.class);

        String resultStatus = null;
        String resultMessage = null;

        int userIdCount = 0;
        int userEmailCount = 0;

        try {
            userIdCount = loginDAO.selectUserIdCount(userMasterVO);
        } catch (Exception e) {
            e.printStackTrace();

            resultStatus = "3";
            resultMessage = "[ERR_UMSI_IUMI_0001]<br>아이디 중복 여부 조회에 실패하였습니다.<br>관리자에게 문의하세요.";

            mv.addObject("resultStatus", resultStatus);
            mv.addObject("resultMessage", resultMessage);

            return mv;
        }

        if (userIdCount > 0) {

            resultStatus = "2";
            resultMessage = "이미 가입된 아이디 입니다.";

            mv.addObject("resultStatus", resultStatus);
            mv.addObject("resultMessage", resultMessage);

            return mv;
        }

        try {
            userEmailCount = loginDAO.selectUserEmailCount(userMasterVO);
        } catch (Exception e) {
            e.printStackTrace();

            resultStatus = "3";
            resultMessage = "[ERR_UMSI_IUMI_0002]<br>Email 중복 여부 조회에 실패하였습니다.<br>관리자에게 문의하세요.";

            mv.addObject("resultStatus", resultStatus);
            mv.addObject("resultMessage", resultMessage);

            return mv;
        }

        if (userEmailCount > 0) {
            resultStatus = "2";
            resultMessage = "이미 가입된 이메일 입니다.";

            mv.addObject("resultStatus", resultStatus);
            mv.addObject("resultMessage", resultMessage);

            return mv;
        }

        if (userIdCount == 0 && userEmailCount == 0) {
            try {
                userManagementDAO.insertUserMasterInfo(userMasterVO);

                resultStatus = "1";
                resultMessage = "사용자 정보 등록이 완료되었습니다.";

                mv.addObject("resultStatus", resultStatus);
                mv.addObject("resultMessage", resultMessage);
            } catch (Exception e) {
                e.printStackTrace();

                resultStatus = "3";
                resultMessage = "[ERR_UMSI_IUMI_0003]<br>사용자 계정 생성에 실패하였습니다.<br>관리자에게 문의하세요.";

                mv.addObject("resultStatus", resultStatus);
                mv.addObject("resultMessage", resultMessage);

                return mv;
            }
        }

        return mv;
    }

    @Override
    public ModelAndView updateUserMasterInfo(CommonCommandMap commonCommandMap) {
        ModelAndView mv = new ModelAndView("jsonView");

        ModelMapper modelMapper = new ModelMapper();
        UserMasterVO userMasterVO = modelMapper.map(commonCommandMap.getMap(), UserMasterVO.class);

        String resultStatus = null;
        String resultMessage = null;

        String userMasterList = null;

        try {
            userManagementDAO.updateUserMasterInfo(userMasterVO);

            resultStatus = "1";
            resultMessage = "사용자 정보 변경이 완료되었습니다.";
        } catch (Exception e) {
            e.printStackTrace();

            resultStatus = "3";
            resultMessage = "[ERR_UMSI_UUMI_0001]<br>사용자 정보 변경에 실패하였습니다.<br>관리자에게 문의하세요.";

            mv.addObject("resultStatus", resultStatus);
            mv.addObject("resultMessage", resultMessage);

            return mv;
        }

        mv.addObject("resultStatus", resultStatus);
        mv.addObject("resultMessage", resultMessage);

        return mv;
    }

    @Override
    public ModelAndView deleteUserMasterInfo(CommonCommandMap commonCommandMap) {
        ModelAndView mv = new ModelAndView("jsonView");

        ModelMapper modelMapper = new ModelMapper();
        UserMasterVO userMasterVO = null;

        String resultStatus = null;
        String resultMessage = null;

        Iterator<Entry<String, Object>> iterator = commonCommandMap.getMap().entrySet().iterator();
        Entry<String, Object> entry = null;

        while (iterator.hasNext()) {
            entry = iterator.next();

            if (entry.getKey().equals("userMasterList")) {
                JSONArray userMasterArray = JsonUtil.jsonStringtoJsonArray(entry.getValue());
                JSONObject userMasterObject = null;

                for (int i = 0; i < userMasterArray.length(); i++)
                {
                    try {
                        userMasterObject = userMasterArray.getJSONObject(i);

                        userMasterVO = modelMapper.map(JsonUtil.jsonObjectToMap(userMasterObject), UserMasterVO.class);

                        System.out.println(userMasterVO);

                        userManagementDAO.deleteUserMasterInfo(userMasterVO);

                        resultStatus = "1";
                        resultMessage = "사용자 정보 삭제가 완료되었습니다.";
                    } catch (JSONException e) {
                        e.printStackTrace();
                    }  catch (Exception e) {
                        e.printStackTrace();

                        TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();

                        resultStatus = "3";
                        resultMessage = "[ERR_UMSI_DUMI_0001]<br>사용자 정보 삭제 중 오류가 발생하였습니다.<br>관리자에게 문의하세요.";

                        mv.addObject("resultStatus", resultStatus);
                        mv.addObject("resultMessage", resultMessage);

                        return mv;
                    }
                }
            }
        }

        mv.addObject("resultStatus", resultStatus);
        mv.addObject("resultMessage", resultMessage);

        return mv;
    }
}

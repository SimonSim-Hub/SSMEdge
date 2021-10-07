package com.ssm.edge.turck.admin.alarmManagement.service.impl;

import com.ssm.edge.core.main.dao.MainDAO;
import com.ssm.edge.core.main.vo.TagLowDataThreadDelayVO;
import com.ssm.edge.core.map.CommonCommandMap;
import com.ssm.edge.core.util.ConvertUtil;
import com.ssm.edge.core.util.JsonUtil;
import com.ssm.edge.turck.admin.alarmManagement.dao.AlarmManagementDAO;
import com.ssm.edge.turck.admin.alarmManagement.service.AlarmManagementService;
import com.ssm.edge.turck.admin.alarmManagement.vo.AlarmMasterSelectVO;
import com.ssm.edge.turck.admin.alarmManagement.vo.AlarmMasterVO;
import com.ssm.edge.turck.admin.deviceManagement.dao.DeviceManagementDAO;
import org.modelmapper.ModelMapper;
import org.springframework.boot.configurationprocessor.json.JSONArray;
import org.springframework.boot.configurationprocessor.json.JSONException;
import org.springframework.boot.configurationprocessor.json.JSONObject;
import org.springframework.stereotype.Service;
import org.springframework.transaction.interceptor.TransactionAspectSupport;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

@Service("alarmManagementService")
public class AlarmManagementServiceImpl implements AlarmManagementService {

    @Resource(name = "mainDAO")
    public MainDAO mainDAO;

    @Resource(name = "alarmManagementDAO")
    public AlarmManagementDAO alarmManagementDAO;

    @Resource(name = "deviceManagementDAO")
    public DeviceManagementDAO deviceManagementDAO;

    @Override
    public ModelAndView selectAlarmMasterList(CommonCommandMap commonCommandMap) {
        ModelAndView mv = new ModelAndView("jsonView");

        ModelMapper modelMapper = new ModelMapper();
        AlarmMasterVO alarmMasterVO = modelMapper.map(commonCommandMap.getMap(), AlarmMasterVO.class);

        String resultStatus = null;
        String resultMessage = null;

        String alarmMasterList = null;

        try {
            alarmMasterList = ConvertUtil.ArrayToString(alarmManagementDAO.selectAlarmMasterList(alarmMasterVO));

            mv.addObject("alarmMasterList", alarmMasterList);

            resultStatus = "1";
            resultMessage = "알람 목록 조회가 완료되었습니다.";
        } catch (Exception e) {
            e.printStackTrace();

            resultStatus = "3";
            resultMessage = "[ERR_AMSI_SLML_0001]<br>알람 목록 조회에 실패하였습니다.<br>관리자에게 문의하세요.";

            mv.addObject("resultStatus", resultStatus);
            mv.addObject("resultMessage", resultMessage);

            return mv;
        }

        mv.addObject("resultStatus", resultStatus);
        mv.addObject("resultMessage", resultMessage);

        return mv;
    }

    @Override
    public ModelAndView updateAlarmMasterInfo(CommonCommandMap commonCommandMap) {
        ModelAndView mv = new ModelAndView("jsonView");

        ModelMapper modelMapper = new ModelMapper();
        AlarmMasterVO alarmMasterVO = modelMapper.map(commonCommandMap.getMap(), AlarmMasterVO.class);

        String resultStatus = null;
        String resultMessage = null;

        try {
            alarmManagementDAO.updateAlarmMasterInfo(alarmMasterVO);

            resultStatus = "1";
            resultMessage = "알람 정보 수정이 완료되었습니다.";
        } catch (Exception e) {
            e.printStackTrace();

            resultStatus = "3";
            resultMessage = "[ERR_AMSI_UAMI_0001]<br>알람 정보 수정에 실패하였습니다.<br>관리자에게 문의하세요.";

            mv.addObject("resultStatus", resultStatus);
            mv.addObject("resultMessage", resultMessage);

            return mv;
        }

        mv.addObject("resultStatus", resultStatus);
        mv.addObject("resultMessage", resultMessage);

        return mv;
    }

    @Override
    public ModelAndView updateAlarmMasterList(CommonCommandMap commonCommandMap) {
        ModelAndView mv = new ModelAndView("jsonView");

        ModelMapper modelMapper = new ModelMapper();
        AlarmMasterVO alarmMasterVO = modelMapper.map(commonCommandMap.getMap(), AlarmMasterVO.class);

        String resultStatus = null;
        String resultMessage = null;

        Iterator<Map.Entry<String, Object>> iterator = commonCommandMap.getMap().entrySet().iterator();
        Map.Entry<String, Object> entry = null;

        while (iterator.hasNext()) {
            entry = iterator.next();

            if (entry.getKey().equals("alarmMasterList")) {
                JSONArray alarmMasterArray = JsonUtil.jsonStringtoJsonArray(entry.getValue());
                JSONObject alarmMasterObject = null;

                for (int i = 0; i < alarmMasterArray.length(); i++)
                {
                    try {
                        alarmMasterObject = alarmMasterArray.getJSONObject(i);

                        alarmMasterVO = modelMapper.map(JsonUtil.jsonObjectToMap(alarmMasterObject), AlarmMasterVO.class);

                        alarmManagementDAO.updateAlarmMasterInfo(alarmMasterVO);
                    } catch (JSONException e) {
                        e.printStackTrace();
                    }  catch (Exception e) {
                        e.printStackTrace();

                        TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();

                        resultStatus = "3";
                        resultMessage = "[ERR_AMSI_UAML_0001]<br>알람 마스터 목록 수정 중 오류가 발생하였습니다.<br>관리자에게 문의하세요.";

                        mv.addObject("resultStatus", resultStatus);
                        mv.addObject("resultMessage", resultMessage);

                        return mv;
                    }
                }
            }
        }

        resultStatus = "1";
        resultMessage = "알람 마스터 목록 수정이 완료되었습니다.";

        mv.addObject("resultStatus", resultStatus);
        mv.addObject("resultMessage", resultMessage);

        return mv;
    }

    @Override
    public ModelAndView confirmAlarmList(CommonCommandMap commonCommandMap) {
        ModelAndView mv = new ModelAndView("jsonView");

        ModelMapper modelMapper = new ModelMapper();
        AlarmMasterVO alarmMasterVO = modelMapper.map(commonCommandMap.getMap(), AlarmMasterVO.class);

        Iterator<Map.Entry<String, Object>> iterator = commonCommandMap.getMap().entrySet().iterator();
        Map.Entry<String, Object> entry = null;

        String resultStatus = null;
        String resultMessage = null;

        while (iterator.hasNext()) {
            entry = iterator.next();

            if (entry.getKey().equals("alarmCodeList")) {
                JSONArray alarmMasterArray = JsonUtil.jsonStringtoJsonArray(entry.getValue());
                JSONObject alarmMasterObject = null;

                for (int i = 0; i < alarmMasterArray.length(); i++)
                {
                    try {
                        alarmMasterObject = alarmMasterArray.getJSONObject(i);

                        alarmMasterVO = modelMapper.map(JsonUtil.jsonObjectToMap(alarmMasterObject), AlarmMasterVO.class);

                        alarmMasterVO.setAlarmStatus(0);

                        alarmManagementDAO.updateAlarmMasterInfo(alarmMasterVO);
                    } catch (JSONException e) {
                        e.printStackTrace();
                    }  catch (Exception e) {
                        e.printStackTrace();

                        TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();

                        return mv;
                    }
                }
            }
        }

        resultStatus = "1";
        resultMessage = "알람 정보 확인이 완료되었습니다.";

        mv.addObject("resultStatus", resultStatus);
        mv.addObject("resultMessage", resultMessage);

        return mv;
    }

    @Override
    public ModelAndView selectAlarmHistoryList(CommonCommandMap commonCommandMap) {
        ModelAndView mv = new ModelAndView("jsonView");

        ModelMapper modelMapper = new ModelMapper();
        AlarmMasterSelectVO alarmMasterSelectVO = modelMapper.map(commonCommandMap.getMap(), AlarmMasterSelectVO.class);

        List<AlarmMasterVO> alarmMasterSelectVOList = new ArrayList<>();

        String alarmHistoryList = null;

        AlarmMasterVO tempAlarmMasterVO = new AlarmMasterVO();

        String resultStatus = null;
        String resultMessage = null;

        String startDate = null;
        String endDate = null;

        try {
            if(alarmMasterSelectVO.getStartDate() == null && alarmMasterSelectVO.getEndDate() == null) {
                tempAlarmMasterVO = alarmManagementDAO.selectAlarmHistoryStartEndDate(alarmMasterSelectVO);

                if(tempAlarmMasterVO != null) {
                    alarmMasterSelectVO.setStartDate(tempAlarmMasterVO.getStartDate());
                    alarmMasterSelectVO.setEndDate(tempAlarmMasterVO.getEndDate());

                    startDate = tempAlarmMasterVO.getStartDate().substring(0, 19);
                    endDate = tempAlarmMasterVO.getEndDate().substring(0, 19);
                } else {
                    startDate = alarmMasterSelectVO.getStartDate();
                    endDate = alarmMasterSelectVO.getEndDate();
                }
            } else {
                startDate = alarmMasterSelectVO.getStartDate();
                endDate = alarmMasterSelectVO.getEndDate();
            }
            mv.addObject("startDate", startDate);
            mv.addObject("endDate", endDate);

            alarmMasterSelectVOList = alarmManagementDAO.selectAlarmHistoryList(alarmMasterSelectVO);

            alarmHistoryList = ConvertUtil.ArrayToString(alarmMasterSelectVOList);

            mv.addObject("alarmHistoryList", alarmHistoryList);

            alarmManagementDAO.updateAlarmHistoryConfirmStatus(alarmMasterSelectVO);

            resultStatus = "1";
            resultMessage = "알람 히스토리 조회가 완료되었습니다.";
        } catch (Exception e) {
            e.printStackTrace();

            resultStatus = "3";
            resultMessage = "[ERR_AMSI_SAHL_0001]<br>알람 히스토리 조회에 실패하였습니다.<br>관리자에게 문의하세요.";

            mv.addObject("resultStatus", resultStatus);
            mv.addObject("resultMessage", resultMessage);
        }

        mv.addObject("resultStatus", resultStatus);
        mv.addObject("resultMessage", resultMessage);

        return mv;
    }

    @Override
    public ModelAndView selectAlarmSensorCount() {
        ModelAndView mv = new ModelAndView("jsonView");

        AlarmMasterSelectVO alarmMasterVO = new AlarmMasterSelectVO();

        List<AlarmMasterSelectVO> alarmMasterVOList = new ArrayList<>();

        try {
            int warningSensorCount = 0;
            int alarmSensorCount = 0;

            alarmMasterVOList = alarmManagementDAO.selectAlarmSensorCount();

            if(alarmMasterVOList != null) {
                for(int i = 0; i < alarmMasterVOList.size(); i++) {
                    if(alarmMasterVOList.get(i).getAlarmStatus() == 1) {
                        warningSensorCount = alarmMasterVOList.get(i).getAlarmCount();
                    } else if (alarmMasterVOList.get(i).getAlarmStatus() == 2) {
                        alarmSensorCount = alarmMasterVOList.get(i).getAlarmCount();
                    }
                }
            }

            mv.addObject("warningSensorCount", warningSensorCount);
            mv.addObject("alarmSensorCount", alarmSensorCount);

            long threadDelay = 0;

            TagLowDataThreadDelayVO tagLowDataThreadDelayVO = new TagLowDataThreadDelayVO();

            tagLowDataThreadDelayVO = mainDAO.selectTagLowDataThreadDelay();

            threadDelay = tagLowDataThreadDelayVO.getTimerDelay();

            mv.addObject("threadDelay", threadDelay);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return mv;
    }
}

package com.ssm.edge.turck.admin.locationManagement.service.impl;

import java.util.Iterator;
import java.util.List;
import java.util.Map.Entry;

import com.ssm.edge.core.map.CommonCommandMap;
import com.ssm.edge.core.util.CodeUtil;
import com.ssm.edge.core.util.ConvertUtil;
import com.ssm.edge.core.util.JsonUtil;
import com.ssm.edge.turck.admin.deviceManagement.dao.DeviceManagementDAO;
import com.ssm.edge.turck.admin.deviceManagement.vo.DeviceMasterVO;
import com.ssm.edge.turck.admin.locationManagement.dao.LocationManagementDAO;
import com.ssm.edge.turck.admin.locationManagement.service.LocationManagementService;
import com.ssm.edge.turck.admin.locationManagement.vo.LocationMasterVO;
import org.springframework.boot.configurationprocessor.json.JSONArray;
import org.springframework.boot.configurationprocessor.json.JSONException;
import org.springframework.boot.configurationprocessor.json.JSONObject;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.interceptor.TransactionAspectSupport;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;

@Service("locationManagementService")
public class LocationManagementServiceImpl implements LocationManagementService {

    @Resource(name = "locationManagementDAO")
    public LocationManagementDAO locationManagementDAO;

    @Resource(name = "deviceManagementDAO")
    public DeviceManagementDAO deviceManagementDAO;

    @Override
    public ModelAndView selectLocationMasterList(CommonCommandMap commonCommandMap) {
        ModelAndView mv = new ModelAndView("jsonView");

        ModelMapper modelMapper = new ModelMapper();
        LocationMasterVO locationMasterVO = modelMapper.map(commonCommandMap.getMap(), LocationMasterVO.class);

        String resultStatus = null;
        String resultMessage = null;

        String locationMasterList = null;

        try {
            locationMasterList = ConvertUtil.ArrayToString(locationManagementDAO.selectLocationMasterList(locationMasterVO));

            mv.addObject("locationMasterList", locationMasterList);

            resultStatus = "1";
            resultMessage = "???????????? ?????? ????????? ?????????????????????.";
        } catch (Exception e) {
            e.printStackTrace();

            resultStatus = "3";
            resultMessage = "[ERR_LMSI_SLML_0001]<br>???????????? ?????? ????????? ?????????????????????.<br>??????????????? ???????????????.";

            mv.addObject("resultStatus", resultStatus);
            mv.addObject("resultMessage", resultMessage);

            return mv;
        }

        mv.addObject("resultStatus", resultStatus);
        mv.addObject("resultMessage", resultMessage);

        return mv;
    }

    @Override
    public ModelAndView insertLocationMasterInfo(CommonCommandMap commonCommandMap) {
        ModelAndView mv = new ModelAndView("jsonView");

        ModelMapper modelMapper = new ModelMapper();
        LocationMasterVO locationMasterVO = modelMapper.map(commonCommandMap.getMap(), LocationMasterVO.class);

        String resultStatus = null;
        String resultMessage = null;

        int locationMaxCount = 0;
        
        try {
            locationMaxCount = locationManagementDAO.selectLocationMasterMaxCount();

        } catch (Exception e) {
            e.printStackTrace();

            resultStatus = "3";
            resultMessage = "[ERR_LMSI_ILMI_0001]<br>???????????? ?????? ????????? ????????? ?????????????????????.<br>??????????????? ???????????????.";

            mv.addObject("resultStatus", resultStatus);
            mv.addObject("resultMessage", resultMessage);

            return mv;
        }
        
        try {
            locationMasterVO.setLocationNo(locationMaxCount);
            locationMasterVO.setLocationCode(CodeUtil.getCode("LC", locationMaxCount));

            locationManagementDAO.insertLocationMasterInfo(locationMasterVO);

            resultStatus = "1";
            resultMessage = "???????????? ?????? ????????? ?????????????????????.";
        } catch (Exception e) {
            e.printStackTrace();

            resultStatus = "3";
            resultMessage = "[ERR_LMSI_ILMI_0002]<br>???????????? ?????? ????????? ?????????????????????.<br>??????????????? ???????????????.";

            mv.addObject("resultStatus", resultStatus);
            mv.addObject("resultMessage", resultMessage);

            return mv;
        }

        mv.addObject("resultStatus", resultStatus);
        mv.addObject("resultMessage", resultMessage);

        return mv;
    }

    @Override
    public ModelAndView updateLocationMasterInfo(CommonCommandMap commonCommandMap) {
        ModelAndView mv = new ModelAndView("jsonView");

        ModelMapper modelMapper = new ModelMapper();
        LocationMasterVO locationMasterVO = modelMapper.map(commonCommandMap.getMap(), LocationMasterVO.class);

        String resultStatus = null;
        String resultMessage = null;

        try {
            locationManagementDAO.updateLocationMasterInfo(locationMasterVO);

            resultStatus = "1";
            resultMessage = "???????????? ?????? ????????? ?????????????????????.";
        } catch (Exception e) {
            e.printStackTrace();

            resultStatus = "3";
            resultMessage = "[ERR_LMSI_ULMI_0001]<br>???????????? ?????? ????????? ?????????????????????.<br>??????????????? ???????????????.";

            mv.addObject("resultStatus", resultStatus);
            mv.addObject("resultMessage", resultMessage);

            return mv;
        }

        mv.addObject("resultStatus", resultStatus);
        mv.addObject("resultMessage", resultMessage);

        return mv;
    }

    @Override
    public ModelAndView deleteLocationMasterList(CommonCommandMap commonCommandMap) {
        ModelAndView mv = new ModelAndView("jsonView");

        ModelMapper modelMapper = new ModelMapper();
        LocationMasterVO locationMasterVO = null;

        String resultStatus = null;
        String resultMessage = null;

        Iterator<Entry<String, Object>> iterator = commonCommandMap.getMap().entrySet().iterator();
        Entry<String, Object> entry = null;

        while (iterator.hasNext()) {
            entry = iterator.next();

            if (entry.getKey().equals("locationMasterList")) {
                JSONArray locationMasterArray = JsonUtil.jsonStringtoJsonArray(entry.getValue());
                JSONObject locationMasterObject = null;

                for (int i = 0; i < locationMasterArray.length(); i++)
                {
                    try {
                        locationMasterObject = locationMasterArray.getJSONObject(i);

                        locationMasterVO = modelMapper.map(JsonUtil.jsonObjectToMap(locationMasterObject), LocationMasterVO.class);

                        DeviceMasterVO deviceMasterVO = new DeviceMasterVO();
                        deviceMasterVO.setLocationCode(locationMasterVO.getLocationCode());

                        List<DeviceMasterVO> deviceMasterList = deviceManagementDAO.selectDeviceMasterList(deviceMasterVO);

                        if(deviceMasterList != null) {
                            for(int j = 0; j < deviceMasterList.size(); j++) {
                                deviceMasterVO.setDeviceCode(deviceMasterList.get(j).getDeviceCode());
                                deviceMasterVO.setLocationCode(null);

                                deviceManagementDAO.updateDeviceMasterInfo(deviceMasterVO);
                            }
                        }

                        locationManagementDAO.deleteLocationMasterInfo(locationMasterVO);

                        resultStatus = "1";
                        resultMessage = "???????????? ?????? ????????? ?????????????????????.";
                    } catch (JSONException e) {
                        e.printStackTrace();
                    }  catch (Exception e) {
                        e.printStackTrace();

                        TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();

                        resultStatus = "3";
                        resultMessage = "[ERR_LMSI_DLML_0001]<br>???????????? ?????? ?????? ??? ????????? ?????????????????????.<br>??????????????? ???????????????.";

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

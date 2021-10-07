package com.ssm.edge.turck.admin.deviceManagement.service.iml;

import com.ssm.edge.core.map.CommonCommandMap;
import com.ssm.edge.core.util.ConvertUtil;
import com.ssm.edge.core.util.JsonUtil;
import com.ssm.edge.turck.admin.deviceManagement.dao.DeviceManagementDAO;
import com.ssm.edge.turck.admin.deviceManagement.service.DeviceManagementService;
import com.ssm.edge.turck.admin.deviceManagement.vo.DeviceMasterVO;
import com.ssm.edge.turck.admin.sensorManagement.dao.SensorManagementDAO;
import com.ssm.edge.turck.admin.sensorManagement.vo.SensorMasterVO;
import com.ssm.edge.turck.admin.tagManagement.dao.TagManagementDAO;
import com.ssm.edge.turck.admin.tagManagement.vo.TagMasterVO;
import org.modelmapper.ModelMapper;
import org.springframework.boot.configurationprocessor.json.JSONArray;
import org.springframework.boot.configurationprocessor.json.JSONException;
import org.springframework.boot.configurationprocessor.json.JSONObject;
import org.springframework.stereotype.Service;
import org.springframework.transaction.interceptor.TransactionAspectSupport;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.Iterator;
import java.util.Map;

@Service("deviceManagementService")
public class DeviceManagementServiceImpl implements DeviceManagementService {

    @Resource(name = "deviceManagementDAO")
    public DeviceManagementDAO deviceManagementDAO;

    @Resource(name = "sensorManagementDAO")
    public SensorManagementDAO sensorManagementDAO;

    @Resource(name = "tagManagementDAO")
    public TagManagementDAO tagManagementDAO;

    @Override
    public ModelAndView selectDeviceMasterList(CommonCommandMap commonCommandMap) {
        ModelAndView mv = new ModelAndView("jsonView");

        ModelMapper modelMapper = new ModelMapper();
        DeviceMasterVO deviceMasterVO = modelMapper.map(commonCommandMap.getMap(), DeviceMasterVO.class);

        String resultStatus = null;
        String resultMessage = null;

        String deviceMasterList = null;

        try {

            deviceMasterList = ConvertUtil.ArrayToString(deviceManagementDAO.selectDeviceMasterList(deviceMasterVO));

            mv.addObject("deviceMasterList", deviceMasterList);

            resultStatus = "1";
            resultMessage = "디바이스 목록 조회가 완료되었습니다.";
        } catch (Exception e) {
            e.printStackTrace();

            resultStatus = "3";
            resultMessage = "[ERR_DMSI_SDML_0001]<br>디바이스 목록 조회에 실패하였습니다.<br>관리자에게 문의하세요.";

            mv.addObject("resultStatus", resultStatus);
            mv.addObject("resultMessage", resultMessage);

            return mv;
        }

        mv.addObject("resultStatus", resultStatus);
        mv.addObject("resultMessage", resultMessage);

        return mv;
    }

    @Override
    public ModelAndView updateDeviceMasterInfo(CommonCommandMap commonCommandMap) {
        ModelAndView mv = new ModelAndView("jsonView");

        ModelMapper modelMapper = new ModelMapper();
        DeviceMasterVO deviceMasterVO = modelMapper.map(commonCommandMap.getMap(), DeviceMasterVO.class);

        String resultStatus = null;
        String resultMessage = null;
        try {

            deviceManagementDAO.updateDeviceMasterInfo(deviceMasterVO);

            resultStatus = "1";
            resultMessage = "디바이스 목록 수정이 완료되었습니다.";
        } catch (Exception e) {
            e.printStackTrace();

            resultStatus = "3";
            resultMessage = "[ERR_DMSI_UDML_0001]<br>디바이스 목록 수정에 실패하였습니다.<br>관리자에게 문의하세요.";

            mv.addObject("resultStatus", resultStatus);
            mv.addObject("resultMessage", resultMessage);

            return mv;
        }

        mv.addObject("resultStatus", resultStatus);
        mv.addObject("resultMessage", resultMessage);

        return mv;
    }

    @Override
    public ModelAndView deleteDeviceMasterList(CommonCommandMap commonCommandMap) {
        ModelAndView mv = new ModelAndView("jsonView");

        ModelMapper modelMapper = new ModelMapper();
        DeviceMasterVO deviceMasterVO = null;

        String resultStatus = null;
        String resultMessage = null;

        Iterator<Map.Entry<String, Object>> iterator = commonCommandMap.getMap().entrySet().iterator();
        Map.Entry<String, Object> entry = null;

        while (iterator.hasNext()) {
            entry = iterator.next();

            if (entry.getKey().equals("deviceMasterList")) {
                JSONArray deviceMasterArray = JsonUtil.jsonStringtoJsonArray(entry.getValue());
                JSONObject deviceMasterObject = null;

                for (int i = 0; i < deviceMasterArray.length(); i++)
                {
                    try {
                        deviceMasterObject = deviceMasterArray.getJSONObject(i);

                        deviceMasterVO = modelMapper.map(JsonUtil.jsonObjectToMap(deviceMasterObject), DeviceMasterVO.class);

                        TagMasterVO tagMasterVO = new TagMasterVO();
                        tagMasterVO.setDeviceCode(deviceMasterVO.getDeviceCode());

                        tagManagementDAO.deleteTagMasterByDeviceCode(tagMasterVO);

                        SensorMasterVO sensorMasterVO = new SensorMasterVO();
                        sensorMasterVO.setDeviceCode(deviceMasterVO.getDeviceCode());

                        sensorManagementDAO.deleteSensorMasterByDeviceCode(sensorMasterVO);

                        deviceManagementDAO.deleteDeviceMasterInfo(deviceMasterVO);

                        resultStatus = "1";
                        resultMessage = "디바이스 정보 삭제가 완료되었습니다.";
                    } catch (JSONException e) {
                        e.printStackTrace();
                    }  catch (Exception e) {
                        e.printStackTrace();

                        TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();

                        resultStatus = "3";
                        resultMessage = "[ERR_DMSI_DDML_0001]<br>디바이스 정보 삭제 중 오류가 발생하였습니다.<br>관리자에게 문의하세요.";

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

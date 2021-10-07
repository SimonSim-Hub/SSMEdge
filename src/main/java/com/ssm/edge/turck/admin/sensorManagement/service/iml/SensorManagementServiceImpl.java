package com.ssm.edge.turck.admin.sensorManagement.service.iml;

import com.ssm.edge.core.map.CommonCommandMap;
import com.ssm.edge.core.util.ConvertUtil;
import com.ssm.edge.core.util.JsonUtil;
import com.ssm.edge.turck.admin.sensorManagement.dao.SensorManagementDAO;
import com.ssm.edge.turck.admin.sensorManagement.service.SensorManagementService;
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

@Service("sensorManagementService")
public class SensorManagementServiceImpl implements SensorManagementService {

    @Resource(name = "sensorManagementDAO")
    public SensorManagementDAO sensorManagementDAO;

    @Resource(name = "tagManagementDAO")
    public TagManagementDAO tagManagementDAO;

    @Override
    public ModelAndView selectSensorMasterList(CommonCommandMap commonCommandMap) {
        ModelAndView mv = new ModelAndView("jsonView");

        ModelMapper modelMapper = new ModelMapper();
        SensorMasterVO sensorMasterVO = modelMapper.map(commonCommandMap.getMap(), SensorMasterVO.class);

        String resultStatus = null;
        String resultMessage = null;

        String sensorMasterList = null;

        try {

            sensorMasterList = ConvertUtil.ArrayToString(sensorManagementDAO.selectSensorMasterList(sensorMasterVO));

            mv.addObject("sensorMasterList", sensorMasterList);

            resultStatus = "1";
            resultMessage = "센서 목록 조회가 완료되었습니다.";
        } catch (Exception e) {
            e.printStackTrace();

            resultStatus = "3";
            resultMessage = "[ERR_SMSI_SSML_0001]<br>센서 목록 조회에 실패하였습니다.<br>관리자에게 문의하세요.";

            mv.addObject("resultStatus", resultStatus);
            mv.addObject("resultMessage", resultMessage);

            return mv;
        }

        mv.addObject("resultStatus", resultStatus);
        mv.addObject("resultMessage", resultMessage);

        return mv;
    }

    @Override
    public ModelAndView updateSensorMasterInfo(CommonCommandMap commonCommandMap) {
        ModelAndView mv = new ModelAndView("jsonView");

        ModelMapper modelMapper = new ModelMapper();
        SensorMasterVO sensorMasterVO = modelMapper.map(commonCommandMap.getMap(), SensorMasterVO.class);

        String resultStatus = null;
        String resultMessage = null;
        try {

            sensorManagementDAO.updateSensorMasterInfo(sensorMasterVO);

            resultStatus = "1";
            resultMessage = "센서 목록 수정이 완료되었습니다.";
        } catch (Exception e) {
            e.printStackTrace();

            resultStatus = "3";
            resultMessage = "[ERR_SMSI_USML_0001]<br>센서 목록 수정에 실패하였습니다.<br>관리자에게 문의하세요.";

            mv.addObject("resultStatus", resultStatus);
            mv.addObject("resultMessage", resultMessage);

            return mv;
        }

        mv.addObject("resultStatus", resultStatus);
        mv.addObject("resultMessage", resultMessage);

        return mv;
    }

    @Override
    public ModelAndView deleteSensorMasterList(CommonCommandMap commonCommandMap) {
        ModelAndView mv = new ModelAndView("jsonView");

        ModelMapper modelMapper = new ModelMapper();
        SensorMasterVO sensorMasterVO = null;

        String resultStatus = null;
        String resultMessage = null;

        Iterator<Map.Entry<String, Object>> iterator = commonCommandMap.getMap().entrySet().iterator();
        Map.Entry<String, Object> entry = null;

        while (iterator.hasNext()) {
            entry = iterator.next();

            if (entry.getKey().equals("sensorMasterList")) {
                JSONArray sensorMasterArray = JsonUtil.jsonStringtoJsonArray(entry.getValue());
                JSONObject sensorMasterObject = null;

                for (int i = 0; i < sensorMasterArray.length(); i++)
                {
                    try {
                        sensorMasterObject = sensorMasterArray.getJSONObject(i);

                        sensorMasterVO = modelMapper.map(JsonUtil.jsonObjectToMap(sensorMasterObject), SensorMasterVO.class);

                        TagMasterVO tagMasterVO = new TagMasterVO();

                        tagMasterVO.setSensorCode(sensorMasterVO.getSensorCode());

                        System.out.println(tagMasterVO);

                        tagManagementDAO.deleteTagMasterBySensorCode(tagMasterVO);

                        sensorManagementDAO.deleteSensorMasterInfo(sensorMasterVO);

                        resultStatus = "1";
                        resultMessage = "센서 정보 삭제가 완료되었습니다.";
                    } catch (JSONException e) {
                        e.printStackTrace();
                    }  catch (Exception e) {
                        e.printStackTrace();

                        TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();

                        resultStatus = "3";
                        resultMessage = "[ERR_SMSI_DSML_0001]<br>센서 정보 삭제 중 오류가 발생하였습니다.<br>관리자에게 문의하세요.";

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

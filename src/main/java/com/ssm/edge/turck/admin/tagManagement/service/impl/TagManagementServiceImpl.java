package com.ssm.edge.turck.admin.tagManagement.service.impl;

import com.ssm.edge.core.map.CommonCommandMap;
import com.ssm.edge.core.system.userManagement.vo.CustomUserMasterDetailsVO;
import com.ssm.edge.core.util.CodeUtil;
import com.ssm.edge.core.util.ConvertUtil;
import com.ssm.edge.core.util.JsonUtil;
import com.ssm.edge.turck.admin.alarmManagement.dao.AlarmManagementDAO;
import com.ssm.edge.turck.admin.alarmManagement.vo.AlarmMasterVO;
import com.ssm.edge.turck.admin.deviceManagement.dao.DeviceManagementDAO;
import com.ssm.edge.turck.admin.deviceManagement.vo.DeviceMasterVO;
import com.ssm.edge.turck.admin.sensorManagement.dao.SensorManagementDAO;
import com.ssm.edge.turck.admin.sensorManagement.vo.SensorMasterVO;
import com.ssm.edge.turck.admin.tagManagement.dao.TagManagementDAO;
import com.ssm.edge.turck.admin.tagManagement.service.TagManagementService;
import com.ssm.edge.turck.admin.tagManagement.vo.TagMasterVO;
import org.apache.poi.openxml4j.opc.OPCPackage;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.modelmapper.ModelMapper;
import org.springframework.security.core.Authentication;
import org.springframework.boot.configurationprocessor.json.JSONArray;
import org.springframework.boot.configurationprocessor.json.JSONException;
import org.springframework.boot.configurationprocessor.json.JSONObject;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

@Service("tagManagementService")
public class TagManagementServiceImpl implements TagManagementService {

    @Resource(name = "tagManagementDAO")
    public TagManagementDAO tagManagementDAO;

    @Resource(name = "deviceManagementDAO")
    public DeviceManagementDAO deviceManagementDAO;

    @Resource(name = "sensorManagementDAO")
    public SensorManagementDAO sensorManagementDAO;

    @Resource(name = "alarmManagementDAO")
    public AlarmManagementDAO alarmManagementDAO;

    @Override
    public ModelAndView selectTagMasterList(CommonCommandMap commonCommandMap) {
        ModelAndView mv = new ModelAndView("jsonView");

        ModelMapper modelMapper = new ModelMapper();
        TagMasterVO tagMasterVO = modelMapper.map(commonCommandMap.getMap(), TagMasterVO.class);

        String resultStatus = null;
        String resultMessage = null;

        String tagMasterList = null;

        try {
            tagMasterList = ConvertUtil.ArrayToString(tagManagementDAO.selectTagMasterList(tagMasterVO));

            mv.addObject("tagMasterList", tagMasterList);

            resultStatus = "1";
            resultMessage = "태그 목록 조회가 완료되었습니다.";
        } catch (Exception e) {
            e.printStackTrace();

            resultStatus = "3";
            resultMessage = "[ERR_TMSI_STML_0001]<br>태그 목록 조회에 실패하였습니다.<br>관리자에게 문의하세요.";

            mv.addObject("resultStatus", resultStatus);
            mv.addObject("resultMessage", resultMessage);

            return mv;
        }

        mv.addObject("resultStatus", resultStatus);
        mv.addObject("resultMessage", resultMessage);

        return mv;
    }

    @Transactional
    @Override
    public ModelAndView tagMasterListExcelUpload(Authentication authentication, MultipartHttpServletRequest multipartHttpServletRequest) {
        ModelAndView mv = new ModelAndView();

        mv.setViewName("jsonView");

        List<TagMasterVO> tagMasterList = null;

        CustomUserMasterDetailsVO customUserMasterDetailsVO = (CustomUserMasterDetailsVO) authentication.getPrincipal();

        String resultStatus = null;
        String resultMessage = null;

        MultipartFile tagMasterListExcelUploadFile = multipartHttpServletRequest.getFile("tagMasterListExcelUploadFile");

        try {
            uploadTagMasterListExcelFile(customUserMasterDetailsVO.getUserId(), tagMasterListExcelUploadFile);
        } catch (Exception e) {
            e.printStackTrace();

            TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();

            resultStatus = "3";
            resultMessage = "[ERR_TMSI_TMLEU_0001]<br>태그 마스터 엑셀 파일 생성 중 오류가 발생하였습니다.<br>관리자에게 문의하세요.";

            mv.addObject("resultStatus", resultStatus);
            mv.addObject("resultMessage", resultMessage);

            return mv;
        }

        mv.addObject("resultStatus", resultStatus);
        mv.addObject("resultMessage", resultMessage);

        return mv;
    }

    @Transactional
    public List<TagMasterVO> uploadTagMasterListExcelFile(String createUser, MultipartFile excelFile) throws Exception {
        List<TagMasterVO> tagMasterList = new ArrayList<TagMasterVO>();
        List<DeviceMasterVO> deviceCodeArr = new ArrayList<DeviceMasterVO>();
        List<SensorMasterVO> sensorCodeArr = new ArrayList<SensorMasterVO>();

        OPCPackage opcPackage = OPCPackage.open(excelFile.getInputStream());
        XSSFWorkbook workbook = new XSSFWorkbook(opcPackage);

        int gTagNo = 1;
        int gSensorNo = 1;
        int gDeviceNo = 1;
        int gAlarmNo = 1;

        // 첫번째 시트 불러오기
        XSSFSheet sheet = workbook.getSheetAt(0);

        for(int i=1; i<sheet.getLastRowNum() + 1; i++) {
            TagMasterVO tagMasterVO = new TagMasterVO();
            SensorMasterVO sensorMasterVO = new SensorMasterVO();
            DeviceMasterVO deviceMasterVO = new DeviceMasterVO();

            boolean continueCheck = false;

            boolean sensorInsertCheck = false;
            boolean deviceInsertCheck = false;

            XSSFRow row = sheet.getRow(i);

            if(null == row) {
                continue;
            }

            XSSFCell tagTypeCell = row.getCell(1);
            XSSFCell tagCell = row.getCell(0);
            XSSFCell deviceNameCell = row.getCell(4);

            if(tagTypeCell != null) {
                if(ConvertUtil.cellDataToString(tagTypeCell).equals("A")) {
                    continueCheck = true;
                } else {
                    continueCheck = false;
                }
            }
            if(continueCheck) {
                if(tagCell != null) {
                    int tagNo = gTagNo;
                    String tagCode = null;
                    String tagName = CodeUtil.getRealName(ConvertUtil.cellDataToString(tagCell), ".");
                    String tagRealname = CodeUtil.getRealName(ConvertUtil.cellDataToString(tagCell), ".");
                    String tagFullname = ConvertUtil.cellDataToString(tagCell);
                    String tagType = ConvertUtil.cellDataToString(tagTypeCell);
                    String sensorCode = null;
                    String deviceCode = null;

                    String excelSensorName = ConvertUtil.cellDataToString(tagCell).substring(0, 4);
                    String excelSensorFullname = CodeUtil.getGroupFullName(ConvertUtil.cellDataToString(tagCell), ".");
                    String excelDeviceName = ConvertUtil.cellDataToString(deviceNameCell);

                    tagMasterVO.setTagNo(tagNo);

                    String dbTagCode = tagManagementDAO.selectTagCodeByTagFullname(tagFullname);

                    if(dbTagCode != null) {
                        tagCode = dbTagCode;

                        tagMasterVO.setTagCode(tagCode);
                        tagMasterVO.setUpdateUser(createUser);

                        tagMasterVO.setQueryStatus("U");
                    } else {
                        tagCode = CodeUtil.getCode("TC", tagNo);

                        tagMasterVO.setTagCode(tagCode);
                        tagMasterVO.setCreateUser(createUser);

                        tagMasterVO.setQueryStatus("I");
                    }

                    tagMasterVO.setTagName(tagName);
                    tagMasterVO.setTagRealname(tagRealname);
                    tagMasterVO.setTagFullname(tagFullname);
                    tagMasterVO.setTagType(tagType);

                    if (sensorCodeArr.size() > 0) {
                        for (int j = 0; j < sensorCodeArr.size(); j++) {
                            if (excelSensorName.equals(sensorCodeArr.get(j).getSensorName())) {
                                tagMasterVO.setSensorCode(sensorCodeArr.get(j).getSensorCode());
                            }
                        }

                        if(tagMasterVO.getSensorCode() == null) {
                            sensorInsertCheck = true;
                        }
                    } else {
                        sensorInsertCheck = true;
                    }

                    if(sensorInsertCheck) {
                        sensorCode = sensorManagementDAO.selectSensorCodeBySensorFullname(excelSensorFullname);

                        if(sensorCode != null) {
                            tagMasterVO.setSensorCode(sensorCode);
                            sensorMasterVO.setUpdateUser(createUser);

                            sensorMasterVO.setQueryStatus("U");
                        } else {
                            tagMasterVO.setSensorCode(CodeUtil.getCode("SC", gSensorNo));
                            sensorMasterVO.setCreateUser(createUser);

                            sensorMasterVO.setQueryStatus("I");
                        }

                        sensorMasterVO.setSensorNo(gSensorNo);
                        sensorMasterVO.setSensorCode(tagMasterVO.getSensorCode());
                        sensorMasterVO.setSensorName(excelSensorName);
                        sensorMasterVO.setSensorFullname(excelSensorFullname);

                        if (deviceCodeArr.size() > 0) {
                            for (int j = 0; j < deviceCodeArr.size(); j++) {
                                if (excelDeviceName.equals(deviceCodeArr.get(j).getDeviceName())) {
                                    sensorMasterVO.setDeviceCode(deviceCodeArr.get(j).getDeviceCode());
                                }
                            }

                            if(sensorMasterVO.getDeviceCode() == null) {
                                deviceInsertCheck = true;
                            }
                        } else {
                            deviceInsertCheck = true;
                        }

                        if(deviceInsertCheck) {
                            deviceCode = deviceManagementDAO.selectDeviceCodeByDeviceFullname(excelDeviceName);

                            deviceMasterVO.setDeviceNo(gDeviceNo);

                            if (deviceCode != null) {
                                sensorMasterVO.setDeviceCode(deviceCode);

                                deviceMasterVO.setUpdateUser(createUser);
                                deviceMasterVO.setQueryStatus("U");
                            } else {
                                sensorMasterVO.setDeviceCode(CodeUtil.getCode("DC", gDeviceNo));

                                deviceMasterVO.setCreateUser(createUser);
                                deviceMasterVO.setQueryStatus("I");
                            }

                            deviceMasterVO.setDeviceName(excelDeviceName);
                            deviceMasterVO.setDeviceFullname(excelDeviceName);
                            deviceMasterVO.setDeviceCode(sensorMasterVO.getDeviceCode());

                            if(deviceMasterVO.getQueryStatus().equals("I")) {
                                deviceManagementDAO.insertDeviceMasterInfo(deviceMasterVO);
                            } else if (deviceMasterVO.getQueryStatus().equals("U")) {
                                deviceManagementDAO.updateDeviceMasterInfo(deviceMasterVO);
                            }

                            deviceCodeArr.add(deviceMasterVO);

                            gDeviceNo++;
                        }

                        if(sensorMasterVO.getQueryStatus().equals("I")) {
                            sensorManagementDAO.insertSensorMasterInfo(sensorMasterVO);
                        } else if (sensorMasterVO.getQueryStatus().equals("U")) {
                            sensorManagementDAO.updateSensorMasterInfo(sensorMasterVO);
                        }

                        sensorCodeArr.add(sensorMasterVO);

                        gSensorNo++;
                    }

                    if(tagMasterVO.getQueryStatus().equals("I")) {
                        tagManagementDAO.insertTagMasterInfo(tagMasterVO);
                    } else if (tagMasterVO.getQueryStatus().equals("U")) {
                        tagManagementDAO.updateTagMasterInfo(tagMasterVO);
                    }

                    gTagNo++;

                    if(tagName.equals("X_Axis_RMS_Velocity_mm") || tagName.equals("Z_Axis_RMS_Velocity_mm") || tagName.equals("X_Axis_Peak_Acceleration") || tagName.equals("Z_Axis_Peak_Acceleration") || tagName.equals("Temperature_C")) {
                        AlarmMasterVO alarmMasterVO = new AlarmMasterVO();

                        String alarmCode = null;

                        alarmMasterVO.setAlarmNo(gAlarmNo);
                        alarmMasterVO.setTagCode(tagCode);

                        alarmCode = alarmManagementDAO.selectAlarmCodeBytagCode(tagCode);

                        if(alarmCode != null) {
                            alarmMasterVO.setAlarmCode(alarmCode);
                            alarmMasterVO.setUpdateUser(createUser);

                            alarmMasterVO.setQueryStatus("U");
                        } else {
                            alarmMasterVO.setAlarmCode(CodeUtil.getCode("AL", gAlarmNo));
                            alarmMasterVO.setCreateUser(createUser);

                            alarmMasterVO.setQueryStatus("I");
                        }

                        alarmMasterVO.setAlarmName(tagName+"_Alarm");

                        if(alarmMasterVO.getQueryStatus().equals("I")) {
                            alarmMasterVO.setWarningValue("0");
                            alarmMasterVO.setAlarmValue("0");
                            alarmMasterVO.setAlarmStatus(0);

                            alarmManagementDAO.insertAlarmMasterInfo(alarmMasterVO);
                        } else if (alarmMasterVO.getQueryStatus().equals("U")) {
                            alarmMasterVO.setWarningValue(null);
                            alarmMasterVO.setAlarmValue(null);
                            alarmMasterVO.setAlarmStatus(0);

                            alarmManagementDAO.updateAlarmMasterInfo(alarmMasterVO);
                        }

                        gAlarmNo++;
                    }
                }
            }
        }

        return tagMasterList;
    }

    @Transactional
    @Override
    public ModelAndView insertTagMasterInfo(CommonCommandMap commonCommandMap) {
        ModelAndView mv = new ModelAndView("jsonView");

        String resultStatus = null;
        String resultMessage = null;

        ModelMapper modelMapper = new ModelMapper();
        TagMasterVO tagMasterVO = modelMapper.map(commonCommandMap.getMap(), TagMasterVO.class);

        TagMasterVO tempTagMasterVO = null;

        try {
            tempTagMasterVO = tagManagementDAO.selectTagCount(tagMasterVO);

            tagMasterVO.setTagNo(tempTagMasterVO.getTagNo());
            tagMasterVO.setTagCode(CodeUtil.getCode("TC", tempTagMasterVO.getTagNo()));
        } catch (Exception e) {
            e.printStackTrace();

            TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();

            resultStatus = "3";
            resultMessage = "[ERR_TMSI_ITMI_0001]<br>태그 정보 등록에 실패하였습니다.<br>관리자에게 문의하세요.";

            mv.addObject("resultStatus", resultStatus);
            mv.addObject("resultMessage", resultMessage);

            return mv;
        }

        try {
            tagManagementDAO.insertTagMasterInfo(tagMasterVO);

            resultStatus = "1";
            resultMessage = "태그 정보 등록이 완료되었습니다.";
        } catch (Exception e) {
            e.printStackTrace();

            TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();

            resultStatus = "3";
            resultMessage = "[ERR_TMSI_ITMI_0002]<br>태그 정보 등록에 실패하였습니다.<br>관리자에게 문의하세요.";

            mv.addObject("resultStatus", resultStatus);
            mv.addObject("resultMessage", resultMessage);

            return mv;
        }

        mv.addObject("resultStatus", resultStatus);
        mv.addObject("resultMessage", resultMessage);

        return mv;
    }

    @Override
    public ModelAndView updateTagMasterInfo(CommonCommandMap commonCommandMap) {
        ModelAndView mv = new ModelAndView("jsonView");

        String resultStatus = null;
        String resultMessage = null;

        ModelMapper modelMapper = new ModelMapper();
        TagMasterVO tagMasterVO = modelMapper.map(commonCommandMap.getMap(), TagMasterVO.class);

        try {
            tagManagementDAO.updateTagMasterInfo(tagMasterVO);

            resultStatus = "1";
            resultMessage = "태그 정보 수정이 완료되었습니다.";
        } catch (Exception e) {
            e.printStackTrace();

            TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();

            resultStatus = "3";
            resultMessage = "[ERR_TMSI_ITMI_0002]<br>태그 정보 수정에 실패하였습니다.<br>관리자에게 문의하세요.";

            mv.addObject("resultStatus", resultStatus);
            mv.addObject("resultMessage", resultMessage);

            return mv;
        }

        mv.addObject("resultStatus", resultStatus);
        mv.addObject("resultMessage", resultMessage);

        return mv;
    }

    @Override
    public ModelAndView deleteTagMasterList(CommonCommandMap commonCommandMap) {
        ModelAndView mv = new ModelAndView("jsonView");

        ModelMapper modelMapper = new ModelMapper();
        TagMasterVO tagMasterVO = null;

        String resultStatus = null;
        String resultMessage = null;

        Iterator<Map.Entry<String, Object>> iterator = commonCommandMap.getMap().entrySet().iterator();
        Map.Entry<String, Object> entry = null;

        while (iterator.hasNext()) {
            entry = iterator.next();

            if (entry.getKey().equals("tagMasterList")) {
                JSONArray tagMasterArray = JsonUtil.jsonStringtoJsonArray(entry.getValue());
                JSONObject tagMasterObject = null;

                for (int i = 0; i < tagMasterArray.length(); i++)
                {
                    try {
                        tagMasterObject = tagMasterArray.getJSONObject(i);

                        tagMasterVO = modelMapper.map(JsonUtil.jsonObjectToMap(tagMasterObject), TagMasterVO.class);

                        tagManagementDAO.deleteTagMasterInfo(tagMasterVO);
                    } catch (JSONException e) {
                        e.printStackTrace();
                    }  catch (Exception e) {
                        e.printStackTrace();

                        TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();

                        resultStatus = "3";
                        resultMessage = "[ERR_SMSI_DSML_0001]<br>태그 정보 삭제 중 오류가 발생하였습니다.<br>관리자에게 문의하세요.";

                        mv.addObject("resultStatus", resultStatus);
                        mv.addObject("resultMessage", resultMessage);

                        return mv;
                    }
                }
            }
        }

        resultStatus = "1";
        resultMessage = "태그 정보 삭제가 완료되었습니다.";

        mv.addObject("resultStatus", resultStatus);
        mv.addObject("resultMessage", resultMessage);

        return mv;
    }
}

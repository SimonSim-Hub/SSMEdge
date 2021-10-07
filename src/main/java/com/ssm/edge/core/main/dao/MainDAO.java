package com.ssm.edge.core.main.dao;

import com.ssm.edge.core.database.postgreSql.dao.PostgresqlAbstractDAO;
import com.ssm.edge.core.main.vo.*;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;
import java.util.Map;

@Repository("mainDAO")
public class MainDAO extends PostgresqlAbstractDAO {
    public String selectTagLowDataMinDate() throws Exception {
        return (String) selectOne("com.ssm.edge.core.main.selectTagLowDataMinDate");
    }

    public List<VibrationSensorLowDataVO> selectVibrationSensorLowDataGrouppingList(VibrationSensorLowDataVO vibrationSensorLowDataVO) throws Exception {
        return (List<VibrationSensorLowDataVO>) selectList("com.ssm.edge.core.main.selectVibrationSensorLowDataGrouppingList", vibrationSensorLowDataVO);
    }

    public void deleteVibrationSensorLowDataGrouppingList(VibrationSensorLowDataVO vibrationSensorLowDataVO) throws Exception {
        delete("com.ssm.edge.core.main.deleteVibrationSensorLowDataGrouppingList", vibrationSensorLowDataVO);
    }

    public int selectSensorCount(Map<String, String> selectSensorCountMap) throws Exception {
        return (int) selectOne("com.ssm.edge.core.main.selectSensorCount", selectSensorCountMap);
    }

    public MasterCodeVO selectMasterCode(String sensorCode) throws Exception {
        return (MasterCodeVO) selectOne("com.ssm.edge.core.main.selectMasterCode", sensorCode);
    }

    public void insertVibrationSensorLowDataHotList(VibrationSensorLowDataVO insertVibrationSensorLowDataVO) throws Exception {
        insert("com.ssm.edge.core.main.insertVibrationSensorLowDataHotList", insertVibrationSensorLowDataVO);
    }

    public int selectVibrationSensorLowDataHotListCount() throws Exception {
        return (int) selectOne("com.ssm.edge.core.main.selectVibrationSensorLowDataHotListCount");
    }

    public Date selectVibrationSensorLowDataHotListMinDate(int dataCount) throws Exception {
        return (Date) selectOne("com.ssm.edge.core.main.selectVibrationSensorLowDataHotListMinDate", dataCount);
    }

    public void deleteVibrationSensorLowDataHotList(Date minDate) throws Exception {
        delete("com.ssm.edge.core.main.deleteVibrationSensorLowDataHotList", minDate);
    }

    public List<VibrationSensorLowDataVO> selectVibrationSensorLowDataLastCountList(Map<String, String> selectVibrationSensorLowDataLastCountListMap) {
        return (List<VibrationSensorLowDataVO>)selectList("com.ssm.edge.core.main.selectVibrationSensorLowDataLastCountList", selectVibrationSensorLowDataLastCountListMap);
    }

    public int selectVibrationSensorLowDataCount() throws Exception {
        return (int) selectOne("com.ssm.edge.core.main.selectVibrationSensorLowDataCount");
    }

    public TagLowDataThreadDelayVO selectTagLowDataThreadDelay() throws Exception {
        return (TagLowDataThreadDelayVO) selectOne("com.ssm.edge.core.main.selectTagLowDataThreadDelay");
    }

    public void updateTagLowDataThreadDelay(long l) throws Exception {
        update("com.ssm.edge.core.main.updateTagLowDataThreadDelay", l);
    }

    public ServerSettingVO selectSystemSetting() throws Exception {
        return (ServerSettingVO) selectOne("com.ssm.edge.core.main.selectSystemSetting");
    }

    public void insertDefaultThreadDelay() {
        insert("com.ssm.edge.core.main.insertDefaultThreadDelay", null);
    }

    public void insertDefaultSystemSetting() throws Exception {
        insert("com.ssm.edge.core.main.insertDefaultSystemSetting", null);
    }

    public void updateDefaultSystemSetting(Map<String, Integer> systemSettingMap) {
        insert("com.ssm.edge.core.main.updateDefaultSystemSetting", systemSettingMap);
    }



    // 두산 인프라코어 Mssql DB가 없어 임시로 Postgresql DB에 이력 데이터 저장
    public void insertVibrationSensorLowDataGrouppingList(VibrationSensorLowDataVO insertVibrationSensorLowDataVO) throws Exception {
        insert("com.ssm.edge.core.main.insertVibrationSensorLowDataGrouppingList", insertVibrationSensorLowDataVO);
    }

    public List<VibrationSensorLowDataVO> selectVibrationSensorReportDataList(Map<String, String> selectTagLowDataLastCountListMap) {
        return (List<VibrationSensorLowDataVO>)selectList("com.ssm.edge.core.main.selectVibrationSensorReportDataList", selectTagLowDataLastCountListMap);
    }

    public CountAndDateVO selectVibrationSensorReportDataListCountAndDate(Map<String, String> selectTagLowDataLastCountListMap) {
        return (CountAndDateVO) selectOne("com.ssm.edge.core.main.selectVibrationSensorReportDataListCountAndDate", selectTagLowDataLastCountListMap);
    }

    public List<VibrationSensorLowDataVO> selectVibrationSensorReportDataLastCountList(Map<String, String> selectTagLowDataLastCountListMap) {
        return (List<VibrationSensorLowDataVO>)selectList("com.ssm.edge.core.main.selectVibrationSensorReportDataLastCountList", selectTagLowDataLastCountListMap);
    }
}
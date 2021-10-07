package com.ssm.edge.core.main.dao;

import com.ssm.edge.core.database.msSql.dao.MsSqlAbstractDAO;
import com.ssm.edge.core.main.vo.VibrationSensorLowDataVO;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository("mainMssqlDAO")
public class MainMssqlDAO extends MsSqlAbstractDAO {
    public void insertVibrationSensorLowDataGrouppingList(VibrationSensorLowDataVO insertVibrationSensorLowDataVO) throws Exception {
        insert("com.ssm.edge.core.main.insertVibrationSensorLowDataGrouppingList", insertVibrationSensorLowDataVO);
    }

    public List<VibrationSensorLowDataVO> selectVibrationSensorReportDataList(Map<String, String> selectTagLowDataLastCountListMap) {
        return (List<VibrationSensorLowDataVO>)selectList("com.ssm.edge.core.main.selectVibrationSensorReportDataList", selectTagLowDataLastCountListMap);
    }

    public Map<String, String> selectVibrationSensorReportDataListCountAndDate(Map<String, String> selectTagLowDataLastCountListMap) {
        return (Map<String, String>) selectOne("com.ssm.edge.core.main.selectVibrationSensorReportDataListCountAndDate", selectTagLowDataLastCountListMap);
    }

    public List<VibrationSensorLowDataVO> selectVibrationSensorReportDataLastCountList(Map<String, String> selectTagLowDataLastCountListMap) {
        return (List<VibrationSensorLowDataVO>)selectList("com.ssm.edge.core.main.selectVibrationSensorReportDataLastCountList", selectTagLowDataLastCountListMap);
    }
}
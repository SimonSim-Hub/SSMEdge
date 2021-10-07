package com.ssm.edge.turck.admin.sensorManagement.dao;

import com.ssm.edge.core.database.postgreSql.dao.PostgresqlAbstractDAO;
import com.ssm.edge.turck.admin.sensorManagement.vo.SensorMasterVO;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("sensorManagementDAO")
public class SensorManagementDAO extends PostgresqlAbstractDAO {
    public List<SensorMasterVO> selectSensorMasterList(SensorMasterVO sensorMasterVO) throws Exception {
        return (List<SensorMasterVO>) selectList("com.ssm.edge.turck.admin.sensorManagement.selectSensorMasterList", sensorMasterVO);
    }

    public void insertSensorMasterInfo(SensorMasterVO tempSensorMasterVO) throws Exception {
        insert("com.ssm.edge.turck.admin.sensorManagement.insertSensorMasterInfo", tempSensorMasterVO);
    }

    public void updateSensorMasterInfo(SensorMasterVO sensorMasterVO) throws Exception {
        update("com.ssm.edge.turck.admin.sensorManagement.updateSensorMasterInfo", sensorMasterVO);
    }

    public void deleteSensorMasterInfo(SensorMasterVO sensorMasterVO) throws Exception {
        delete("com.ssm.edge.turck.admin.sensorManagement.deleteSensorMasterInfo", sensorMasterVO);
    }

    public void deleteSensorMasterByDeviceCode(SensorMasterVO sensorMasterVO) throws Exception {
        delete("com.ssm.edge.turck.admin.sensorManagement.deleteSensorMasterByDeviceCode", sensorMasterVO);
    }

    public String selectSensorCodeBySensorFullname(String sensorFullname) throws Exception {
        return (String) selectOne("com.ssm.edge.turck.admin.sensorManagement.selectSensorCodeBySensorFullname", sensorFullname);
    }
}

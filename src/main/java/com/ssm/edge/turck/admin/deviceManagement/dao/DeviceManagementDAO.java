package com.ssm.edge.turck.admin.deviceManagement.dao;

import com.ssm.edge.core.database.postgreSql.dao.PostgresqlAbstractDAO;
import com.ssm.edge.turck.admin.deviceManagement.vo.DeviceMasterVO;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("deviceManagementDAO")
public class DeviceManagementDAO extends PostgresqlAbstractDAO {
    public List<DeviceMasterVO> selectDeviceMasterList(DeviceMasterVO deviceMasterVO) throws Exception {
        return (List<DeviceMasterVO>) selectList("com.ssm.edge.turck.admin.deviceManagement.selectDeviceMasterList", deviceMasterVO);
    }

    public void insertDeviceMasterInfo(DeviceMasterVO tempDeviceMasterVO) throws Exception {
        insert("com.ssm.edge.turck.admin.deviceManagement.insertDeviceMasterInfo", tempDeviceMasterVO);
    }

    public void updateDeviceMasterInfo(DeviceMasterVO deviceMasterVO) throws Exception {
        update("com.ssm.edge.turck.admin.deviceManagement.updateDeviceMasterInfo", deviceMasterVO);
    }

    public void deleteDeviceMasterInfo(DeviceMasterVO deviceMasterVO) throws Exception {
        delete("com.ssm.edge.turck.admin.deviceManagement.deleteDeviceMasterInfo", deviceMasterVO);
    }

    public String selectDeviceCodeByDeviceFullname(String deviceFullname) throws Exception {
        return (String) selectOne("com.ssm.edge.turck.admin.deviceManagement.selectDeviceCodeByDeviceFullname", deviceFullname);
    }
}

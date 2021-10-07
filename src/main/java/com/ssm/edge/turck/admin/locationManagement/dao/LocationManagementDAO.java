package com.ssm.edge.turck.admin.locationManagement.dao;

import com.ssm.edge.core.database.postgreSql.dao.PostgresqlAbstractDAO;
import com.ssm.edge.turck.admin.locationManagement.vo.LocationMasterVO;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("locationManagementDAO")
public class LocationManagementDAO extends PostgresqlAbstractDAO {
    public List<?> selectLocationMasterList(LocationMasterVO locationMasterVO) throws Exception {
        return (List<LocationMasterVO>) selectList("com.ssm.edge.turck.admin.locationManagement.selectLocationMasterList", locationMasterVO);
    }

    public int selectLocationMasterMaxCount() throws Exception {
        return (int) selectOne("com.ssm.edge.turck.admin.locationManagement.selectLocationMasterMaxCount");
    }

    public void insertLocationMasterInfo(LocationMasterVO locationMasterVO) throws Exception {
        insert("com.ssm.edge.turck.admin.locationManagement.insertLocationMasterInfo", locationMasterVO);
    }

    public void updateLocationMasterInfo(LocationMasterVO locationMasterVO) throws Exception {
        update("com.ssm.edge.turck.admin.locationManagement.updateLocationMasterInfo", locationMasterVO);
    }

    public void deleteLocationMasterInfo(LocationMasterVO locationMasterVO) throws Exception {
        delete("com.ssm.edge.turck.admin.locationManagement.deleteLocationMasterInfo", locationMasterVO);
    }
}

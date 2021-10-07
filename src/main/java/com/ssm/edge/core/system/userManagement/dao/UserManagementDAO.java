package com.ssm.edge.core.system.userManagement.dao;

import com.ssm.edge.core.database.postgreSql.dao.PostgresqlAbstractDAO;
import com.ssm.edge.core.system.userManagement.vo.UserMasterVO;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("userManagementDAO")
public class UserManagementDAO extends PostgresqlAbstractDAO {
    public List<UserMasterVO> selectUserMasterList(UserMasterVO userMasterVO) throws Exception {
        return (List<UserMasterVO>) selectList("com.ssm.edge.core.system.userManagement.selectUserMasterList", userMasterVO);
    }

    public void insertUserMasterInfo(UserMasterVO userMasterVO) throws Exception {
        insert("com.ssm.edge.core.system.userManagement.insertUserMasterInfo", userMasterVO);
    }

    public void updateUserMasterInfo(UserMasterVO userMasterVO) throws Exception {
        update("com.ssm.edge.core.system.userManagement.updateUserMasterInfo", userMasterVO);
    }

    public void deleteUserMasterInfo(UserMasterVO userMasterVO) throws Exception {
        delete("com.ssm.edge.core.system.userManagement.deleteUserMasterInfo", userMasterVO);
    }
}

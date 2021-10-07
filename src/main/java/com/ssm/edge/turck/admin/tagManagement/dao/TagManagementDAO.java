package com.ssm.edge.turck.admin.tagManagement.dao;

import com.ssm.edge.core.database.postgreSql.dao.PostgresqlAbstractDAO;
import com.ssm.edge.turck.admin.tagManagement.vo.TagMasterVO;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("tagManagementDAO")
public class TagManagementDAO extends PostgresqlAbstractDAO {
    public List<TagMasterVO> selectTagMasterList(TagMasterVO tagMasterVO) throws Exception {
        return (List<TagMasterVO>) selectList("com.ssm.edge.turck.admin.tagManagement.selectTagMasterList", tagMasterVO);
    }

    public void deleteTagMasterInfo(TagMasterVO tagMasterVO) throws Exception {
        delete("com.ssm.edge.turck.admin.tagManagement.deleteTagMasterInfo", tagMasterVO);
    }

    public void insertTagMasterInfo(TagMasterVO tagMasterVO) throws Exception {
        insert("com.ssm.edge.turck.admin.tagManagement.insertTagMasterInfo", tagMasterVO);
    }

    public TagMasterVO selectTagCount(TagMasterVO tagMasterVO) throws Exception {
        return (TagMasterVO) selectOne("com.ssm.edge.turck.admin.tagManagement.selectTagCount", tagMasterVO);
    }

    public void deleteTagMasterByDeviceCode(TagMasterVO tagMasterVO) throws Exception {
        delete("com.ssm.edge.turck.admin.tagManagement.deleteTagMasterByDeviceCode", tagMasterVO);
    }

    public void deleteTagMasterBySensorCode(TagMasterVO tagMasterVO) throws Exception {
        delete("com.ssm.edge.turck.admin.tagManagement.deleteTagMasterBySensorCode", tagMasterVO);
    }

    public void updateTagMasterInfo(TagMasterVO tagMasterVO) throws Exception {
        update("com.ssm.edge.turck.admin.tagManagement.updateTagMasterInfo", tagMasterVO);
    }

    public String selectTagCodeByTagFullname(String tagFullname) throws Exception {
        return (String) selectOne("com.ssm.edge.turck.admin.tagManagement.selectTagCodeByTagFullname", tagFullname);
    }
}

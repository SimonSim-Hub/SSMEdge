package com.ssm.edge.turck.admin.alarmManagement.dao;

import com.ssm.edge.core.database.postgreSql.dao.PostgresqlAbstractDAO;
import com.ssm.edge.turck.admin.alarmManagement.vo.AlarmMasterSelectVO;
import com.ssm.edge.turck.admin.alarmManagement.vo.AlarmMasterVO;
import com.ssm.edge.turck.admin.alarmManagement.vo.RealtimeAlarmMasterVO;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("alarmManagementDAO")
public class AlarmManagementDAO extends PostgresqlAbstractDAO {
    public List<AlarmMasterVO> selectAlarmMasterList(AlarmMasterVO alarmMasterVO) throws Exception {
        return (List<AlarmMasterVO>) selectList("com.ssm.edge.turck.admin.alarmManagement.selectAlarmMasterList", alarmMasterVO);
    }

    public int selectAlarmMasterMaxCount() throws Exception {
        return (int) selectOne("com.ssm.edge.turck.admin.alarmManagement.selectAlarmMasterMaxCount");
    }

    public void updateAlarmMasterInfo(AlarmMasterVO alarmMasterVO) throws Exception {
        update("com.ssm.edge.turck.admin.alarmManagement.updateAlarmMasterInfo", alarmMasterVO);
    }

    public void insertAlarmMasterInfo(AlarmMasterVO alarmMasterVO) throws Exception {
        insert("com.ssm.edge.turck.admin.alarmManagement.insertAlarmMasterInfo", alarmMasterVO);
    }

    public String selectAlarmCodeBytagCode(String tagCode) throws Exception {
        return (String) selectOne("com.ssm.edge.turck.admin.alarmManagement.selectAlarmCodeBytagCode", tagCode);
    }

    public List<RealtimeAlarmMasterVO> selectRealtimeAlarmMasterList(AlarmMasterVO alarmMasterVO) throws Exception {
        return (List<RealtimeAlarmMasterVO>) selectList("com.ssm.edge.turck.admin.alarmManagement.selectRealtimeAlarmMasterList", alarmMasterVO);
    }

    public List<AlarmMasterVO> selectAlarmStatus() throws Exception {
        return (List<AlarmMasterVO>) selectList("com.ssm.edge.turck.admin.alarmManagement.selectAlarmStatus");
    }

    public int selectAlarmHistoryMaxAlarmStatus(AlarmMasterVO alarmMasterVO) throws Exception {
        return (int) selectOne("com.ssm.edge.turck.admin.alarmManagement.selectAlarmHistoryMaxAlarmStatus", alarmMasterVO);
    }

    public void insertAlarmHistory(AlarmMasterVO alarmMasterVO) throws Exception {
        insert("com.ssm.edge.turck.admin.alarmManagement.insertAlarmHistory", alarmMasterVO);
    }

    public void updateAlarmHistoryClearStatus(AlarmMasterVO alarmMasterVO) throws Exception {
        update("com.ssm.edge.turck.admin.alarmManagement.updateAlarmHistoryClearStatus", alarmMasterVO);
    }

    public AlarmMasterVO selectAlarmHistoryStartEndDate(AlarmMasterSelectVO alarmMasterSelectVO) throws Exception {
        return (AlarmMasterVO) selectOne("com.ssm.edge.turck.admin.alarmManagement.selectAlarmHistoryStartEndDate", alarmMasterSelectVO);
    }

    public void updateAlarmHistoryConfirmStatus(AlarmMasterSelectVO alarmMasterSelectVO) throws Exception {
        update("com.ssm.edge.turck.admin.alarmManagement.updateAlarmHistoryConfirmStatus", alarmMasterSelectVO);
    }

    public List<AlarmMasterVO> selectAlarmHistoryList(AlarmMasterSelectVO alarmMasterSelectVO) throws Exception {
        return (List<AlarmMasterVO>) selectList("com.ssm.edge.turck.admin.alarmManagement.selectAlarmHistoryList", alarmMasterSelectVO);
    }

    public List<AlarmMasterSelectVO> selectAlarmSensorCount() throws Exception {
        return (List<AlarmMasterSelectVO>) selectList("com.ssm.edge.turck.admin.alarmManagement.selectAlarmSensorCount");
    }
}

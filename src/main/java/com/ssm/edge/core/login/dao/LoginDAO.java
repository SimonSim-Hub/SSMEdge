package com.ssm.edge.core.login.dao;

import com.ssm.edge.core.system.userManagement.vo.UserMasterVO;
import org.springframework.stereotype.Repository;

import com.ssm.edge.core.database.postgreSql.dao.PostgresqlAbstractDAO;

@Repository("loginDAO")
public class LoginDAO extends PostgresqlAbstractDAO {
	public int selectUserIdCount(UserMasterVO userMasterVO) throws Exception {
		int result = 0;
		
		result = (Integer) selectOne("com.ssm.edge.core.login.selectUserIdCount", userMasterVO);
		
		return result;
	}

	public int selectUserEmailCount(UserMasterVO userMasterVO) throws Exception {
		int result = 0;
		
		result = (Integer) selectOne("com.ssm.edge.core.login.selectUserEmailCount", userMasterVO);
		
		return result;
	}

	public void insertUserMaster(UserMasterVO userMasterVO) throws Exception {
		insert("com.ssm.edge.core.login.insertUserMaster", userMasterVO);
	}

	public String selectUserId(UserMasterVO userMasterVO) throws Exception {
		String resultString = "";

		resultString = (String)selectOne("com.ssm.edge.core.login.selectUserId", userMasterVO);
		
		return resultString;
	}

	public void updateUserPassword(UserMasterVO userMasterVO) throws Exception {
		update("com.ssm.edge.core.login.updateUserPassword", userMasterVO);
	}

	public UserMasterVO selectUserInfo(UserMasterVO userMasterVO) throws Exception {
		UserMasterVO resultVO;

		resultVO = (UserMasterVO) selectOne("com.ssm.edge.core.login.selectUserInfo", userMasterVO);
		
		return resultVO;
	}

	public UserMasterVO selectUserById(String userId) throws Exception {
		UserMasterVO resultVO;

		resultVO = (UserMasterVO) selectOne("com.ssm.edge.core.login.selectUserById", userId);
		
		return resultVO;
	}
}

package com.ssm.edge.core.database.msSql.dao;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.logging.Log;
import org.apache.ibatis.logging.LogFactory;
import org.apache.ibatis.session.SqlSession;

public class MsSqlAbstractDAO {
    protected Log log = LogFactory.getLog(MsSqlAbstractDAO.class);

    @Resource(name = "mssqlSession")
    private SqlSession mssqlSession;

    protected void printQueryId(String queryId) {
        if (log.isDebugEnabled()) {
            if (!queryId.equals("")) {
                log.debug("\t QueryId  \t:  " + queryId);
            }
        }
    }

    public Object insert(String queryId, Object params) {
        printQueryId(queryId);
        return mssqlSession.insert(queryId, params);
    }

    public Object update(String queryId, Object params) {
        printQueryId(queryId);
        return mssqlSession.update(queryId, params);
    }

    public Object delete(String queryId, Object params) {
        printQueryId(queryId);
        return mssqlSession.delete(queryId, params);
    }

    public Object selectOne(String queryId) {
        printQueryId(queryId);
        return mssqlSession.selectOne(queryId);
    }

    public Object selectOne(String queryId, Object params) {
        printQueryId(queryId);
        return mssqlSession.selectOne(queryId, params);
    }

    @SuppressWarnings("rawtypes")
    public List selectList(String queryId) {
        printQueryId(queryId);
        return mssqlSession.selectList(queryId);
    }

    @SuppressWarnings("rawtypes")
    public List selectList(String queryId, Object params) {
        printQueryId(queryId);
        return mssqlSession.selectList(queryId, params);
    }
}

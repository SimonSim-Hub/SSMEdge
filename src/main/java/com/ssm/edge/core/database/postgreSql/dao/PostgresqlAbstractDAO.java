package com.ssm.edge.core.database.postgreSql.dao;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.logging.Log;
import org.apache.ibatis.logging.LogFactory;
import org.apache.ibatis.session.SqlSession;

public class PostgresqlAbstractDAO {
    protected Log log = LogFactory.getLog(PostgresqlAbstractDAO.class);

    @Resource(name = "postgresqlSession")
    private SqlSession postgresqlSession;

    protected void printQueryId(String queryId) {
        if (log.isDebugEnabled()) {
            if (!queryId.equals("")) {
                log.debug("\t QueryId  \t:  " + queryId);
            }
        }
    }

    public Object insert(String queryId, Object params) {
        printQueryId(queryId);
        return postgresqlSession.insert(queryId, params);
    }

    public Object update(String queryId, Object params) {
        printQueryId(queryId);
        return postgresqlSession.update(queryId, params);
    }

    public Object delete(String queryId, Object params) {
        printQueryId(queryId);
        return postgresqlSession.delete(queryId, params);
    }

    public Object selectOne(String queryId) {
        printQueryId(queryId);
        return postgresqlSession.selectOne(queryId);
    }

    public Object selectOne(String queryId, Object params) {
        printQueryId(queryId);
        return postgresqlSession.selectOne(queryId, params);
    }

    @SuppressWarnings("rawtypes")
    public List selectList(String queryId) {
        printQueryId(queryId);
        return postgresqlSession.selectList(queryId);
    }

    @SuppressWarnings("rawtypes")
    public List selectList(String queryId, Object params) {
        printQueryId(queryId);
        return postgresqlSession.selectList(queryId, params);
    }
}

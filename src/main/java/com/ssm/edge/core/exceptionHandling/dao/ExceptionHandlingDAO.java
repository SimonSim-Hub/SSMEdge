package com.ssm.edge.core.exceptionHandling.dao;

import com.ssm.edge.core.database.postgreSql.dao.PostgresqlAbstractDAO;
import com.ssm.edge.core.exceptionHandling.vo.ExceptionHandlingVO;
import org.springframework.stereotype.Service;

@Service("exceptionHandlingDAO")
public class ExceptionHandlingDAO extends PostgresqlAbstractDAO {
    public void insertErrorMessage(ExceptionHandlingVO exceptionHandlingVO) throws Exception {
        System.out.println("CCCCCCCCCCCCC : " + exceptionHandlingVO.toString());
        insert("com.ssm.edge.core.exceptionHandling.insertErrorMessage", exceptionHandlingVO);
    }
}

package com.ssm.edge.core.database.postgreSql.config;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;
import org.springframework.core.io.Resource;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;

@Configuration
public class PostgresqlMybatisConfig {
    @Autowired
    @Qualifier(value = "postgresqlDataSource")
    private DataSource postgresqlDataSource;


    @Bean
    public SqlSessionFactory postgresqlSessionFactory() throws Exception {
        SqlSessionFactoryBean sqlSessionFactoryBean = new SqlSessionFactoryBean();

        sqlSessionFactoryBean.setDataSource(postgresqlDataSource);

        Resource[] resources = new PathMatchingResourcePatternResolver()
                .getResources("classpath*:mapper/postgresqlMapper/**/*Mapper.xml");
        sqlSessionFactoryBean.setMapperLocations(resources);
        sqlSessionFactoryBean.setTypeAliasesPackage("com.ssm.edge.**.mapper.postgresqlMapper");

        SqlSessionFactory sqlSessionFactory = sqlSessionFactoryBean.getObject();

        org.apache.ibatis.session.Configuration configuration = sqlSessionFactory.getConfiguration();

        configuration.setMapUnderscoreToCamelCase(true);

        return sqlSessionFactory;
    }

    @Bean
    @Primary
    public SqlSession postgresqlSession() throws Exception {
        return new SqlSessionTemplate(postgresqlSessionFactory());
    }
}

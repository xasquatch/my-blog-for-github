package net.xasquatch.myblog.config;

import net.xasquatch.myblog.mapper.BoardMapper;
import net.xasquatch.myblog.mapper.UserMapper;
import org.apache.commons.dbcp2.BasicDataSource;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.mapper.MapperFactoryBean;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;
import org.springframework.context.annotation.PropertySource;
import org.springframework.context.support.ReloadableResourceBundleMessageSource;
import org.springframework.web.multipart.support.StandardServletMultipartResolver;

//@Import({SecurityConfig.class})
@Configuration
@PropertySource("/WEB-INF/properties/db/db.properties")
public class RootAppContext {

/*--------TODO:DB접속관리--------------*/
    @Value("${db.classname}")
    private String dbClassName;
    @Value("${db.url}")
    private String dbUrl;
    @Value("${db.username}")
    private String dbUsername;
    @Value("${db.password}")
    private String dbPassword;

    @Bean
    public BasicDataSource dataSource() {
        BasicDataSource basicDataSource = new BasicDataSource();
        basicDataSource.setDriverClassName(dbClassName);
        basicDataSource.setUrl(dbUrl);
        basicDataSource.setUsername(dbUsername);
        basicDataSource.setPassword(dbPassword);

        return basicDataSource;
    }

    @Bean
    public SqlSessionFactory factory(BasicDataSource basicDataSource) throws Exception {
        SqlSessionFactoryBean sqlSessionFactoryBean = new SqlSessionFactoryBean();
        sqlSessionFactoryBean.setDataSource(basicDataSource);
//        SqlSessionFactory sqlSessionFactory = sqlSessionFactoryBean.getObject();

        return sqlSessionFactoryBean.getObject();

    }

    @Bean
    public MapperFactoryBean<UserMapper> getUserMapper(SqlSessionFactory factory){
        MapperFactoryBean<UserMapper> factoryBean = new MapperFactoryBean<UserMapper>(UserMapper.class);
        factoryBean.setSqlSessionFactory(factory);
        return factoryBean;

    }

    @Bean
    public MapperFactoryBean<BoardMapper> getBoardMapper(SqlSessionFactory factory){
        MapperFactoryBean<BoardMapper> factoryBean = new MapperFactoryBean<BoardMapper>(BoardMapper.class);
        factoryBean.setSqlSessionFactory(factory);
        return factoryBean;

    }


//------------------------------------------------------

    @Bean
    public ReloadableResourceBundleMessageSource msgSource() {
        ReloadableResourceBundleMessageSource msg = new ReloadableResourceBundleMessageSource();
        msg.setBasenames("/WEB-INF/properties/home/login",
                "/WEB-INF/properties/home/signUp");

        return msg;
    }

    @Bean
    public StandardServletMultipartResolver multipartResolver() {
        return new StandardServletMultipartResolver();
    }

//------------------------------------------------------


}

package net.xasquatch.myblog.config;

import net.xasquatch.myblog.mapper.BoardMapper;
import net.xasquatch.myblog.mapper.MemberMapper;
import net.xasquatch.myblog.model.Member;
import org.apache.commons.dbcp2.BasicDataSource;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.mapper.MapperFactoryBean;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.context.support.ReloadableResourceBundleMessageSource;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.web.context.annotation.ApplicationScope;
import org.springframework.web.context.annotation.SessionScope;
import org.springframework.web.multipart.MultipartResolver;
import org.springframework.web.multipart.support.StandardServletMultipartResolver;

import java.util.Hashtable;
import java.util.Map;
import java.util.Properties;

//@Import({SecurityConfig.class})
@Configuration
@PropertySource({"/WEB-INF/properties/db/db.properties", "/WEB-INF/properties/db/email.properties"})
public class RootAppContext {

    /*--------TODO:DB 접속관리--------------*/
    @Value("${db.classname}")
    private String dbClassName;
    @Value("${db.url}")
    private String dbUrl;
    @Value("${db.username}")
    private String dbUsername;
    @Value("${db.password}")
    private String dbPassword;

    /*--------TODO:Mail 접속관리--------------*/
    @Value("${email.host}")
    private String emailHost;
    @Value("${email.port}")
    private int emailPort;
    @Value("${email.username}")
    private String emailUserName;
    @Value("${email.password}")
    private String emailPwd;


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
    public MapperFactoryBean<MemberMapper> getUserMapper(SqlSessionFactory factory) {
        MapperFactoryBean<MemberMapper> factoryBean = new MapperFactoryBean<MemberMapper>(MemberMapper.class);
        factoryBean.setSqlSessionFactory(factory);
        return factoryBean;

    }

    @Bean
    public MapperFactoryBean<BoardMapper> getBoardMapper(SqlSessionFactory factory) {
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
    public MultipartResolver multipartResolver() {
        return new StandardServletMultipartResolver();
    }


    //------------------------------------------------------
    @Bean("applicationAuthorization")
    @ApplicationScope
    public Map<String, Long> AuthorizationMap() {
        return new Hashtable<String, Long>();
    }

    //------------------------------------------------------
    @Bean("sessionMember")
    @SessionScope
    public Member loginMember() {
        return new Member();
    }

    //------------------------------------------------------
    @Bean
    public JavaMailSenderImpl mailSender() {
        JavaMailSenderImpl mailSender = new JavaMailSenderImpl();
        Properties mailProperties = new Properties();
        mailProperties.put("mail.transport.protocol", "smtp");
        mailProperties.put("mail.smtp.auth", true);
        mailProperties.put("mail.smtp.starttls.enable", true);
        mailProperties.put("mail.smtp.starttls.required", true);
        mailProperties.put("mail.debug", true);

        mailSender.setJavaMailProperties(mailProperties);
        mailSender.setDefaultEncoding("UTF-8");
        mailSender.setHost(emailHost);
        mailSender.setPort(emailPort);
        mailSender.setUsername(emailUserName);
        mailSender.setPassword(emailPwd);

        return mailSender;
    }


}

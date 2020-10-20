package net.xasquatch.myblog.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.support.ReloadableResourceBundleMessageSource;
import org.springframework.web.multipart.support.StandardServletMultipartResolver;


@Configuration
public class RootAppContext {

    @Bean
    public StandardServletMultipartResolver fileUpload() {
        return new StandardServletMultipartResolver();
    }

    @Bean
    public ReloadableResourceBundleMessageSource msgSource() {
        ReloadableResourceBundleMessageSource msg = new ReloadableResourceBundleMessageSource();
        msg.setBasenames("/WEB-INF/properties/home/login",
                "/WEB-INF/properties/home/signUp");

        return msg;
    }

    @Bean
    public StandardServletMultipartResolver multipartResolver(){

        return new StandardServletMultipartResolver();
    }


}

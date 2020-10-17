package net.xasquatch.myblog.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.support.ReloadableResourceBundleMessageSource;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

@Configuration
public class RootAppContext {

    @Bean
    public CommonsMultipartResolver fileUpload() {
        return new CommonsMultipartResolver();
    }

    @Bean
    public ReloadableResourceBundleMessageSource msgSource() {
        ReloadableResourceBundleMessageSource msg = new ReloadableResourceBundleMessageSource();
        msg.setBasenames("/WEB-INF/properties/home/login",
                "/WEB-INF/properties/home/signUp");

        return msg;
    }


}

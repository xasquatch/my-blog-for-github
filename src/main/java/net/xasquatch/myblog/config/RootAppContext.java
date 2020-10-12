package net.xasquatch.myblog.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

@Configuration
public class RootAppContext {

    @Bean
    public CommonsMultipartResolver fileUpload(){
        return new CommonsMultipartResolver();
    }

}

package net.xasquatch.myblog.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.web.filter.CharacterEncodingFilter;
import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

import javax.servlet.Filter;
import javax.servlet.MultipartConfigElement;
import javax.servlet.ServletRegistration;

public class SpringConfigClass extends AbstractAnnotationConfigDispatcherServletInitializer{


    // DispatcherServlet에 매핑할 요청 주소를 셋팅한다.
    @Override
    protected String[] getServletMappings() {
        return new String[] {"/"};
    }

    // Spring MVC 프로젝트 설정을 위한 클래스를 지정한다.
    @Override
    protected Class<?>[] getServletConfigClasses() {
        return new Class[] {ServletAppContext.class};
    }

    // 프로젝트에서 사용할 Bean들을 정의기 위한 클래스를 지정한다.
    @Override
    protected Class<?>[] getRootConfigClasses() {
        return new Class[] {RootAppContext.class};
    }

    // 파라미터 인코딩 필터 설정
    @Override
    protected Filter[] getServletFilters() {
        CharacterEncodingFilter encodingFilter = new CharacterEncodingFilter();
        encodingFilter.setEncoding("UTF-8");
        return new Filter[] {encodingFilter};
    }

    @Override
    protected void customizeRegistration(ServletRegistration.Dynamic registration) {
        super.customizeRegistration(registration);


        MultipartConfigElement configElement = new MultipartConfigElement("D:/0_EMPTY", 1024*1024*10, 1024*1024*100,0);
        registration.setMultipartConfig(configElement);

    }
}
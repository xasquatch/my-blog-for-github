package net.xasquatch.myblog.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.web.WebApplicationInitializer;
import org.springframework.web.context.ContextLoaderListener;
import org.springframework.web.context.support.AnnotationConfigWebApplicationContext;
import org.springframework.web.filter.CharacterEncodingFilter;
import org.springframework.web.servlet.DispatcherServlet;

import javax.servlet.*;
import java.util.Collections;

@PropertySource("/WEB-INF/properties/file-manager.properties")
public class SpringConfigClass implements WebApplicationInitializer {

    @Value("${files.save.path}")
    private String filesSavePath;

    @Override
    public void onStartup(ServletContext servletContext) throws ServletException {

        // Spring MVC 프로젝트 설정을 위해 작성하는 클래스의 객체를 생성한다.
        AnnotationConfigWebApplicationContext servletAppContext = new AnnotationConfigWebApplicationContext();
        servletAppContext.register(ServletAppContext.class);

        // 요청 발생 시 요청을 처리하는 서블릿을 DispatcherServlet으로 설정해준다.
        DispatcherServlet dispatcherServlet = new DispatcherServlet(servletAppContext);
        dispatcherServlet.setThrowExceptionIfNoHandlerFound(true);
        ServletRegistration.Dynamic servlet = servletContext.addServlet("dispatcher", dispatcherServlet);

        // 부가 설정
        servlet.setLoadOnStartup(1);
        servlet.addMapping("/");

        // Bean을 정의하는 클래스를 지정한다
        AnnotationConfigWebApplicationContext rootAppContext = new AnnotationConfigWebApplicationContext();
        rootAppContext.register(RootAppContext.class);

        ContextLoaderListener listener = new ContextLoaderListener(rootAppContext);
        servletContext.addListener(listener);

        // 파라미터 인코딩 설정
        FilterRegistration.Dynamic filter = servletContext.addFilter("encodingFilter", CharacterEncodingFilter.class);
        filter.setInitParameter("encoding", "UTF-8");
        filter.addMappingForServletNames(null, false, "dispatcher");

        // 멀티파일 설정
        servlet.setMultipartConfig(new MultipartConfigElement(filesSavePath, 1024 * 1024 * 1024, 1024 * 1024 * 1024, 0));
//
//        // 시큐리티 설정
//		FilterRegistration.Dynamic securityFilter = servletContext.addFilter("springSecurityFilterChain", new DelegatingFilterProxy());
//		securityFilter.addMappingForUrlPatterns(null,false,"/user/*");

//세션 리스너 설정
        servletContext.setSessionTimeout(60*60);
        servletContext.setSessionTrackingModes(Collections.singleton(SessionTrackingMode.COOKIE));



    }
}

/*

@PropertySource("/WEB-INF/properties/file-manager.properties")
public class SpringConfigClass extends AbstractAnnotationConfigDispatcherServletInitializer {

	@Value("${files.save.path}")
    private String filesSavePath;

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


        MultipartConfigElement configElement = new MultipartConfigElement(filesSavePath, 1024*1024*10, 1024*1024*100,0);
        registration.setMultipartConfig(configElement);

    }
}

*/

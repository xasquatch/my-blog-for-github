package net.xasquatch.myblog.config;

import net.xasquatch.myblog.interceptor.ControllerInterceptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.config.annotation.*;

// Spring MVC 프로젝트에 관련된 설정을 하는 클래스
@Configuration
// Controller 어노테이션이 셋팅되어 있는 클래스를 Controller로 등록한다.
@EnableWebMvc
// 스캔할 패키지를 지정한다.
@ComponentScan("net.xasquatch.myblog.config")
@ComponentScan("net.xasquatch.myblog.controller")
@ComponentScan("net.xasquatch.myblog.service")
@ComponentScan("net.xasquatch.myblog.repository")
@ComponentScan("net.xasquatch.myblog.interceptor")
public class ServletAppContext implements WebMvcConfigurer{

	@Autowired
	private HandlerInterceptor controllerInterceptor;

	// Controller의 메서드가 반환하는 jsp의 이름 앞뒤에 경로와 확장자를 붙혀주도록 설정한다.
	@Override
	public void configureViewResolvers(ViewResolverRegistry registry) {
		WebMvcConfigurer.super.configureViewResolvers(registry);
		registry.jsp("/WEB-INF/views/", ".jsp");
	}
	
	// 정적 파일의 경로를 매핑한다.
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		WebMvcConfigurer.super.addResourceHandlers(registry);
		registry.addResourceHandler("/webjars/**").addResourceLocations("/webjars/");
		registry.addResourceHandler("/**").addResourceLocations("/resources/");
	}
/*
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(controllerInterceptor)
				.addPathPatterns("/");
//				.addPathPatterns("/**");
//				.excludePathPatterns("/login");
		WebMvcConfigurer.super.addInterceptors(registry);
	}*/
}
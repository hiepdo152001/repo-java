package com.devpro.Drake.conf;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;

@Configuration
public class MVCConf implements WebMvcConfigurer{
	@Override
	public void addResourceHandlers(final ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/css/**").addResourceLocations("classpath:/css/");
		registry.addResourceHandler("/js/**") .addResourceLocations("classpath:/js/");
		registry.addResourceHandler("/images/**").addResourceLocations("classpath:/images/");
		//upload file 
		registry.addResourceHandler("/upload/**").addResourceLocations("file:"+ "D:/BE/upload/");
	}
	
	@Bean
	public ViewResolver viewResolver() {
		InternalResourceViewResolver bean =new InternalResourceViewResolver();
		bean.setViewClass(JstlView.class);
		bean.setPrefix("/WEB-INF/views/");
		bean.setSuffix(".jsp");
		return bean;
		
	}
     
}
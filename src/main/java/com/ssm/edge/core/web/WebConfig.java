package com.ssm.edge.core.web;
import java.util.List;

import com.ssm.edge.core.abstractView.ExcelDownloadView;
import com.ssm.edge.core.interceptor.CommonInterceptor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

import com.ssm.edge.core.resolver.CommonCustomMapArgumentResolver;

import javax.annotation.Resource;

@Configuration
public class WebConfig implements WebMvcConfigurer{
    @Resource(name = "commonInterceptor")
    CommonInterceptor commonInterceptor;

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(commonInterceptor)
                .addPathPatterns("/**")
                .excludePathPatterns("/resources/**");
    }

    @Override
    public void addArgumentResolvers(List<HandlerMethodArgumentResolver> resolvers) {
        resolvers.add(commonCustomMapArgumentResolver());
        WebMvcConfigurer.super.addArgumentResolvers(resolvers);
    }

    @Bean
    ExcelDownloadView excelDownloadView () {
        return new ExcelDownloadView ();
    }

    @Bean
    MappingJackson2JsonView jsonView(){
        return new MappingJackson2JsonView();
    }

    @Bean
    public CommonCustomMapArgumentResolver commonCustomMapArgumentResolver() {
        return new CommonCustomMapArgumentResolver();
    }
}
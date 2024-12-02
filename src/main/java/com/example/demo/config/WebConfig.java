package com.example.demo.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer {
    
    @SuppressWarnings("null")
    public void addViewControllers(ViewControllerRegistry registry) {
        registry.addViewController("/Home").setViewName("Home");
        registry.addViewController("/").setViewName("Home");
        registry.addViewController("/Login").setViewName("Login");
        registry.addViewController("/Hola").setViewName("Hola");
    }
}

package com.omfys.crm;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.context.annotation.Bean;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.view.UrlBasedViewResolver;
import org.springframework.web.servlet.view.tiles3.TilesConfigurer;
import org.springframework.web.servlet.view.tiles3.TilesView;

@SpringBootApplication
public class CustomerRelationshipManagementApplication extends SpringBootServletInitializer{
	
	@Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
		return application.sources(CustomerRelationshipManagementApplication.class);
	}

	public static void main(String[] args) {
		SpringApplication.run(CustomerRelationshipManagementApplication.class, args);
	}
	
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/resources/**")	
                .addResourceLocations("/resources/");
   }

//	@Bean
//	public UrlBasedViewResolver tilesViewResolver() {
//		UrlBasedViewResolver tilesViewResolver = new UrlBasedViewResolver();
//		tilesViewResolver.setViewClass(TilesView.class);
//		return tilesViewResolver;
//	}
//
//	@Bean
//	public TilesConfigurer tilesConfigurer() {
//		TilesConfigurer tilesConfigurer = new TilesConfigurer();
//		String[] defs = { "WEB-INF/tiles/tiles.xml" };
//		tilesConfigurer.setDefinitions(defs);
//		return tilesConfigurer;
//	}

}

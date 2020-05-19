package com.kjabs.springinit1.config;

import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.kjabs.springinit1.filter.Customer_login_filter;

@Configuration
public class FilterConfig {
    
	@Bean
	public FilterRegistrationBean<Customer_login_filter> registrationBean()
	{
		
		FilterRegistrationBean<Customer_login_filter> registrationBean=new FilterRegistrationBean<>();
		System.out.println("Hello");
		registrationBean.setFilter(new Customer_login_filter());
		//registrationBean.addUrlPatterns("/kjabs/profile","/kjabs/showFormForUpdate","/kjabs/editProfile","/kjabs/Review_Form");
		registrationBean.addUrlPatterns("/kjabs/Review_Form","/kjabs/profile","/kjabs/editProfile","/kjabs/showFormForUpdate","/kjabs/checkout",
				"/kjabs/placeOrder","/kjabs/Orders","/kjabs/showOrderDetailsForCustomer");
		
		return registrationBean;
		
		
	}
	
	
}

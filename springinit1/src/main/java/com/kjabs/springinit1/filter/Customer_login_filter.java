package com.kjabs.springinit1.filter;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;

@Component
public class Customer_login_filter implements Filter {
	
	private static final String[] loginRequiredURLs= {
			
			"/kjabs/showFormForUpdate","/kjabs/editProfile","/kjabs/Review_Form","/kjabs/profile","/kjabs/placeOrder"
	
	};

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		
		System.out.println("filter called");
		HttpServletRequest httpRequest=(HttpServletRequest) request;
		//HttpServletRequest httpResponse=(HttpServletRequest) response;
		HttpSession session=httpRequest.getSession(false);
		
		
		String path=httpRequest.getRequestURI().substring(httpRequest.getContextPath().length());
		
		if(path.startsWith("/Admin"))
		{
			chain.doFilter(request, response);
			return;
		}
		
		
		boolean loggedin= session!=null && session.getAttribute("LoggedCustomer")!=null;
		System.out.println("Path:"+path);
		System.out.println("loggedin"+loggedin);
		
		String requestURL1 = httpRequest.getRequestURI().toString();

		//System.out.println("Request:"+requestURL);
		//if(!loggedin && path.startsWith("/kjabs/profile"))
			
			if(!loggedin && isLoginRequired(requestURL1))
		{   
			String queryString=httpRequest.getQueryString();
			String requestURL = requestURL1.replaceFirst("/", "");
			if(queryString!=null)
			{
				requestURL=requestURL.concat("?").concat(queryString);
			}
			session.setAttribute("redirectURL", requestURL);
			String loginPage="/views/customer/login/loginMessage.jsp";
			RequestDispatcher dispatcher=httpRequest.getRequestDispatcher(loginPage);
			dispatcher.forward(request, response);
			
			
			
		}
		else
		{
			chain.doFilter(request, response);
			
		}
		
	
	}

	private boolean isLoginRequired(String requestURL1) {
		List<String> list=Arrays.asList(loginRequiredURLs);
		if(list.contains("requestURL1"))
		{
			return false;
		}
		else
		{
		return true;
		}
		
	}
	
	

}

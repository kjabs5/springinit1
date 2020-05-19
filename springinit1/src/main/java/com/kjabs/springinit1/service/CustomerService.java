package com.kjabs.springinit1.service;

import java.util.List;

import org.springframework.data.repository.query.Param;

import com.kjabs.springinit1.entity.Book;
import com.kjabs.springinit1.entity.Customer;



public interface CustomerService {
	
	public List<Customer> getAllCustomers();
	
	public void addCustomer(Customer theCustomer);
	
	public String checkemail(String email);
	
	public Customer getCustomerById(int customerId);
	
	public void delete(int customerId);
	
	public Customer checkLogin(String email, String password);
	
	

}

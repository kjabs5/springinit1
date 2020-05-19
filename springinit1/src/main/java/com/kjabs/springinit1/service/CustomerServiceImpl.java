package com.kjabs.springinit1.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.kjabs.springinit1.DAO.CustomerRepository;
import com.kjabs.springinit1.DAO.HashGenerator;
import com.kjabs.springinit1.entity.Book;
import com.kjabs.springinit1.entity.Customer;
@Service
public class CustomerServiceImpl implements CustomerService {
    private CustomerRepository customerRepository;
    
    public CustomerServiceImpl(CustomerRepository theCustomerRepository) {
    	
    	customerRepository=theCustomerRepository;
    	
    }
    
	@Override
	public List<Customer> getAllCustomers() {
		
		List<Customer> customers=customerRepository.findAll();
		return customers;
		
	}

	@Override
	public void addCustomer(Customer theCustomer) {
	    
		customerRepository.save(theCustomer);
		
	}

	@Override
	public String checkemail(String email) {
		
		String email1=customerRepository.checkemail(email);
		
		return email1;
	}

	@Override
	public Customer getCustomerById(int customerId) {
		
		 Optional<Customer> result =customerRepository.findById(customerId);
			
			Customer theCustomer = null;
			
			if (result.isPresent()) {
				theCustomer = result.get();
			}
			else {
				// we didn't find the employee
				throw new RuntimeException("Did not find employee id - " + customerId);
			}
			
			return theCustomer;
		
		
	}

	@Override
	public void delete(int customerId) {
	
			customerRepository.deleteById(customerId);;
		
	}

	@Override
	public Customer checkLogin(String email, String password) {
		String encryptedPassword = HashGenerator.generateMD5(password);
		Customer details=customerRepository.checkLogin(email, encryptedPassword);
		
		
		return details;
		
		
		
		
	}
	



}

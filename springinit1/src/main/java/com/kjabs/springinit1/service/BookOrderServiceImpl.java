package com.kjabs.springinit1.service;


import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.kjabs.springinit1.DAO.BookOrderRepository;
import com.kjabs.springinit1.DAO.BookRepository;

import com.kjabs.springinit1.entity.Book;
import com.kjabs.springinit1.entity.BookOrder;
import com.kjabs.springinit1.entity.Category;
import com.kjabs.springinit1.entity.Customer;
import com.kjabs.springinit1.entity.Users;

@Service
public class BookOrderServiceImpl implements BookOrderService{
	
    private  BookOrderRepository bookOrderRepository;
	
	public BookOrderServiceImpl (BookOrderRepository theBookOrderRepository)
	{
		bookOrderRepository=theBookOrderRepository;
		
	}

	

	@Override
	public List<BookOrder> getAllBookOrders() {
	
		List<BookOrder> bookOrders=bookOrderRepository.findAll();
	
		return bookOrders;
		
	}


    @Override
    public BookOrder bookOrderDetails(int OrderId) {
    	
    	Optional<BookOrder> bookOrderDetails=bookOrderRepository.findById(OrderId);
        BookOrder orderDetails = null;
		
		if (bookOrderDetails.isPresent()) {
			orderDetails = bookOrderDetails.get();
		}
		else {
			// we didn't find the employee
			throw new RuntimeException("Did not find order id - " + OrderId);
		}
		
		return orderDetails;
    	
    }



	@Override
	public void save(BookOrder bookOrder) {
		
		bookOrderRepository.save(bookOrder);
		
		
		
	}



	@Override
	public List<BookOrder> findByCustomer(Customer customer) {
		
		List<BookOrder> orders=bookOrderRepository.findByCustomer(customer);
		return orders;
		
	}



	 public BookOrder findByIdAndCustomerId(Integer OrderId,int CustomerId) {
		
		 BookOrder bookOrderDetails=bookOrderRepository.findByIdAndCustomerId(OrderId, CustomerId);
		 if(bookOrderDetails==null)
		 {
			 throw new RuntimeException("Did not find order id  ");
		 }
		 else
		 {
	     return bookOrderDetails;
		 }
		 
	 }



	@Override
	public BookOrder getBookById(int orderId) {
		
        Optional<BookOrder> result =bookOrderRepository.findById(orderId);
		
		BookOrder theOrder = null;
		
		if (result.isPresent()) {
			theOrder = result.get();
		}
		else {
			// we didn't find the employee
			throw new RuntimeException("Did not find employee id - " + orderId);
		}
		
		return theOrder;
	
		
	}
	
	
	@Override
	public void delete(int orderId) {
		
		 bookOrderRepository.deleteById(orderId);
		
	}	
	





	


}

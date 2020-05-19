package com.kjabs.springinit1.service;

import java.util.List;

import org.springframework.data.repository.query.Param;

import com.kjabs.springinit1.entity.Book;
import com.kjabs.springinit1.entity.BookOrder;
import com.kjabs.springinit1.entity.Category;
import com.kjabs.springinit1.entity.Customer;

public interface BookOrderService {
	
	public List<BookOrder> getAllBookOrders();

	public BookOrder bookOrderDetails(int OrderId);
	
	public void save(BookOrder bookOrder);

	public List<BookOrder> findByCustomer(Customer customer);
	
	 public BookOrder findByIdAndCustomerId(Integer OrderId,int CustomerId);

	public BookOrder getBookById(int orderId);

	public void delete(int orderId);
}

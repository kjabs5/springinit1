package com.kjabs.springinit1.DAO;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.kjabs.springinit1.entity.Book;
import com.kjabs.springinit1.entity.BookOrder;
import com.kjabs.springinit1.entity.Category;
import com.kjabs.springinit1.entity.Customer;

public interface BookOrderRepository extends JpaRepository<BookOrder,Integer>{

	public List<BookOrder> findByCustomer(Customer customer);
	


	@Query(value="SELECT * from book_order where order_id=?1 and customer_id=?2",nativeQuery=true)
	public BookOrder findByIdAndCustomerId(Integer orderId, int customerId);
	
   // public BookOrder findByIdAndCustomerId(int OrderId,int CustomerId);
	
}

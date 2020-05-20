package com.kjabs.springinit1.DAO;

import java.util.List;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.kjabs.springinit1.entity.Book;
import com.kjabs.springinit1.entity.Category;



public interface BookRepository extends JpaRepository<Book, Integer>{


	public List<Book> findByCategory(Category id);
	
	@Query(value="SELECT * FROM book ORDER BY Publish_Date DESC limit 4",nativeQuery=true)
	//public List<Book> findTopN(@Param("limit") int limit);
	public List<Book> findTopN();
	
	@Query(value="SELECT book_id,SUM(quantity) FROM order_detail GROUP BY book_id ORDER BY sum(quantity) DESC limit 4",nativeQuery=true)
	public List<Book> findMostSellingBooks();
	
	@Query(value="SELECT review.book_id,book.publish_date,book.title,book.author,book.Category_Id,book.description,book.file_name,book.ISBN,book.last_update_time,book.price,Count(review.book_id) as ReviewCount,AVG(review.rating) as AvgRating from review inner join book on book.book_id=review.book_id GROUP BY book_id having AVG(rating) >=3.5 ORDER BY ReviewCount DESC, AvgRating DESC limit 4",nativeQuery=true)
    public List<Book> findMostFavouredBooks();
	
	public List<Book> findBytitleContainsAllIgnoreCase(String theName);
	
	public List<Book> findBytitleContainsOrDescriptionContainsAllIgnoreCase(String theName, String Description);
	
	@Query(value="SELECT Count(1) from book b where b.Category_Id=?1",nativeQuery=true)
    public int countBook(int CategoryId);
	
	
}

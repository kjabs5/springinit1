package com.kjabs.springinit1.service;

import java.util.List;

import org.springframework.data.repository.query.Param;

import com.kjabs.springinit1.entity.Book;
import com.kjabs.springinit1.entity.Category;

public interface BookService {
	
	public List<Book> getAllBooks();
	
	public void SaveOrUpdate(Book theBook);

	public Book getBookById(int bookId);

	public void delete(int bookId);
	
	public List<Book> findByCategory(Category id);
	
	//public List<Book> listNewBooks();
	public List<Book> findTopN();
	
	public List<Book> findMostSellingBooks();

	public List<Book> searchBy(String theName);
	
	public List<Book> searchByDesc(String theName);
	
	public int CountBook(int CategoryId);
	

}

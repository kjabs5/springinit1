package com.kjabs.springinit1.service;


import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.kjabs.springinit1.DAO.BookRepository;

import com.kjabs.springinit1.entity.Book;
import com.kjabs.springinit1.entity.Category;
import com.kjabs.springinit1.entity.Users;

@Service
public class BookServiceImpl implements BookService{
	
    private  BookRepository bookRepository;
	
	public BookServiceImpl (BookRepository theBookRepository)
	{
		bookRepository=theBookRepository;
		
	}

	

	@Override
	public List<Book> getAllBooks() {
	
		List<Book> books=bookRepository.findAll();
	
		return books;
		
	}



	@Override
	public void SaveOrUpdate(Book theBook) {
		
		bookRepository.save(theBook);	
		
		
	}



	@Override
	public Book getBookById(int bookId) {
		
    Optional<Book> result =bookRepository.findById(bookId);
		
		Book theBook = null;
		
		if (result.isPresent()) {
			theBook = result.get();
		}
		else {
			// we didn't find the employee
			throw new RuntimeException("Did not find employee id - " + bookId);
		}
		
		return theBook;
		
	}



	@Override
	public void delete(int bookId) {
		
		 bookRepository.deleteById(bookId);
		
	}



	@Override
	public List<Book> findByCategory(Category id) {
		List<Book> books=bookRepository.findByCategory(id);
		return books;
	}



	@Override
	public List<Book> findTopN() {
		return bookRepository.findTopN();
	}
	
	@Override
	public List<Book> findMostSellingBooks() {
		return bookRepository.findMostSellingBooks();
	}
     
	@Override
	 public List<Book> findMostFavouredBooks(){
		return bookRepository.findMostFavouredBooks(); 
	 }

	@Override
	public List<Book> searchBy(String theName) {
		
		List<Book> results = null;
		
		if (theName != null && (theName.trim().length() > 0)) {
			results = bookRepository.findBytitleContainsAllIgnoreCase(theName);
		}
		else {
			results = getAllBooks();
		}
		
		return results;
	}



	@Override
	public List<Book> searchByDesc(String theName) {
		
		List<Book> results = null;
		
		if (theName != null && (theName.trim().length() > 0)) {
			results = bookRepository.findBytitleContainsOrDescriptionContainsAllIgnoreCase(theName,theName);
		}
		else {
			results = getAllBooks();
		}
		
		return results;
	
	}



	@Override
	public int CountBook(int CategoryId) {
		int count=bookRepository.countBook(CategoryId);
		return count;
	}



	//@Override
	//public List<Book> listNewBooks() {
	//	List <Book> newBooks=bookRepository.findTop4ByAuthorOrderByPublishDateDesc();
	//	return newBooks;
	//}



	







	


}

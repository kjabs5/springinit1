package com.kjabs.springinit1.service;

import java.util.List;

import com.kjabs.springinit1.entity.Book;
import com.kjabs.springinit1.entity.Category;

public interface CategoryService {
	
	public List<Category> getAllCategories();

	public void SaveOrUpdate(Category theCategory);
	
	public Category getCategoryById(int categoryId);
	

	
	public void delete(int categoryId);
	
    public List<Book> books(int id);
}

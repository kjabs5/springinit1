package com.kjabs.springinit1.service;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.kjabs.springinit1.DAO.CategoryRepository;
import com.kjabs.springinit1.entity.Book;
import com.kjabs.springinit1.entity.Category;

@Service
public class CategoryServiceImpl implements CategoryService {
	
	
	private CategoryRepository categoryRepository;
	
	public CategoryServiceImpl (CategoryRepository theCategoryRepository)
	{
		categoryRepository=theCategoryRepository;
		
	}

	@Override
	public List<Category> getAllCategories() {
		
		List<Category> categories= categoryRepository.findAll();
		return categories;
		
	}

	@Override
	public void SaveOrUpdate(Category theCategory) {

	categoryRepository.save(theCategory);
		
	}

	@Override
	public Category getCategoryById(int categoryId) {
		
        Optional<Category> result = categoryRepository.findById(categoryId);
		
		Category category = null;
		
		if (result.isPresent()) {
			category = result.get();
		}
		else {
			// we didn't find the employee
			throw new RuntimeException("Did not find employee id - " + categoryId);
		}
		
		return category;
	}

	@Override
	public void delete(int categoryId) {
		
		 categoryRepository.deleteById(categoryId);

	}

	@Override
	public List<Book> books(int id) {
		
		List<Book> books=categoryRepository.books(id);
		return books;
		
	}


	
	
}

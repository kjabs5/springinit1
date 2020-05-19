package com.kjabs.springinit1.DAO;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.kjabs.springinit1.entity.Book;
import com.kjabs.springinit1.entity.Category;

public interface CategoryRepository extends JpaRepository<Category, Integer>  {

	
	
	public List<Book> books(int id);
}

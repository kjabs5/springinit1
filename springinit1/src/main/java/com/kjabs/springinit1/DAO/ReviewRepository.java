package com.kjabs.springinit1.DAO;

import java.util.List;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.kjabs.springinit1.entity.Review;
import com.kjabs.springinit1.entity.Book;
import com.kjabs.springinit1.entity.Category;



public interface ReviewRepository extends JpaRepository<Review,Integer>{


	
	
}

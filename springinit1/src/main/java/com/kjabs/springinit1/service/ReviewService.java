package com.kjabs.springinit1.service;

import java.util.List;

import org.springframework.data.repository.query.Param;

import com.kjabs.springinit1.entity.Book;
import com.kjabs.springinit1.entity.Category;
import com.kjabs.springinit1.entity.Review;

public interface ReviewService {
	
	public List<Review> getAllReviews();
	
	public void SaveReview(Review theReview);
	

}

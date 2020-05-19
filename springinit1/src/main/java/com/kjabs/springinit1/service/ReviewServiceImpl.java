package com.kjabs.springinit1.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.kjabs.springinit1.DAO.ReviewRepository;
import com.kjabs.springinit1.entity.Review;
@Service
public class ReviewServiceImpl implements ReviewService{
	
	private ReviewRepository reviewRepository;
	
	public ReviewServiceImpl(ReviewRepository theReviewRepository)
	{
		reviewRepository=theReviewRepository;
	}
	
	
	
	public List<Review> getAllReviews(){
		
		List<Review> reviews=reviewRepository.findAll();
		return reviews;
	}



	@Override
	public void SaveReview(Review theReview) {
		reviewRepository.save(theReview);
		
	}

}

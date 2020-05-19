package com.kjabs.springinit1.entity;

import java.util.Base64;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;



@Entity
@Table(name="book")
public class Book implements java.io.Serializable{
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    @Column(name="Book_id")
	private Integer bookId;
    
    @ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="Category_Id")
   	private Category category;
    
    @Column(name="Title")
	private String title;
    
    @Column(name="Author")
	private String author;
    
    @Column(name="Description")
	private String description;
    
    @Column(name="ISBN")
	private String isbn;
    
   // @Column(name="Image")
	//private byte[] image;
    
    @Transient
    private String base64Image;
    
    @Column(name="Price")
	private float price;
    

    
    @Temporal(TemporalType.DATE)
    @Column(name="Publish_Date")
	private Date publishDate;
    
    @Temporal(TemporalType.TIMESTAMP)
    @Column(name="Last_Update_Time")
   	private Date lastUpdateTime;
    
    @Column(name="file_name")
	private String file_name;
    
    @OneToMany(fetch=FetchType.LAZY, 
    		cascade=CascadeType.ALL,
    		mappedBy="book")
    private List<Review> reviews;
    
    @OneToMany(fetch=FetchType.LAZY, 
    		cascade=CascadeType.ALL,
    		mappedBy="book")
    private Set<OrderDetail> orderDetail= new HashSet<OrderDetail>(0);
    //private List<OrderDetail> orderDetails1;
   
    //private Set<Review> review= new HashSet<Review>(0);
    //private Set<OrderDetail> orderDetail= new HashSet<OrderDetail>(0);
    public Book() {
		super();
	}
    
    public Book(Integer bookId)
    {
    	super();
    	this.bookId=bookId;
    }
    
    
    
    
 

public Book(Integer bookId, Category category, String title, String author, String description, String isbn,
			String base64Image, float price, Date publishDate, Date lastUpdateTime, String file_name,
			List<Review> reviews, Set<OrderDetail> orderDetail) {
		super();
		this.bookId = bookId;
		this.category = category;
		this.title = title;
		this.author = author;
		this.description = description;
		this.isbn = isbn;
		this.base64Image = base64Image;
		this.price = price;
		this.publishDate = publishDate;
		this.lastUpdateTime = lastUpdateTime;
		this.file_name = file_name;
		this.reviews = reviews;
		this.orderDetail = orderDetail;
	}

//	public Book(Integer bookId, Category category, String title, String author, String description, String isbn,
//			String base64Image, float price, Date publishDate, Date lastUpdateTime, String file_name,
//			List<Review> reviews, List<OrderDetail> orderDetails1) {
//		super();
//		this.bookId = bookId;
//		this.category = category;
//		this.title = title;
//		this.author = author;
//		this.description = description;
//		this.isbn = isbn;
//		this.base64Image = base64Image;
//		this.price = price;
//		this.publishDate = publishDate;
//		this.lastUpdateTime = lastUpdateTime;
//		this.file_name = file_name;
//		this.reviews = reviews;
//		this.orderDetails1 = orderDetails1;
//	}



	public Category getCategory() {
		return category;
	}


	public Integer getBookId() {
		return bookId;
	}

	public void setBookId(Integer bookId) {
		this.bookId = bookId;
	}

	public void setCategory(Category category) {
		this.category = category;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getAuthor() {
		return author;
	}


	public void setAuthor(String author) {
		this.author = author;
	}


	public String getDescription() {
		return description;
	}


	public void setDescription(String description) {
		this.description = description;
	}


	public String getIsbn() {
		return isbn;
	}


	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}


//	public byte[] getImage() {
//		return image;
//	}
//
//
//	public void setImage(byte[] image) {
//		this.image = image;
//	}


	public float getPrice() {
		return price;
	}


	public void setPrice(float price) {
		this.price = price;
	}


	

	public Date getPublishDate() {
		return publishDate;
	}


	public void setPublishDate(Date publishDate) {
		this.publishDate = publishDate;
	}


	public Date getLastUpdateTime() {
		return lastUpdateTime;
	}


	public void setLastUpdateTime(Date lastUpdateTime) {
		this.lastUpdateTime = lastUpdateTime;
	}

	public String getFile_name() {
		return file_name;
	}


	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}
	
	
    
	
	

//	public List<OrderDetail> getOrderDetails1() {
//		return orderDetails1;
//	}
//
//	public void setOrderDetails1(List<OrderDetail> orderDetails1) {
//		this.orderDetails1 = orderDetails1;
//	}

	public Set<OrderDetail> getOrderDetail() {
		return orderDetail;
	}

	public void setOrderDetail(Set<OrderDetail> orderDetail) {
		this.orderDetail = orderDetail;
	}

	public List<Review> getReviews() {
		
		Collections.sort(reviews,new Comparator<Review>() {

			@Override
			public int compare(Review review1, Review review2) {
				return review2.getReviewTime().compareTo(review1.getReviewTime());
			}});
		return reviews;
		
//		List<Review> sortedReviews= new List<>(new Comparator<Review>() {
//
//			@Override
//			public int compare(Review review1, Review review2) {
//				
//				return review2.getReviewTime().compareTo(review1.getReviewTime());
//			}});
//		sortedReviews.addAll(reviews);
//		
//		return sortedReviews;
	}


	public void setReviews(List<Review> reviews) {
		this.reviews = reviews;
	}
    
	@Transient
	public float rating()
	{
		float rating=0.0f;
		float sum=0.0f;
		
		if(reviews.isEmpty())
		{
			return 0.0f;
		}
  
		for(Review review: reviews)
		{
		sum+=review.getRating();
		}
		rating=sum/reviews.size();
		
	
		return rating;
		
	}
	
	@Transient
	public String getRatingString(float rating)
	{  
		
		String result="";
		int numberOfStarsOn=(int) rating;
		
		
		
		for(int i=1;i<=numberOfStarsOn;i++)
		{
			result+="on,";
		
//			System.out.println("no enter loop:"+result.length());
		}
		
		if(rating>numberOfStarsOn)
		{
			result+="half,";
			
	//		System.out.println("no enter loop:"+result.length());
		}
//		System.out.println("no enter loop:"+result.length());
		int next=numberOfStarsOn + 1;
		if(result.length()<17)
		{
			if(result.length()==8)
			{
				for(int j=next+1;j<=5;j++)
				{  
//					System.out.println("enter loop");
					result+="off,";
					
				}
			}
			else if(result.length()==11)
			{
				for(int j=next+1;j<=5;j++)
				{  
//					System.out.println("enter loop");
					result+="off,";
					
				}
			}
			else if(result.length()==14)
			{
				for(int j=next+1;j<=5;j++)
				{  
//					System.out.println("enter loop");
					result+="off,";
					
				}
			}
			else
			{
		for(int j=next;j<=5;j++)
		{  
//			System.out.println("enter loop");
			result+="off,";
			
		}
			}
		}
		
		
		
		return result.substring(0,result.length()-1);
	}
     
	@Transient
	public String getRatingStars() {
		float rating=rating();
		return getRatingString(rating);
	}
	
	

	@Transient
	public String getBase64Image() {
	//	this.base64Image=Base64.getEncoder().encodeToString(this.image);
		return this.base64Image;
	}
	@Transient
	public void setBase64Image(String Base64) {
		this.base64Image=Base64;
	}
	
	@Override
	public int hashCode()
	{
		final int prime=31;
		int result=1;
		result=prime*result+((bookId==null)? 0 : bookId.hashCode());
		return result;
	}

    @Override
    public boolean equals(Object obj) {
    	
    	if(this==obj)
    	 return true;
    	if(obj==null) 
    	 return false;
    	if(getClass()!=obj.getClass())
    	 return false;
    	Book other=(Book) obj;
    	if(bookId==null)
    	{
    	  if(other.bookId !=null)
    	    return false;
    	}else if(!bookId.equals(other.bookId))
    	  return false;
    	
    	return true;
    
    	
    	
    }




	
	//public Set<Review> getReview() {
	//	return review;
	//}


	//public void setReview(Set<Review> review) {
	//	this.review = review;
	//}


	//public Set<OrderDetail> getOrderDetail() {
		//return orderDetail;
	//}


	//public void setOrderDetail(Set<OrderDetail> orderDetail) {
		//this.orderDetail = orderDetail;
	//}


	

    
    
    
}

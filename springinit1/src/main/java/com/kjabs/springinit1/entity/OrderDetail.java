package com.kjabs.springinit1.entity;

import javax.persistence.AttributeOverride;
import javax.persistence.AttributeOverrides;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="order_detail")
public class OrderDetail implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@EmbeddedId
	@AttributeOverrides({
		@AttributeOverride(name="bookId",column=@Column(name="Book_id",nullable=false)),
		@AttributeOverride(name="orderId",column=@Column(name="order_id",nullable=false))
	})
	private OrderDetailId id=new OrderDetailId();
	
	@ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="Book_id",insertable=false,updatable=false,nullable=false)
	private Book book;
	
	

	@ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="order_id",insertable=false,updatable=false,nullable=false)
	private BookOrder bookOrder;
	
	@Column(name="quantity")
	private int Quantity;
	
	@Column(name="sub_total")
	private float subtotal;
	
	public OrderDetail() {
		super();
	}
	
	public OrderDetail(OrderDetailId id)
	{
		this.id=id;
	}

	
    
	
	public OrderDetail(OrderDetailId id, Book book, BookOrder bookOrder, int quantity, float subtotal) {
		super();
		this.id = id;
		this.book = book;
		this.bookOrder = bookOrder;
		this.Quantity = quantity;
		this.subtotal = subtotal;
	}

	public OrderDetailId getId() {
		return id;
	}

	public void setId(OrderDetailId id) {
		this.id = id;
	}

	

	
	public Book getBook() {
		return book;
	}

	public void setBook(Book book) {
		this.book = book;
		this.id.setBook(book);
	}

	public BookOrder getBookOrder() {
		return bookOrder;
	}

	public void setBookOrder(BookOrder bookOrder) {
		this.bookOrder = bookOrder;
		this.id.setBookOrder(bookOrder);
	}

	
	public int getQuantity() {
		return Quantity;
	}

	public void setQuantity(int quantity) {
		Quantity = quantity;
	}

	public float getSubtotal() {
		return subtotal;
	}

	public void setSubtotal(float subtotal) {
		this.subtotal = subtotal;
	}
	
	@Override
	public String toString() {
		return "OrderDetail [id=" + id + ", book=" + book + ", bookOrder=" + bookOrder + ", Quantity=" + Quantity
				+ ", subtotal=" + subtotal + "]";
	}

	

	
	





    
	

	
	
	

	

}

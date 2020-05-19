package com.kjabs.springinit1.entity;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="category")
public class Category {
	
	    @Id
	    @GeneratedValue(strategy=GenerationType.IDENTITY)
	    @Column(name="category_id")
		private int id;
	    
	    @Column(name="name")
		private String name;
	    
	    @OneToMany(fetch=FetchType.LAZY, 
	    		cascade=CascadeType.ALL,
	    		mappedBy="category")
	    private List<Book> books;
	    

	

		public Category() {
			super();
		}
		
		

		public Category(int id, String name, List<Book> books) {
			super();
			this.id = id;
			this.name = name;
			this.books = books;
		}



		public int getId() {
			return id;
		}

		public void setId(int id) {
			this.id = id;
		}

		public String getName() {
			return name;
		}

		public void setName(String name) {
			this.name = name;
		}
	 
		
		
		public List<Book> getBooks() {
			return books;
		}



		public void setBooks(List<Book> books) {
			this.books = books;
		}



		@Override
		public String toString() {
			return "Category [id=" + id + ", name=" + name + "]";
		}
	    
	
	
	

}

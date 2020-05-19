package com.kjabs.springinit1.entity;

import java.util.Date;
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
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name="customer")
public class Customer{
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    @Column(name="customer_id")
	private int customerId;
    
    @Column(name="fullname")
	private String fullname;
    
    @Column(name="address")
	private String address;
    
    @Column(name="email")
	private String email;
    
    @Column(name="city")
	private String city;
    
    @Column(name="country")
	private String country;
    
    @Column(name="phone")
	private String phone;
    
    @Column(name="zipcode")
	private String zipcode;
    
    @Column(name="password")
   	private String password;
    
    @Column(name="register_date")
    @Temporal(TemporalType.TIMESTAMP)
   	private Date register_date;
    
    @OneToMany(fetch=FetchType.LAZY, 
    		cascade=CascadeType.ALL,
    		mappedBy="customer")
    private List<Review> reviews;
    
    public Customer()
    {
    	
    }

	public Customer(int customerId, String fullname, String address, String email, String city, String country,
			String phone, String zipcode, String password, Date register_date, List<Review> reviews) {
		super();
		this.customerId = customerId;
		this.fullname = fullname;
		this.address = address;
		this.email = email;
		this.city = city;
		this.country = country;
		this.phone = phone;
		this.zipcode = zipcode;
		this.password = password;
		this.register_date = register_date;
		this.reviews = reviews;
	}





	public int getCustomerId() {
		return customerId;
	}

	public void setCustomerId(int customerId) {
		this.customerId = customerId;
	}

	

	public String getFullname() {
		return fullname;
	}



	public void setFullname(String fullname) {
		this.fullname = fullname;
	}



	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getZipcode() {
		return zipcode;
	}

	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Date getRegister_date() {
		return register_date;
	}

	public void setRegister_date(Date register_date) {
		this.register_date = register_date;
	}

	public List<Review> getReviews() {
		return reviews;
	}

	public void setReviews(List<Review> reviews) {
		this.reviews = reviews;
	}
	
	
    
    
    
    
}

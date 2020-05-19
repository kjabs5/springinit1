package com.kjabs.springinit1.DAO;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.kjabs.springinit1.entity.Customer;
@Repository
public interface CustomerRepository extends JpaRepository<Customer, Integer> {
	
	@Query(value="SELECT c.email from customer c where c.email=?1",nativeQuery=true)
    public String checkemail(String email);

	@Query(value="SELECT * from customer where email=?1 and password=?2",nativeQuery=true)
	public Customer checkLogin(String email, String password);

	
}

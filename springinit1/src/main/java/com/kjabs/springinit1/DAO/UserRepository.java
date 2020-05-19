package com.kjabs.springinit1.DAO;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.kjabs.springinit1.entity.Users;
@Repository
public interface UserRepository extends JpaRepository<Users, Integer> {

}

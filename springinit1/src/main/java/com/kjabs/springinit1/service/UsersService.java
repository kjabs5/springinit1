package com.kjabs.springinit1.service;

import java.util.List;


import com.kjabs.springinit1.entity.Users;

public interface UsersService {
	
	public List<Users> getAllUsers();
	
	public void saveOrUpdate(Users theUser);
	
	public Users getUserById(int userId);
	
	public void delete(int userId);

}

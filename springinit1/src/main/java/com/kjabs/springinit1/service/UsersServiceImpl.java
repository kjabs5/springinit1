package com.kjabs.springinit1.service;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;


import com.kjabs.springinit1.DAO.UserRepository;

import com.kjabs.springinit1.entity.Users;
@Service
public class UsersServiceImpl implements UsersService {

	
    private UserRepository theUserRepository;
	
	public UsersServiceImpl(UserRepository usersRepository)
	{
		theUserRepository=usersRepository;
	}

	@Override
	public List<Users> getAllUsers() {
		
		List<Users> users= theUserRepository.findAll();
		return users;
	}

	@Override
	public void saveOrUpdate(Users theUser) {
		theUserRepository.save(theUser);
		
	}

	@Override
	public Users getUserById(int userId) {
	
	Optional<Users> result = theUserRepository.findById(userId);
		
		Users theUser = null;
		
		if (result.isPresent()) {
			theUser = result.get();
		}
		else {
			// we didn't find the employee
			throw new RuntimeException("Did not find employee id - " + userId);
		}
		
		return theUser;
		
	}

	@Override
	public void delete(int userId) {
		// TODO Auto-generated method stub
		theUserRepository.deleteById(userId);
	}

}

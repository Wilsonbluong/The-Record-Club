package com.wilsonbluong.javaproject.repositories;

import java.util.List;


import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.wilsonbluong.javaproject.models.User;

@Repository
public interface UserRepository extends CrudRepository<User, Long> {
	
	User findByEmail(String email);
	 
	// this method retrieves all the users from the database
	List<User> findAll();

}

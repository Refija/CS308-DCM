package com.journaldev.spring.service;

import java.util.List;

import com.journaldev.spring.model.User;

public interface UserService {

	public void addUser(User u);
	public void updateUser(User u);
	public List<User> listUsers();
	public User getUserById(int id);
	public void removeUser(int id);
	
}

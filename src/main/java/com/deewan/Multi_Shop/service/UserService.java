package com.deewan.Multi_Shop.service;

import com.deewan.Multi_Shop.connection.DataBase;
import com.deewan.Multi_Shop.dao.UserDao;
import com.deewan.Multi_Shop.dto.UserDto;

public class UserService {
	UserDao userDao=new UserDao(DataBase.getConnection());

	public void saveUserService(UserDto userDto) {
		userDao.saveUser(userDto);
	}
	public UserDto getSingleUserDetail(String userEmail) {
		return userDao.getSingleUserDetail(userEmail);
	}
	public String getUserEmailService(String email) {
		return userDao.getUserEmail(email);
	}

}

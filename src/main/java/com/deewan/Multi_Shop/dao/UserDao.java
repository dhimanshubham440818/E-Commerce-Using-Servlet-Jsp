package com.deewan.Multi_Shop.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.deewan.Multi_Shop.dto.UserDto;

public class UserDao {
	Connection connection;

	public UserDao(Connection connection) {
		this.connection = connection;
	}

	public boolean saveUser(UserDto userDto) {
		String insertQuery = "INSERT INTO user(email,firstName,lastName,address,state,country,zipcode,mobile,city) VALUES(?,?,?,?,?,?,?,?,?)";
		try {
			PreparedStatement preparedStatement = connection.prepareStatement(insertQuery);
			preparedStatement.setString(1, userDto.getUserEmail());
			preparedStatement.setString(2, userDto.getUserFirstname());
			preparedStatement.setString(3, userDto.getUserLastname());
			preparedStatement.setString(4, userDto.getUserAddress());
			preparedStatement.setString(5, userDto.getUserState());
			preparedStatement.setString(6, userDto.getUserCountry());
			preparedStatement.setInt(7, userDto.getUserZipCode());
			preparedStatement.setLong(8, userDto.getUserMobile());
			preparedStatement.setString(9, userDto.getUserCity());
			preparedStatement.execute();
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;

	}

	public String getUserEmail(String email){
		String insertQuery = "SELECT * FROM user WHERE email=?";
		try {
			PreparedStatement preparedStatement = connection.prepareStatement(insertQuery);
			preparedStatement.setString(1,email);
			ResultSet resultSet = preparedStatement.executeQuery();
//			UserDto userDto = new UserDto();
			if(resultSet.next()) {
				return resultSet.getString("email");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;

	}


	public UserDto getSingleUserDetail(String userEmail) {
		String insertQuery = "SELECT * FROM user WHERE email=?";
		try {
			PreparedStatement preparedStatement = connection.prepareStatement(insertQuery);
			preparedStatement.setString(1, "dhimanshubham@gmail.com");
			ResultSet resultSet = preparedStatement.executeQuery();
			UserDto userDto = new UserDto();
			while (resultSet.next()) {
				userDto.setUserEmail(resultSet.getString("email"));
				userDto.setUserFirstname(resultSet.getString("firstName"));
				userDto.setUserLastname(resultSet.getString("lastName"));
				userDto.setUserAddress(resultSet.getString("address"));
				userDto.setUserState(resultSet.getString("state"));
				userDto.setUserCountry(resultSet.getString("lastName"));
				userDto.setUserZipCode(resultSet.getInt("zipcode"));
				userDto.setUserMobile(resultSet.getLong("mobile"));
			}
			return userDto;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

}
package com.deewan.Multi_Shop.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.deewan.Multi_Shop.dto.ContactDto;

public class ContactDao {
	Connection connection = null;

	public ContactDao(Connection dbConnection) {
		connection = dbConnection;
	}

	public boolean saveContactDao(ContactDto contactDto) {
		String insertQuery = "INSERT INTO contact(name,email,subject,message) VALUES(?,?,?,?)";
		try {
			PreparedStatement preparedStatement = connection.prepareStatement(insertQuery);
			preparedStatement.setString(1, contactDto.getName());
			preparedStatement.setString(2, contactDto.getEmail());
			preparedStatement.setString(3, contactDto.getSubject());
			preparedStatement.setString(4,contactDto.getMessaage());
			preparedStatement.execute();
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
}

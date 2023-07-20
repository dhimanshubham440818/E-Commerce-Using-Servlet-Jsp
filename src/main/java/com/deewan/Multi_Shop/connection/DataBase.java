package com.deewan.Multi_Shop.connection;

import java.sql.Connection;
import java.sql.DriverManager;

public class DataBase {

	public static Connection getConnection() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/multi_shop";
			String user = "root";
			String passowrd = "12345678";
			return DriverManager.getConnection(url, user, passowrd);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return null;
	}

}
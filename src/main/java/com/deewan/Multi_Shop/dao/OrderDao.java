package com.deewan.Multi_Shop.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.deewan.Multi_Shop.dto.OrderDto;

public class OrderDao {
	Connection connection;
	public OrderDao(Connection connection) {
		this.connection=connection;
	}


	public void saveOrder(OrderDto orderDto) {
		try {
			String insertQuery="INSERT INTO userorder(id,name,price,image,quentity,email,categories,total) values(?,?,?,?,?,?,?,?)";
			PreparedStatement preparedStatement=connection.prepareStatement(insertQuery);
			preparedStatement.setInt(1, orderDto.getOrderItemProductId());
			preparedStatement.setString(2, orderDto.getOrderItemName());
			preparedStatement.setDouble(3, orderDto.getOrderItemPrice());
			preparedStatement.setString(4,orderDto.getOrderItemImage());
			preparedStatement.setInt(5, orderDto.getOrderItemQuentity());
			preparedStatement.setString(6, orderDto.getOrderItemUserEmail());
			preparedStatement.setString(7, orderDto.getProductCategories());
			preparedStatement.setDouble(8, orderDto.getOrderItemTotal());
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}


	public ArrayList<OrderDto> getAllOrder(String userEmail){
		try {
			String insertQuery="SELECT * FROM userorder WHERE email=?";
			PreparedStatement preparedStatement=connection.prepareStatement(insertQuery);
			preparedStatement.setString(1,userEmail);
			ResultSet resultSet=preparedStatement.executeQuery();
			ArrayList<OrderDto> orderDtoList=new ArrayList<>();
			while (resultSet.next()) {
				OrderDto orderDto=new OrderDto();
				orderDto.setOrderItemImage(resultSet.getString("image"));
				orderDto.setOrderItemName(resultSet.getString("name"));
				orderDto.setOrderItemPrice(resultSet.getDouble("price"));
				orderDto.setOrderItemQuentity(resultSet.getInt("quentity"));
				orderDto.setOrderItemProductId(resultSet.getInt("id"));

				orderDtoList.add(orderDto);
			}
			return orderDtoList;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return null;
	}

	public int deleteOrder(int productId){
		try {
			String deleteQuery="DELETE FROM userorder WHERE id=?";
			PreparedStatement preparedStatement=connection.prepareStatement(deleteQuery);
			preparedStatement.setInt(1,productId);
			return preparedStatement.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return 0;
	}
}

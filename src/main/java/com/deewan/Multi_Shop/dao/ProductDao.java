package com.deewan.Multi_Shop.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.deewan.Multi_Shop.dto.Product;

public class ProductDao {
	Connection connection = null;

	public ProductDao(Connection dbConnection) {
		connection = dbConnection;
	}

	public List<Product> getAllProduct() {
		String selectQuery = "SELECT * FROM product";
		try {
			Statement statement = connection.createStatement();
			ResultSet resultSet = statement.executeQuery(selectQuery);
			List<Product> productsList = new ArrayList<>();
			while (resultSet.next()) {
				Product product = new Product();
				product.setProductId(resultSet.getInt("productId"));
				product.setProductPrice(resultSet.getDouble("productPrice"));
				product.setProductName(resultSet.getString("productName"));
				product.setProductCategories(resultSet.getString("productCategories"));
				product.setProductImage(resultSet.getString("productImage"));
				product.setProductActualPrice(resultSet.getDouble("productActualPrice"));
				productsList.add(product);
			}
			return productsList;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	public Product getSingleProduct(int productId) {
		String selectQuery = "SELECT * FROM product WHERE productId="+productId;
		try {
			Statement statement = connection.createStatement();
			ResultSet resultSet = statement.executeQuery(selectQuery);
			Product product = new Product();
			while (resultSet.next()) {
				product.setProductId(resultSet.getInt("productId"));
				product.setProductPrice(resultSet.getDouble("productPrice"));
				product.setProductName(resultSet.getString("productName"));
				product.setProductCategories(resultSet.getString("productCategories"));
				product.setProductImage(resultSet.getString("productImage"));
				product.setProductActualPrice(resultSet.getDouble("productActualPrice"));
			}
			return product;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

}

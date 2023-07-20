package com.deewan.Multi_Shop.service;

import java.util.List;

import com.deewan.Multi_Shop.connection.DataBase;
import com.deewan.Multi_Shop.dao.ProductDao;
import com.deewan.Multi_Shop.dto.Product;

public class ProductService {
	ProductDao productDao = new ProductDao(DataBase.getConnection());

	public List<Product> getAllProductService() {
		return productDao.getAllProduct();
	}

	public Product getSingleProductService(int productId) {
		return productDao.getSingleProduct(productId);
	}
}

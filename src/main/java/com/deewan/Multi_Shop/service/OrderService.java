package com.deewan.Multi_Shop.service;

import java.util.ArrayList;

import com.deewan.Multi_Shop.connection.DataBase;
import com.deewan.Multi_Shop.dao.OrderDao;
import com.deewan.Multi_Shop.dto.OrderDto;

public class OrderService {
	OrderDao orderDao=new OrderDao(DataBase.getConnection());
	public void saveOrderService(OrderDto orderDto) {
		orderDao.saveOrder(orderDto);
	}
	public ArrayList<OrderDto> getOrderService(String userEmail) {
		return orderDao.getAllOrder(userEmail);
	}
	public int deleteOrderService(int productId) {
		 return orderDao.deleteOrder(productId);
	}
}

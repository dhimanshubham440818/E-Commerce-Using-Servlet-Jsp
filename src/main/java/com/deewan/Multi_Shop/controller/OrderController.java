package com.deewan.Multi_Shop.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.deewan.Multi_Shop.service.OrderService;

@SuppressWarnings("serial")
@WebServlet("/orders")
public class OrderController extends HttpServlet {
	OrderService orderService;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		orderService=new OrderService();
		orderService.deleteOrderService(Integer.parseInt(req.getParameter("productId")));
		RequestDispatcher dispatcher=req.getRequestDispatcher("orders.jsp");
		dispatcher.forward(req, resp);
	}
}
